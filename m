Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5700FE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E2D84126D;
	Sat, 11 Jan 2025 16:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5GPRVt3veei; Sat, 11 Jan 2025 16:26:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1339641246
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1339641246;
	Sat, 11 Jan 2025 16:26:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6376940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8648C410CA
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQmIyJNW6Oo7 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:26:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C39764123D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C39764123D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C39764123D
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:26:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8207813F89C;
 Sat, 11 Jan 2025 17:26:32 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46358])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 17:26:32 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 17:26:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20250111143523.2741916-1-james.hilliard1@gmail.com>
References: <20250111143523.2741916-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <74595787ad01c821b3795ff5e7ee3c77@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736612794;
 bh=wjtWkCnnEniv/40CS3rY+vP9MPcdL8/PKGsSxeFf72c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pHBmoHKjPTZMROSYJy7miwXkqnqKkP5KW3yVYwZeJITrG6jkR89Ujvd1LCE0bVRo8
 06mJA7zUiR2rUwvyH010dli1ikUZrXoFaehjhYLmNDxjd3T4LRCy4lqul7ZkdP2gql
 ycThOUY6gqDkSeqCjdL4Y4X3gPH28MJTiowekIiC98ObovgMPGk+p7LpgBjkRCc8Bh
 2pzVpt/Dtc3jDNVO5XvKQm0kvOctURS5jg7CBhVse9KATy1ncV5Hol1OMLRd5/vQ+A
 KttFqPHy35Txfwgy2cku6D41mOngyHryEWAQagh2qQdtEj0eoSmuHlC8nptB3hjcQM
 Rzph1KxJ6BECw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pHBmoHKj
Subject: Re: [Buildroot] [PATCH 1/1] package/python-modbus-tk: bump to
 version 1.1.4
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

On 11/01/2025 15:35, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
