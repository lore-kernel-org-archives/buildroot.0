Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBA2606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 22:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YRWIOyTX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=fIWtqks0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 899B16065A;
	Sun,  1 Nov 2026 22:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6r4tLVmjKOZs; Sun,  1 Nov 2026 22:27:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A60EC60616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793572075;
	b=p+lB1yv3q5Ug+ufSGQrzegzaPiWqNCNd9zJ6tT9jw3g1GucUjpdqQLNukUwS6aUDJVGY
	 SJjmicqkmT0TAmiZcIMdvRxFRN1DuW1THrD6acNeThheoARicO7Ef3IiQxzELjs1sNlRO
	 Udhit6FJZoF/6/trHOvu2MtvPq+RpPc0CY4YBwdid8lvYQFnnMLu71IPh3X/7Uw13WdFD
	 UsAZE39jGmvL0QgIBK/Nqf1O8J/6J+Ek7tEJ4F2NXXJ8P0U5/Ktqg8p8UQEtTQMJbmjtp
	 koxeIpbmjJ+j/D0S2cQrTsPeOBl8lG8sH9dVvjR/tfv01O8v+wCoP2CkIswGnhN/f2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793572075;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=X4CSpJLrykDKDLzBqLcuGoDZCa91s6QaQSaYPv461CM=;
	b=GTwttFx/1vAlZl9kPO+jBS1/uEFXJ8e8DTImTfLUH0zXkzSlqcp2JpqiVSAbFRBPqgWm
	 fB6T7Zzk0LeGZEG2o8RDGGkhFgpy3UyOiQDm+sUHCtIIc+OOxTBmNVoaWfvqs9oq0JRqW
	 88NhgAnc+FHai7ML+F4az1qY0rUPsT0J3ognZPTSvgtJm7ukyubs8mKghuDn85Dy/2g0w
	 sF5KRXuDdk+clCCoZGOYRL2Ic/FiOpZMzJ+UrfMJNbb9B90XefvZAU6+ztBgaKG2dp7v1
	 wY0Px2hGCQPUlfPDA15DUk/edXEq5HwNYVwok7bMqGysiIoyZAgr/xDoYO+rqeKHAZQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793572075;
	bh=X4CSpJLrykDKDLzBqLcuGoDZCa91s6QaQSaYPv461CM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YRWIOyTXayBai6QLEuJ45xFKatCvwQPPXo0EBOt/8INZwIe7MTAe2bqvFDBRre+N5
	 G7xboza8K4W2OgjdESNK++W+VbEMwMhY89/kPFWj6lx3wBDE1RF0oRQniBImgVMHIu
	 J3r2rqkHLBCz5b9BqAGpw3IbnlmDdk79yn/SlD7iDGmNFhDkJOg1SrS6ACMORiq2X8
	 7PBnB1IH7VKIHQ76O8S3z5oQHjG0pS2SoIfZNZjAi8X4RgZThI4S4gVAfiXjvOxBI6
	 O1qZ42jCU4ZbxXrLe5VjBcPOJmP5LjvrV6389qf1Cw4/d8ybn3EW3YpnrbZ4meRs7k
	 qR6Bp4zwhv5tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A60EC60616;
	Sun,  1 Nov 2026 22:27:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28211435
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A03740070
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haQvlchuODdg for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 22:27:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6B2ED4004D
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793572072;
 b=EUO8F427+F8HMJBgzTfeeOshw6WJfKAOgAXt5golP/rCQ3l6z30yKCDX1fWzD4QDioZY
 u5hSstlgaW7gvIoRv9TvlnndRihN3NvbNS+k0zHqVT1wWF0AyS9EesCgM901aYmlOsvnM
 pOD79dj8Lh1g9LQ+BtbCrDcijwxv2RbzDnPyYMg7jKfe/W0hGLEr+Imv8xghSAWAoeoHj
 DwVV11BZg0y+98DZyvSTVjv4KoQuQ3zbYlOKVcAtdNsLi+WUUzQ3Zylq84M3URaG9aoyD
 tbGiIF2PxiMi12Eotru7sWd8qf5keTF3U3gD9DYLrwdPZ5uYGNA5U61ZmBBtmV6qH9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793572072;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=6OIH/SNwVxPv0+7e8/nlxRh1X/89sVM5riNZNse/yr4=;
 b=REFPE9ChvhzIeCBGldZMkkH2ke9KDXWkbGhxABeegKiBrCAj3a7oPGrxETr/msvbI857
 cZ4jCdVOOBzw5yq81YxmkxD+wSZE41EDwI76vFpMbpAqPaFrOzX4/QPVOqycyX413GgHz
 321XrBUj0G1W3eh4oQ5JoEYn6rIk+rcipvPVutqbH1u9ex7zAX8kyJ1MaAY6O+7o+Qi9O
 941CPNAt9QTgCL5jykUTMq5wHDsOwdoJojVp1xIViiKHVrfDa/V9NGhBMVU1Pu3JyiANT
 UW5pufEu5oZ9giTHBq7nYnYHRuqWt1PKQPVVPw1q3G5luwqIYtOxpy6J6ye2yPUNd8g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fIWtqks0; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fIWtqks0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B2ED4004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793572067;
 bh=6OIH/SNwVxPv0+7e8/nlxRh1X/89sVM5riNZNse/yr4=;
 h=From:To:Subject:Date:From;
 b=fIWtqks0/5T6Q/1q+7EKstCgMgWlno/hBb8rIscvkim046jX3SDEjEHvwcRWzc3v+
 +6d76XRmkkaqz/1nxwsgYTJNbOqc3hNSDr0bPYRI6QlMT/2ebR1cxtKB+YZDN8hSO7
 ssG+1ck8bQkjnkuFFV6+4Y4YgK+Itw1QxPUWXOg6L+D3dhVF6fLU+SdMuN/kEFuEW5
 Y2iF5ct+MYAD43bASt2MWt64X83YPfcW6HUc3wVMap0BWRB4NTncT2nZrZ/S139x2/
 bza5YvCF2jBOuAWUEPWXfCbyWN4ZKoa8LXNnIL+6yjkOZ4gmfbKSRWjiJXzY2J9UXL
 8wanGyQCAfeTQ==
