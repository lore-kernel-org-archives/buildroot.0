Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2388C04A68
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 15:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 392124090C;
	Tue, 26 Jul 2022 15:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 392124090C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfJm1BjIfEpo; Tue, 26 Jul 2022 15:43:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2AC0408B5;
	Tue, 26 Jul 2022 15:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2AC0408B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB6D41BF5A2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A147A408B5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A147A408B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mvhlwzglHeF4 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 15:43:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C63A540739
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C63A540739
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 15:43:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9946:e64:fb26:3d99])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4779F780510;
 Tue, 26 Jul 2022 17:43:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Jul 2022 17:43:21 +0200
Date: Tue, 26 Jul 2022 17:43:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Message-ID: <20220726154321.GL3168@scaer>
References: <20220726145646.1894310-1-nicolas.tran@smile.fr>
 <2a53c4f3-b7a2-f66e-e4c7-992e2f8d9de4@theobroma-systems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a53c4f3-b7a2-f66e-e4c7-992e2f8d9de4@theobroma-systems.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658850205;
 bh=YnslVZj8VtkGCQy1k3Ap6exH1Msy6dZoJIDm/I6G/uE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KrOag1c0OTNM4X5Zer6pk65sP8MLxLJi8qQoCcvyzIwWvYgxcVGMH1DGD94sFSWhM
 vYdMKNfJPtySQ68jHwYiJOnQboHwWp5TC7KDwIxvuW9Tj1ivHlDodpBZG3NDZenp1V
 M9O2qUryJ/9JWo6vVBBT53KBT/7uH9TJWW0az5eBH3JWyjFE4DaB39YgEsQQx9sqSI
 UUg6g7BWTaSc+WpCAeNySov6YCtqit4l4CQG5bh9W4jZy7vArYzSU/hRrQgjIj4CL2
 WXETD0Kygqrwt6wlKPrBWck1nDYMepMPb/qfE6wsGY0/cUX3FWA4TqnHFTb4WY4W0X
 cW4ROC1ymGh8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KrOag1c0
Subject: Re: [Buildroot] [PATCH 1/1] new package: package/dust
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
Cc: Nicolas Tran <nicolas.tran@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quentin, All,

On 2022-07-26 17:13 +0200, Quentin Schulz spake thusly:
> On 7/26/22 16:56, Nicolas Tran wrote:
> >dust is an alternative of the command du from the Linux kernel,
> >written in Rust. It aims to be more intuitive and visual in order
> >to give the user a better view of his system's storage capacity.
> >
> >---
> 
> I think git am will not like this separator and have the commit log stop
> here instead of including the rest til the next separator (with your SoB).
> Maybe -- would be enough, or move this after the other separator before the
> list of modified files?

No, that is OK. I asked for that in the past.

Test results are very interesting, but they do not belong to the commit
log (except if a test fails and that has to be explained, of course).

Regards,
Yann E. MORIN.

> >The package has been checked with correct formatting and
> >without typos:
> >$ ./utils/check-package package/dust/*
> >
> >Tests have been run using test-pkg:
> >$ ./utils/test-pkg -c dust.config -p dust
> >
> >test-pkg config:
> >To run the test, the file dust.config contains the following line
> >BR2_PACKAGE_DUST=y
> >
> >Results:
> >      bootlin-armv5-uclibc [1/6]: SKIPPED
> >       bootlin-armv7-glibc [2/6]: OK
> >     bootlin-armv7m-uclibc [3/6]: SKIPPED
> >       bootlin-x86-64-musl [4/6]: OK
> >        br-arm-full-static [5/6]: SKIPPED
> >              sourcery-arm [6/6]: OK
> >
> >Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
> >---
> >  DEVELOPERS             |  1 +
> >  package/Config.in      |  1 +
> >  package/dust/Config.in | 12 ++++++++++++
> >  package/dust/dust.hash |  3 +++
> >  package/dust/dust.mk   | 12 ++++++++++++
> >  5 files changed, 29 insertions(+)
> >  create mode 100644 package/dust/Config.in
> >  create mode 100644 package/dust/dust.hash
> >  create mode 100644 package/dust/dust.mk
> >
> >diff --git a/DEVELOPERS b/DEVELOPERS
> >index 1dede4b83b..7a0fa47595 100644
> >--- a/DEVELOPERS
> >+++ b/DEVELOPERS
> >@@ -2180,6 +2180,7 @@ F:	package/ofono/
> >  N:	Nicolas Tran <nicolas.tran@smile.fr>
> >  F:	package/hyperfine/
> >+F:  package/dust/
> >  N:	Niklas Cassel <niklas.cassel@wdc.com>
> >  F:	configs/qemu_riscv64_nommu_virt_defconfig
> >diff --git a/package/Config.in b/package/Config.in
> >index d264449b30..a283fadc41 100644
> >--- a/package/Config.in
> >+++ b/package/Config.in
> >@@ -210,6 +210,7 @@ menu "Filesystem and flash utilities"
> >  	source "package/curlftpfs/Config.in"
> >  	source "package/davfs2/Config.in"
> >  	source "package/dosfstools/Config.in"
> >+	source "package/dust/Config.in"
> >  	source "package/e2fsprogs/Config.in"
> >  	source "package/e2tools/Config.in"
> >  	source "package/ecryptfs-utils/Config.in"
> >diff --git a/package/dust/Config.in b/package/dust/Config.in
> >new file mode 100644
> >index 0000000000..c02cf1aa83
> >--- /dev/null
> >+++ b/package/dust/Config.in
> >@@ -0,0 +1,12 @@
> >+config BR2_PACKAGE_DUST
> >+	bool "dust"
> >+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> >+	depends on BR2_INSTALL_LIBSTDCPP # host-rustc
> >+	select BR2_PACKAGE_HOST_RUSTC
> >+	help
> >+	  dust is an alternative written in Rust of the command "du"
> >+	  from the Linux kernel. It aims to be more intuitive and visual
> >+	  in order to give the user a better view of his system's
> >+	  current storage capacity.
> >+
> >+	  https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_bootandy_dust.git&d=DwICAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=qKkjyC6yAxeKvJmYdNlsDzDhFdDO0vSahgOTnZgBDNPKmYuAGOdkwdWdM3O_CAAt&s=gH07_ilQO9wqi8bv07RYANita8mpsOhdq7k__dVsOqg&e=
> >diff --git a/package/dust/dust.hash b/package/dust/dust.hash
> >new file mode 100644
> >index 0000000000..82043b497d
> >--- /dev/null
> >+++ b/package/dust/dust.hash
> >@@ -0,0 +1,3 @@
> >+# Locally computed
> >+sha256  8231d045a0cca286355e89a41758b05f43238d52721bfc78e0b9bc19789bebde  dust-0.8.1.tar.gz
> >+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> >diff --git a/package/dust/dust.mk b/package/dust/dust.mk
> >new file mode 100644
> >index 0000000000..a889d64f56
> >--- /dev/null
> >+++ b/package/dust/dust.mk
> >@@ -0,0 +1,12 @@
> >+################################################################################
> >+#
> >+# dust
> >+#
> >+################################################################################
> >+
> >+DUST_VERSION = 0.8.1
> >+DUST_SITE = $(call github,bootandy,dust,v$(DUST_VERSION)-alpha.2)
> 
> There's a v0.8.1 released about two weeks ago, better use it instead of
> alpha.2?
> 
> Cheers,
> Quentin
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
