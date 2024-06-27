Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4486AC2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 08:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0A40404D1;
	Thu, 27 Jun 2024 08:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnNCIO1B7pao; Thu, 27 Jun 2024 08:26:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA72040528
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA72040528;
	Thu, 27 Jun 2024 08:26:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0345F1BF3D5
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 08:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF9D384031
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 08:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHObc9rGcFlO for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 08:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 86EDE8402A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86EDE8402A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86EDE8402A
 for <buildroot@busybox.net>; Thu, 27 Jun 2024 08:26:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.119]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqs4Z-1siasg0Il7-00oQxd; Thu, 27
 Jun 2024 10:26:07 +0200
Date: Thu, 27 Jun 2024 10:26:06 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240627102606.7de6b9cd@gmx.net>
In-Reply-To: <20240627095029.2d1fa5c0@gmx.net>
References: <20240612135727.11811-1-ps.report@gmx.net>
 <20240612135727.11811-5-ps.report@gmx.net>
 <ZnqUPBAcDbB7ND64@tl-lnx-nyma7486-2>
 <Znql0FCAPG8jP+Lx@tl-lnx-nyma7486-2>
 <20240626103623.7d7412c0@gmx.net> <ZnxsxFK_KDUDM652@landeda>
 <20240627095029.2d1fa5c0@gmx.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:lJwM3Lnz5A4a9v0j94sfpuz1i2ezi3kJZIHq7juE9PH67KM7Me5
 QqigHyN0bJsWrj56agnVwpt2M0mUL5eFi3A7F3QlDabJB3sFTlg1Lt6ra4wnjX4EDq++btK
 hkFdtzM2e4joNNgf9OXNVR9sFtoppL4Dc4mQ+K/pMU/EgvPj0RnV4W+eG3GWbceBY6DM4xv
 hgBtZlEUNAPw6AUECtjxw==
UI-OutboundReport: notjunk:1;M01:P0:RtoNkiqK4f4=;pu0NscCGlEfpObwZ9Uakn5hMM10
 rtAMcyXV77vUdvA9p+TNYT2xqStMvm5Vd0329LtWdvs3hS9yRazj8CU+uLtTmS4AYol4+uGBa
 9VpreF1YRc+LOo26ugmxaZteqTqqBZQR9gU00F/7sn4u+RpTsXk+iMf5TX9XIxXOoo8GwyVaj
 gQJnjxHBn+2hfWGFP7zLSlBKncYb0TnbY7sXblE1VNe0utSKlNc4gPfyJ8sYSMiOu63GvsZF2
 KJ12h8B+ZgVMswO78BTum81dUayb2uUp1cBOYlJWVZsX1JCb/fa+/6m0GoBmmg0XO3ET/8KdE
 +WfwFJ/EEHNS3NZEJow7NsoB92HLIrNmL+mpkFHGx8aroFE1jRN078Rrv1Hn1XGoEBjA7f9Vy
 OeRaNmM6aJa4+hlaqj8CzkwAxJiHo1hILnkhjBm1HQdAKgQAcLANKoUp9VCkAaRbTLXQ7aYP4
 g4r/2nWQOyrM7WJ0Ny2tssb+ksUtNwPJRbOAhtQVnXw8lbZJXwVobgNpBw5CExXhQ9grFOI/C
 1a099uYaY3wjcyT0NQY/zdKj5C+tVyQKntGMRmneWWf6iBQGvTOTRxEqppA8oMDVb5aACiKG5
 ql4U/5hPh0m0SWlRR2efyMZ/eT0fdBUK0lkIvp9wV9vnzwhbLRTe8Vf1VALt2pl0CDYlJphFF
 pt+IVkc8Kaz0hL7RdYo/gmVEhWwvGJBCIg3ynEfon1paLIbEn8Mf5GNdzuO8Hv5+91RDdYl6R
 hsYQU9bsKsG23931XjFOA6H8QMC46chN7ChwEYhg+f0+IhDZG+9jwHZo77AAD+JyUMXf3Hpwd
 TdwfzEzAyawxPNZM78pycMRGTtmH2Wgt2RDdkTDOniTNA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719476767; x=1720081567; i=ps.report@gmx.net;
 bh=sYYaAP8ZslM5GpS8sXS84833iLl2SO2kmO9V7lhcTTs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Ey6dDiri4genLEIOJVrXQa2PAkqyOaYiB88uEOVrqw1GbAZuEsC6BuEVrRWsUdX4
 cV7BNawsmndOKgOJMFm7qzBYicprFl8MMxk2N4xuxXxDe2/E3NPgN0VwIm7AyHbea
 UxRcWymPUbMUpM8z55895cvsLdr/vDf0xS7QYHGg9hyBYfh4FUmkVaRFC9Qr5HB82
 tfayp/wZAN5Wt95b+qMCNhHn+FIC/0sCkl7c7upEXWO6GEaIsBSTWYRqUKwp/zwIW
 UqpLjvZIg2MX0OtN7AK2wrK9lCq3gWjB6ONjq3nuKwkl5w0lAe7XQHqYiRQedxnfe
 qNi5DCEav2JwqjbJrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Ey6dDiri