X-KAS-Sym: v3:f51bdf72230551df:oW+AJD25FcqBf9IkBW9t6eXwL+x4n+WOeFbvk63DGtba8
 ur2FccYXi1ppfsEtqU30MVK11t9D/8zUFB3+qYa/0fo9VUNUknxxRHxPZcPm5j5VFdpjvlYs8fp
 4Wz0jxlX0QYhyrLlfMS0CiqXGZ5JAL9RxVL651N8hOtkm9q3UZaNthhyXRrchreClx2CpLluhRF
 2HVI6fc7Cgbts2EbLsIdwNFvObt/kK4InFXqtYyvQbL508jn8w4dfLjTudk8kzRirpV7g+7LjPw
 hfQLV5H5YPS6BJvDExTSjjYqjJ9Y+tQvclMaY3iusD1Ly01zPHpEQv7drX7D9Z3K65rdvYuw==:
 kRs+bS0WXXHR/I7HMXSS/JH08orvkUYiesuRXZ38lTwoTqDa2Y6aNZy6ovp+RJgl0AEDhoGq95w
 xEJHbIoujqsVR6f32uuYnta6t5oXSdIwPONmsWomSe3RUwIEXPAZiE7LuxxWY5TOexFObb6KdT6
 08FEuMVxWz/rNHJrZWq0+JF07GpXrBQxys3AfSoGH+H4jequVvGXOinKZSuS99wg2PGGfEnN4D2
 Fi5IYuXHWoOf5Y3/orsbYaKvKJ71VnsGj+uGNFwR2I/nkv6iEToLQOzJHmeJ24uc/75n/+2oWJ8
 /DLchheq/Xu5nP5eOuKlngcitW4Tg/DhMLaeq6VE9DRukkFcmiqo6sh6S1K3mIHrNduFMcIrlsn
 bQIOjj7idWauvqpovIQk/YaFEuUjyzeyVME/dIMBfbneqDyAhIlCyHpnV+Ha2v8BboXor+mSutI
 /ct25GBOCJCzXAl7enJ+XlvPOcHsJlzKw84KKWWVBiEPEi2UCAHsTe11hCXrq70Hb+njw/kL2SS
 2FlsTE3QW4/YcShTaUoNfXoEE658/LJ4ZFuFOlF2WPqiwUXBp2Jp7aFVCMT/WrsqdSsucZZjRx/
 qTDTnymAdm8uNlWtfwTXENklT3931Mywd06c6hVCAjBP
