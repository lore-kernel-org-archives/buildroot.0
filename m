Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26A7CA0FE1
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 12:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93F3B41158;
	Fri, 30 Aug 2024 12:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zu66xwka85U0; Fri, 30 Aug 2024 12:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92A9041159
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92A9041159;
	Fri, 30 Aug 2024 12:27:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF54C1BF410
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBA2940469
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yECrLAsZjDdG for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 12:26:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 121FC40346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 121FC40346
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 121FC40346
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 12:26:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.6.139]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiJVG-1s7uTg3k86-00h4qc; Fri, 30
 Aug 2024 14:26:55 +0200
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 14:26:33 +0200
Message-ID: <20240830122637.3722450-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830122637.3722450-1-fiona.klute@gmx.de>
References: <20240830122637.3722450-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:/h+H0M3Uu88q87rKRdIJdSGs7ah6h4HDtiTdCk74i6Md9wjDcSU
 Mk4dqxd4DhxPACXFU52hn8Y/37t9wlvwJqcng9STAb4yH+imKtbEd/E/99Ed07y7SjmQP8Z
 /pwZCey/bfPKBFv4KBski6u7XlebLsgCtB7Fd8qnfNJjN5Jc3EBGr7Yy94eqNfxvN4eA36i
 /JEq4OWcKHYvGkS7epnGA==
UI-OutboundReport: notjunk:1;M01:P0:GSOF5BazxjQ=;0L6hYPgbfcdklBW6GF1iN1exGkz
 +bj85rYliN7fq3JhV0b+YGOjHi+J86QcCMWPzoUjLYAviFyif9V7v+GYxy/lEBy6uOCrZUdNa
 EUGhU5uVgBQlByAU9U634Rw1SF/RYrt6mx7aVOkw9aAb6+BVxWv8ahWngJoPxCG26bUm9xMo/
 2W/W4meEtDB9qSwNVl5TvnOnUYBBUPVYFZbXj6xeOSAwwDtYjRRSYU9xsWoh1pb84RMF/zdHG
 Cxxd53VMRK4U8WMAhn1K0vs/ymWjSOfmOUG+OXP9TWa/+WS4Ij62EdtdOC5gcmL1yhhbJgnsd
 BMDe+FZn6c+g5T23D2m+EAKEZud/ENAwhSqdwfYNBwYebu0F2ld7nwYKUzm7X00Ar4pubr9sg
 yhRren92eEJmwOxdGgnlZegKeGyEqrJU1UqaUkA6nexn/V8XLomsrQJK9nUlMT3bGRstUMH3u
 7GcTuVEdI0UPvykkH8pnw1dQR3o+nWOZSUQVtBW+oHQx3MMytBfgQxOBPiqfjb7EObXyGnICu
 n1RBeGEaFBq07fheL9JSP3AX4keyhgIyvRW75BpM/7HfmPnOEhseSb1I+d3EVw0fBijKdbY+n
 D5SlSxUJx+PLr+LnhihP7n3XRJAJCsfBU8epkw5BBjiLGiveeqdIqfRWNjkEDw6e09UgB5i+s
 9puqCMd+tbfcs3WLXKVTW1M/kuPsdis1LS7lZlQZLDxDCV2w6NfIobteroItac7BrSCb0R3Wf
 VKqk6XGWMWLVtoHcJ8I2GPRZfISjFOtzJ10MssyufkwCyR2KOSHf4NTIbZcSbHoCs/SKo1jA2
 wbBUiEb4OKptseEl69wA7VBg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725020815; x=1725625615; i=fiona.klute@gmx.de;
 bh=TdB1U6M8NDS/fJaxch3uLvlhpV/GwUYXNRU9Ymrrofc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=F3h5OWzY6O3qppwIw2VEcbrXDX55LoE/i7hJGC2475sSroBQX2dz5Ipy2NjXTJXd
 tJ4QJ2Rnv6cxBOrRSjlOuAKNpRQM2/JgJM8rkJpX4jmKbzKXEH4eQygUfjzQqOfby
 A0QDg/P7Xp9DBULNscmqoX/0AAwoVU8WjMOy5mnzhKODHb/7R4SsD1fTYbxeqoNaQ
 HVVwfg6SWSNkRP+6rEZVEddaIi9F+7lgChHKnqiJdbJpSU+/AfprV++z95Po2ayC7
 R2cc6X2UjF4qM5YRVpmsjxlOlTiF2xIFfD+MrjjVWwnJEnRdaUuWrwglgw4MuabKS
 UtYxGtfXhdYEjLInSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=F3h5OWzY
Subject: [Buildroot] [PATCH next v2 2/3] package/python-gobject: bump to
 version 3.48.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Current gobject-introspection releases work with musl, so relax the C
library requirement.

Also update the homepage, the old URL now links to the current one.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/python-gobject/Config.in           | 8 ++++----
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
index 3354535637..d9d73cc5e3 100644
--- a/package/python-gobject/Config.in
+++ b/package/python-gobject/Config.in
@@ -4,17 +4,17 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
 	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
-	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # gobject-introspection
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Python bindings for the GLib/GObject library

-	  https://wiki.gnome.org/action/show/Projects/PyGObject
+	  https://pygobject.gnome.org/

-comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+comment "python-gobject needs a glibc or musl toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 2fb9d38ab0..f3bb0a4610 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.42/pygobject-3.42.2.sha256sum
-sha256  ade8695e2a7073849dd0316d31d8728e15e1e0bc71d9ff6d1c09e86be52bc957  pygobject-3.42.2.tar.xz
+# from https://download.gnome.org/sources/pygobject/3.48/pygobject-3.48.2.sha256sum
+sha256  0794aeb4a9be31a092ac20621b5f54ec280f9185943d328b105cdae6298ad1a7  pygobject-3.48.2.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index a12ce5c107..a09ddb7e87 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-PYTHON_GOBJECT_VERSION_MAJOR = 3.42
+PYTHON_GOBJECT_VERSION_MAJOR = 3.48
 PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).2
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
