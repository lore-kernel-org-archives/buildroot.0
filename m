Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041A7C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3CED40590;
	Thu, 23 Feb 2023 22:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3CED40590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Lyx_gJ7PM9V; Thu, 23 Feb 2023 22:45:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF825405EF;
	Thu, 23 Feb 2023 22:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF825405EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA16A1BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0A0A60B8C
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0A0A60B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 55Je8xWnAokG for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:45:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64E4060AB3
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64E4060AB3
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:45:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CFEF1C0006;
 Thu, 23 Feb 2023 22:44:59 +0000 (UTC)
Date: Thu, 23 Feb 2023 23:44:59 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230223234459.0f7483fc@windsurf>
In-Reply-To: <20230223140606.208040-1-fontaine.fabrice@gmail.com>
References: <20230223140606.208040-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677192300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CjUjR7J3jqr/JTL365KTa3KcCjZ409uR8kRg/z1BDtc=;
 b=Hv0dKONjeZWicumEKnxAwlFSJD8wVMthEecEtuP7huIY7pz64WGtv0i5Yn/dDob3vRmgfn
 MW0FFiikHWMU2HOahojx8OfAn93W6Ha6gemwRJtKCrI8sv7cS4v2t626zf1zuiaR5TQzSB
 SptCvjD490hvA3awOpMwB+VQZi9Ox6S76f4Stj1KyQegwTaVHV+1svvv599JVBtSx4k2/b
 8nlonTfQoxvRgKEYjgP1/P02LgfXzr5U4inW+ayLqkk2C/KvYy5eo4TLMJ3ABBE+SV1PQB
 nGXDSgXk/jS4BZsnGv5YETIKdPMivOVmU0GB+SsyY4FRbJy6WZfqPUBudRGelg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hv0dKONj
Subject: Re: [Buildroot] [PATCH 1/1] package/erlang: fix build with libressl
 >= 3.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Will Newton <will.newton@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 23 Feb 2023 15:06:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with libressl >= 3.5.0 raised since bump
> to version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> api_ng.c: In function 'EVP_CIPHER_CTX_copy':
> api_ng.c:392:28: error: invalid use of incomplete typedef 'EVP_CIPHER_CTX' {aka 'const struct evp_cipher_ctx_st'}
>   392 |     if ((in == NULL) || (in->cipher == NULL))
>       |                            ^~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/90f7365d8477d35fca452b7b3f38babba086375e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0003-crypto-Fixes-for-LibreSSL-3-5-0.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
