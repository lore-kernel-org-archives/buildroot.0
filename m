Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3D7C3ABB6
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 10:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCF88405C9;
	Mon,  5 May 2025 10:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1_yo9lIEYY7; Mon,  5 May 2025 10:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB765405E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB765405E6;
	Mon,  5 May 2025 10:43:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FAFA12E
 for <buildroot@buildroot.org>; Mon,  5 May 2025 10:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F26240786
 for <buildroot@buildroot.org>; Mon,  5 May 2025 10:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jvJqjA-5OaYA for <buildroot@buildroot.org>;
 Mon,  5 May 2025 10:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32035405E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32035405E6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32035405E6
 for <buildroot@buildroot.org>; Mon,  5 May 2025 10:43:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 423A6B00571;
 Mon,  5 May 2025 12:43:41 +0200 (CEST)
Received: from 2a01:cb1e:6e:dfc6:73ba:5b4d:f270:7c13
 via 2a01:cb1e:6e:dfc6:73ba:5b4d:f270:7c13 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 May 2025 12:43:41 +0200
MIME-Version: 1.0
Date: Mon, 05 May 2025 12:43:41 +0200
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250502162208.864286-1-james.hilliard1@gmail.com>
References: <20250502162208.864286-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ac0dd6a49f9d90f16ac716935ef9368b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746441823;
 bh=hCfl5GCZFvL1DmN2wMJwBcUZlxHaDkeUdrJ4p/uwp7U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DtAWJkcjIwlwfTEK8W/Q8zl9r5CePY9SVRIFdcAxdW6IYuNlhnpqnvIUwgnjellh0
 toXxC1EFDVoAnMUEecHCmT9qSuoWKLmnyGHMsB7rSaIYseH+eTvoVEna8yNfPn+1eo
 R2qZwnEC2qAlQ8qYAu9/UBidacclkVFjGk8vVWaj6lyXqYaCtV/IcIEMgS9JBqN2pf
 1rgoLFBUwl21ML+nIzyIABu2PtW+C4o+M3lMww2ysWrJT1N4MQnAVpLROW+p/mOb4A
 QsmFmlBQL8gtzRz6ZGQRcMsgtS+8srrpmho8F8II6+ijL5gPNx5orrShpm9B82zMn9
 3uhxhB8YM2LVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DtAWJkcj
Subject: Re: [Buildroot] [PATCH 1/1] package/hiredis: bump to version 1.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/05/2025 18:22, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master.

For info, I also added few extra info in the commit log. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/11c7d00a59bd263d1234086d8b769a4be397bde8

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
