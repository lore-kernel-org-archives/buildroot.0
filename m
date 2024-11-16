Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51041D68BE8
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 10:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 077BB848EA;
	Sat, 16 Nov 2024 10:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqxRtxSaSPAI; Sat, 16 Nov 2024 10:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16485848EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16485848EB;
	Sat, 16 Nov 2024 10:46:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10F321EB9
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 10:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F341B6111D
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 10:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1h7s8lYXk3U for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 10:46:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 09C9A61112
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09C9A61112
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09C9A61112
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 10:46:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C4D96B0054E;
 Sat, 16 Nov 2024 11:46:34 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47844])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 16 Nov 2024 11:46:34 +0100
MIME-Version: 1.0
Date: Sat, 16 Nov 2024 11:46:34 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@iliad-free.fr>
In-Reply-To: <20241115235757.43480-3-vjardin@free.fr>
References: <20241115235757.43480-1-vjardin@free.fr>
 <20241115235757.43480-3-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <3313806598076f4509530136ba913320@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731753997;
 bh=OyCiFvvI+iGdes8sdeyDnWJndL5DaEFybv68etB+Ae0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BqVSv4YYB24Ny1Hel3IzGPo/hS+4NuF/HPHKi4RaQ1+nNHn54mer/6itYR8HRDbzA
 6dx3ywaRch+6MrbIyr51QXaGxAigTv+L/YajHmk2B2DEzt7vV+7eS3BpaCESukS2tz
 w8HZrM1yUUtEOooKOjy0IrpngN/KFQhHFKQszHV99QRMCTgYn0szMCCsXlZLDyH9vX
 MBHQIOT5c4+0F7/8M6JSepHek8qKbHd9mjxjAi825p+l2c9SyVzEM50bKawZz5TO+I
 aNTW2zqJRlPwUXNrHB2rfKrfwNAMj9Mnz2Tz5ttLX6wUSnOXCN4ECduTxuS2hJDblW
 6mCDQ9Q9EGEVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BqVSv4YY
Subject: Re: [Buildroot] [PATCH v1 2/3] package/mstflint: fix cross
 compilation
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

Hi Vincent,

Thanks for the patches!

On 16/11/2024 00:57, Vincent Jardin wrote:
> Most mst tools cannot be cross compiled. This serie of patch
> that has been proposed for reviews to Mellanox enables a proper
> dynamic linkage along with proper paths for cross compilations.

This commit log imply you already know the previous patch
"package/mstflint: add new package" is broken.

Quoting:
https://buildroot.org/downloads/manual/manual.html#submitting-patches
"However, each patch must be complete. It is not allowed that the
build is broken when only the first but not the second patch is
applied. This is necessary to be able to use git bisect afterwards."

So I suggest one of the following option:

Option #1: you squash this patch with the previous one
"package/mstflint: add new package", or

Option #2: if your proposal in
https://github.com/Mellanox/mstflint/pull/1026
gets merged and a new release tag is made soon,
you resend a new version with this new tag including those
patches.

> The pull request is available at:
>   https://github.com/Mellanox/mstflint/pull/1026
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Signed-off-by: Vincent Jardin <vjardin@iliad-free.fr>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
