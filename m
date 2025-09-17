Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04223CAC5A0
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF767615CB;
	Wed, 17 Sep 2025 16:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_yMt0Ajemb6; Wed, 17 Sep 2025 16:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1044C611C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1044C611C4;
	Wed, 17 Sep 2025 16:49:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C663A279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD2AC80BC7
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKsHLRRhlQt4 for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:49:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B07F80B9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B07F80B9C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B07F80B9C
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:49:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 48B942003AE;
 Wed, 17 Sep 2025 18:49:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 18:49:34 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 18:49:34 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250916001646.2480518-1-james.hilliard1@gmail.com>
References: <20250916001646.2480518-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ec67805ab79322734e7e5d1d5db8125d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758127775;
 bh=VDLwlu+SS4/J9Whm7MK3OXTxZQVfFqjVCeJ/ZojwGZg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G8MkNGcz2o7aagkK789MyQKZPzyqHhuAiP6wqtnVOrbO8d/JjnZ8S7a9QudmNmvLq
 YQsTRTEgPHOt+Dp0TwcUvVCR0zAu6DUxvGmjh7Y9C+qSBMrT8Vx7a0E1R2OvbuG1cw
 T9JRt4iFtPZJHk8qAvyv4rtRK5Y/cu54f0GjvI4Yy5kb7bBp7Yx+NZgZZ0r5e4NX0i
 5mJWblTLBllx3lfG405z6cIENnpoA3WO99kRP6TdWb6pbIFcX8LX9mLAZIYa+/fbFk
 eVJxzKUKWdfb/ippDL74/CHxgEv4XiwN/JaU6osNqKfbH4sK82Ux8ShPAKKfjfXKvl
 VRLMv3E6gy6pA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G8MkNGcz
Subject: Re: [Buildroot] [PATCH 1/1] package/python-multidict: bump to
 version 6.6.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/09/2025 02:16, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
