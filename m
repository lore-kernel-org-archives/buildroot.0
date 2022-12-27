Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F363CC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 19:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EEA3813F1;
	Tue, 27 Dec 2022 19:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EEA3813F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JEkJTROUbABT; Tue, 27 Dec 2022 19:48:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 877A2813EF;
	Tue, 27 Dec 2022 19:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 877A2813EF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C88E41BF5A4
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 19:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D5984018F
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 19:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D5984018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6sXEEU2uyoZW for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 19:48:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2205D400CE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2205D400CE
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 19:48:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9921D20003;
 Tue, 27 Dec 2022 19:48:29 +0000 (UTC)
Date: Tue, 27 Dec 2022 20:48:28 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221227204828.65c40fce@windsurf>
In-Reply-To: <20221226182111.279110-1-fontaine.fabrice@gmail.com>
References: <20221226182111.279110-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672170510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SclmhcgavnsitL1UmSszd1JgKt6rXbuum2mGWTtFBLQ=;
 b=dzXYVmosYZaVVX/yxWvEdF641VWPJp26DpFHwsKBtPQ+fMBoN6A4IxaOa6JcE2qYDHc2g+
 VaE3c7X++1LgzRsxQshObpvEG0IJ9tr5XILb2VDxOxNyWKfPtc+EntFZSkE2Bac8Nb1+KT
 O4J/boSbbVy2iNjea4QxUL7eJVyUtlokM39fe/LHPJUzUNrYS3OmPNiyhKpltlgH4ZPw9N
 DoulMLnRIrfXtu6VofWzPW1cHtZthPIQnBlvDMZRaiz5psNzlVTHfGVQ274/WsVkvBIXlQ
 +eweSDkyPSes53ZwBc5csZT80lxtxW3+vq0G/ORt8xXacpHQ42QKLO5FfPU/jA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dzXYVmos
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl_433: fix static openssl
 build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 26 Dec 2022 19:21:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following static openssl build failure raised since commit
> 7967755fbf25fe4d5860884bedb3e01fcd7e9855:
> 
> /home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-13/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_cert.o): in function `ssl_cert_free':
> ssl_cert.c:(.text+0x384): undefined reference to `__atomic_fetch_sub_4'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/417c86963ffe038aa052ea3cf19fd52c3e9b7396
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...se-pkg-config-to-detect-openssl-when.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch

I've seen the discussion with upstream, and you submitting an improved
patch upstream. Probably you want to submit a v2 in Buildroot with your
improved patch (which has been merged upstream)?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