Subject: Re: [Buildroot] [PATCH v2 5/5] package/xz: convert to cmake build
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@busybox.net, yann.morin@orange.com,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jun 2024 09:50:29 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

[...]

> >
> > Anyway, I have now reverted that patch, as it was exposing another issue
> > with host-python3 (https://gitlab.com/buildroot.org/buildroot/-/issues/5)
>
> Yes, reverting the patch seems to be the best solution for the moment...

The following quick patch solves the host-xz and host-python3 build failures
for me:

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index b22b96849d..b22ccac85f 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -12,7 +12,7 @@ XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani

-XZ_CONF_OPTS = \
+XZ_COMMON_CONF_OPTS = \
 	-DENCODERS="lzma1;lzma2;delta;x86;powerpc;ia64;arm;armthumb;arm64;sparc;riscv" \
 	-DDECODERS="lzma1;lzma2;delta;x86;powerpc;ia64;arm;armthumb;arm64;sparc;riscv" \
 	-DMATCH_FINDERS="hc3;hc4;bt2;bt3;bt4" \
@@ -25,8 +25,9 @@ XZ_CONF_OPTS = \
 	-DENABLE_SMALL=OFF \
 	-DENABLE_SANDBOX=ON \
 	-DCREATE_XZ_SYMLINKS=ON \
-	-DCREATE_LZMA_SYMLINKS=ON \
-	-DBUILD_SHARED_LIBS=OFF
+	-DCREATE_LZMA_SYMLINKS=ON
+
+XZ_CONF_OPTS = $(XZ_COMMON_CONF_OPTS)

 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 XZ_CONF_OPTS += -DENABLE_NLS=ON
@@ -42,11 +43,11 @@ endif

 # we are built before ccache
 HOST_XZ_CONF_OPTS = \
-	$(XZ_CONF_OPTS) \
-	-DENABLE_NLS=ON \
+	$(XZ_COMMON_CONF_OPTS) \
+	-DENABLE_NLS=OFF \
 	-DENABLE_THREADS=ON \
 	-DCMAKE_C_COMPILER_LAUNCHER="" \
-	-DCMAKE_CXX_COMPILER_LAUNCHER==""
+	-DCMAKE_CXX_COMPILER_LAUNCHER=""

 $(eval $(cmake-package))
 $(eval $(host-cmake-package))

Regards,
Peter


>
> Maybe although reverting 'package/xz: explicitly specify all autoconf options'
> (and 'package/xz: enable year2038 option') as I used the same
> 'HOST_XZ_CONF_OPTS = $(XZ_CONF_OPTS)...' pattern here?
>
> Regards,
> Peter
>

[...]

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