Received: from fli4l.lan.fli4l (p54a1b5d2.dip0.t-ipconnect.de [84.161.181.210])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4FECFA4C304C
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 23:27:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44592)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNe1i-000000001av-39yj
 for buildroot@buildroot.org; Sun, 01 Nov 2026 22:27:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  1 Nov 2026 23:27:46 +0100
Message-ID: <20261101222746.26548-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/rtai: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Building kernels > 4.19 is broken, for example:

No RTAI patch for your kernel version
make: *** [package/pkg-generic.mk:237:
 /home/autobuild/autobuild/instance-13/output-1/build/linux-6.6.161/.stamp_patched]
 Error 1

In 2023 the maintainer laid out some future plans:
https://www.freelists.org/archive/rtai/05-2023

The last mailing list entries date back to 2024:
https://www.freelists.org/archive/rtai/11-2024

As the future of the project is unclear and the package is broken with
newer kernels we remove the package from buildroot.

Fixes:
https://autobuild.buildroot.net/results/800/800854f679cacdb2f5311dae62f7cd4db4efefa2/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                              | 12 +++++++
 ...ding-packages-linux-kernel-spec-infra.adoc |  4 +--
 linux/Config.ext.in                           | 11 -------
 linux/linux-ext-rtai.mk                       | 30 -----------------
 package/Config.in                             |  1 -
 package/rtai/Config.in                        |  8 -----
 package/rtai/rtai.hash                        |  2 --
 package/rtai/rtai.mk                          | 32 -------------------
 8 files changed, 14 insertions(+), 86 deletions(-)
 delete mode 100644 linux/linux-ext-rtai.mk
 delete mode 100644 package/rtai/Config.in
 delete mode 100644 package/rtai/rtai.hash
 delete mode 100644 package/rtai/rtai.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 29c9b7f9e7..3765db9778 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_RTAI
+	bool "RTAI userspace has been removed"
+	select BR2_LEGACY
+	help
+	  RTAI is unmaintained and has been removed
+
+config BR2_LINUX_KERNEL_EXT_RTAI
+	bool "RTAI Real-time kernel patch has been removed"
+	select BR2_LEGACY
+	help
+	  RTAI is unmaintained and has been removed
+
 config BR2_PACKAGE_MESA3D_OPENCL
 	bool "Mesa3D OpenCL support is now provided by RustiCL"
 	select BR2_LEGACY
diff --git a/docs/manual/adding-packages-linux-kernel-spec-infra.adoc b/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
index 22ffc5496f..c7fbb6184d 100644
--- a/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
+++ b/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
@@ -98,8 +98,8 @@ the kernel tree, or in the form of new files to be added to the
 tree. The Buildroot's Linux kernel extensions infrastructure provides
 a simple solution to automatically do this, just after the kernel
 sources are extracted and before the kernel patches are
-applied. Examples of extensions packaged using this mechanism are the
-real-time extensions Xenomai and RTAI.
+applied. An example of an extension packaged using this mechanism is the
+real-time extension Xenomai.
 
 Let's look at an example on how to add a new Linux extension +foo+.
 
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 3b72d3cf60..86af4c338b 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -44,17 +44,6 @@ comment "xenomai needs a uClibc or glibc toolchain w/ threads"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
 
-#-------------------------------------------------------------------------------
-# RTAI
-config BR2_LINUX_KERNEL_EXT_RTAI
-	bool "RTAI Real-time patch"
-	depends on !BR2_LINUX_KERNEL_LATEST_VERSION
-	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	depends on !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	select BR2_PACKAGE_RTAI
-	help
-	  RTAI Kernel part.
-
 # kernel extensions from br2-external trees, if any
 source "$BR2_BASE_DIR/.br2-external.in.linux"
 
diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
deleted file mode 100644
index 50f79f8d50..0000000000
--- a/linux/linux-ext-rtai.mk
+++ /dev/null
@@ -1,30 +0,0 @@
-################################################################################
-#
-# Patch the linux kernel with RTAI extension
-#
-################################################################################
-
-LINUX_EXTENSIONS += rtai
-
-ifeq ($(KERNEL_ARCH),i386)
-RTAI_ARCH = x86
-else ifeq ($(KERNEL_ARCH),x86_64)
-RTAI_ARCH = x86
-else ifeq ($(KERNEL_ARCH),powerpc)
-RTAI_ARCH = ppc
-else
-RTAI_ARCH = $(KERNEL_ARCH)
-endif
-
-# Prepare kernel patch
-define RTAI_PREPARE_KERNEL
-	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
-	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
-		$(APPLY_PATCHES) $(LINUX_DIR) \
-			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ \
-			hal-linux-$${kver}-*patch ; \
-	else \
-		echo "No RTAI patch for your kernel version" ; \
-		exit 1 ; \
-	fi
-endef
diff --git a/package/Config.in b/package/Config.in
index d3bef2d5f0..06ea65c6f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2733,7 +2733,6 @@ comment "-------------------------------------------------------"
 endmenu
 
 menu "Real-Time"
-	source "package/rtai/Config.in"
 	source "package/xenomai/Config.in"
 endmenu
 
diff --git a/package/rtai/Config.in b/package/rtai/Config.in
deleted file mode 100644
index 14b1854837..0000000000
--- a/package/rtai/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_RTAI
-	bool "rtai"
-	depends on BR2_LINUX_KERNEL_EXT_RTAI
-	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
-	help
-	  RTAI - the RealTime Application Interface for Linux.
-
-	  http://www.rtai.org
diff --git a/package/rtai/rtai.hash b/package/rtai/rtai.hash
deleted file mode 100644
index f2eb7f33ad..0000000000
--- a/package/rtai/rtai.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256  57acd3ad46cc8f1e01dc21089a24587c59e7328cbac06abb62bb0152de0b9df7  rtai-5.3.tar.bz2
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
deleted file mode 100644
index 6e189bf27b..0000000000
--- a/package/rtai/rtai.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# rtai
-#
-################################################################################
-
-RTAI_VERSION = 5.3
-RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
-RTAI_SITE = https://raw.githubusercontent.com/mmorandi/RTAI/cb3c52f056559c9aaa54d0e1c8c0b47467ae5f3e/userfiles/downloads/RTAI
-RTAI_INSTALL_STAGING = YES
-
-# The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config
-define RTAI_POST_PATCH_FIXUP
-	$(SED) 's%^staging=.*%staging=$(STAGING_DIR)%' $(STAGING_DIR)/usr/bin/rtai-config
-endef
-
-RTAI_POST_INSTALL_STAGING_HOOKS += RTAI_POST_PATCH_FIXUP
-
-RTAI_DEPENDENCIES = linux
-
-RTAI_CONF_OPTS = \
-	--includedir=/usr/include/rtai \
-	--with-linux-dir=$(LINUX_DIR) \
-	--disable-leds \
-	--enable-usi \
-	--enable-align-priority \
-	--disable-rtailab \
-	--with-module-dir=/lib/modules/$(LINUX_VERSION_PROBED)/rtai
-
-RTAI_MAKE = $(MAKE1)
-
-$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
