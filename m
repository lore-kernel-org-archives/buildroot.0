Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0C2606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=alWTZHfu
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04F8240D84;
	Fri, 30 Oct 2026 14:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQBm1RQsq4w6; Fri, 30 Oct 2026 14:19:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 08EF340D72
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369969;
	b=RHz7DFutzZWTIzC22VwfcohUkeQF1bqCLczh/ERb3N8WUDIEsUulrm3mFyfsM6ON7jo9
	 boc+46LlsnOZxWjT3oz/MHHF39aVuClfnEuq0rvJvkD0ihm8A9BMmmW7Fm0FCOCxCuLZK
	 CuxKXemNP/GP7mZLAkTn7zBNV7KpiRg0Yi8lOdDVuANau/VtY4hCQbw64r8vypLCTHu6k
	 QeIhiqKwU4kkmwl8Xh30gWn7M6ZvIk84rIUOFpMao7il4VYDdnKJ9BNvig5YkwGt9TAzr
	 87pmGeT5u+iXjojXZ3oRMpt+Er64u5A8w28t87Fp0W83Sa0+peiZMCMrePZPh9/3QnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369969;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=b2/NJj/51s8cYDrMOolB79ImGwETsS6092ZH/XvybeM=;
	b=Yu/xQP3O1uev1yZ0Rtck18tnRLHvEdUdAy5P5NSqf8IPB7uDos5ElU/8wZUvjDjfwl7Y
	 hFr7nvQ0JuWFXNRkLUL/QCn8Ae5iss/DFFvvOCFVaHK1SprIoIzwhsI+YjQRETbrdr3dz
	 WiL+2lm5Wq/cqL1WLBFcrzbyQrbB6RT0BZFVQUvpjw7IAHepqdUce4zXG2Et+yXVDh1Jt
	 uCCZLgJjQNswFs0AIQj4Ywq8xgj7gzlOBtPzKushPHGh7FkFieyUHInjYn+PH65yp3b0n
	 Mq7nuJOR0Ow4iVc8SUe4OroPz4eMpij7FYyeHbAXti7PcymxyzqrOnJBhPSYAUQAkJQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369969;
	bh=b2/NJj/51s8cYDrMOolB79ImGwETsS6092ZH/XvybeM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=alWTZHfuPJpiYIJjR4IgW6j7j3OFRluRr0UQa/RNQxoUEDj4ABRa8WU3cxbagkKC9
	 yVkSyGu3v1USYH5T8VBGIlkl4/LljhuxyV+WC7IywSl2XuBcBza9bfhquczcgAW56j
	 MZrzzGlJQcd2M8I5RlSBLjE0gfGthk95N6Jo0NOiXyd6L43ynPH4Ide2BB8q9I4aHS
	 jO71Grv9QuZio73tPndR2m/aDTm96Rmk5e3l9+2bFSJZv2mU3oMhXGbrQff5D8VYNp
	 XBOr7Lx/+1/qxmY74h94uGfvO36CpuscxS36k4N5QunPwOQQ0VLcfHizSLfWXm3dxp
	 ZtA0Py37iK4/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08EF340D72;
	Fri, 30 Oct 2026 14:19:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0983AD46
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE1B5812BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QF5O70RkfM_4 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2BA0E808AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369891;
 b=TRZn/B/rg95ZTH9Cqje3D8SVuV6cWxgS8kt8IMoD1grfEEwBrZ8bK9UPfjpAD04y/Uk2
 PxtJGW2R4tiG4XTh1wp9Fr+VcKNyEMdJfxY5rBMM5u/bSpxDteNdxftgt5K4Lfxgdk5Mb
 EbKR/TU8ARwie+0MMk9j7gS8QhH0v1VrvsEsqcTxYEK1ReorHp81JuEGKCO73fEQFSoaE
 /gXoaF43R2xYUKliEbERnX/K9Qb0a6QUMiU/XiSixhuoYf+iyR6z2dXOLrgpje11dwIj/
 jh7j55LONmNHhrg1kA9RATKjEOjALglzD9TSIVrcpc0p1nc4V+ZQhseUvKiF4lvqBUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369891;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jI7qDpA6j8v2gE7MeQoosdptRmUUpPT4mWcY4pXnBFo=;
 b=eOsXaFdqsAiKDCg0ZmDzcx53u81FogGIQrPdLS8tQxwtmzF5r3hNlis7OYnvwx20t3m0
 0llkJE64z/aHjPXyAtg+M5Je4S226PnC6sr6I1r0i70MCTcevxtOPxApFEdMHmr6wVL/S
 /k9Jc7Z49dvekVRyraM8JbVSDGIyRSMfOZyreBM6DV/UdZp41KTKHFcD6Fo/UtOhdSqQ2
 xbyPJx5CEuRxTE6ooW6dYoJcmgpjVlpl11vkc1YdFCIxW1jVf5g8u4Xw+oKnUtAS68TdM
 4X52eKIU8lzuiItrs0/DS9LrkFL2o4qybHzrSMU81YapcxH3eNnJYk/JkT3dcmXE4Fw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BA0E808AE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 499FD9D388; Fri, 30 Oct 2026 14:16:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 097c03607d0cfa5c2c6a9b3bda1d55942c3a45a4
X-Git-Newrev: 42049f7f42fe442ed897048ea0d026331e220c48
X-Patchwork-Hint: ignore
Message-Id: <20261030141643.499FD9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/linux-tools: fix
 PCI endpoint tests build with recent kernels
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4047161069299423274=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4047161069299423274==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/42049f7f42fe442ed897048ea0d026331e220c48
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Since Linux 6.14, the PCI endpoint tests have moved from tools/pci to
tools/testing/selftests/pci_endpoint. The existing build commands still
use the old location, causing the build to fail with newer kernels.

Detect the selftests directory and fall back to tools/pci for older
kernels. Set OUTPUT and INSTALL_PATH to build and install the selftests
under /usr/lib/kselftests/pci_endpoint, and pass the required libraries
explicitly.

Update the help text to document the binary names and installation
paths. Check that the selected source directory contains a Makefile
and report the minimum supported kernel version if it is missing.

Fixes: https://autobuild.buildroot.net/results/75da8662f73b88f8304c8191a4e6c1dec25b5e31/
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 948491cbfcc08a3d541ab273e5f2c6be0b3b5777)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/linux-tools/Config.in            |  6 ++++--
 package/linux-tools/linux-tool-pci.mk.in | 16 ++++++++++++----
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index b9adc25ad5..ab8fa62471 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -61,8 +61,10 @@ config BR2_PACKAGE_LINUX_TOOLS_PCI
 	bool "pci"
 	select BR2_PACKAGE_LINUX_TOOLS
 	help
-	  pcitest is a tool for testing capabilities related to a
-	  PCI Endpoint (only works with specific Endpoints).
+	  Build the PCI endpoint tests (only work with specific
+	  Endpoints).  Kernels before 6.14 provide pcitest in
+	  /usr/bin. Newer kernels provide pci_endpoint_test in
+	  /usr/lib/kselftests/pci_endpoint.
 
 	  These tools are available only from kernel version 4.20.
 
diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
index 17246f5d7e..52d7639bb1 100644
--- a/package/linux-tools/linux-tool-pci.mk.in
+++ b/package/linux-tools/linux-tool-pci.mk.in
@@ -6,22 +6,30 @@
 
 LINUX_TOOLS += pci
 
-PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
+# Linux 6.14 moved the PCI endpoint tests into Kselftests.
+PCI_SRCDIR = $(strip $(if $(wildcard $(LINUX_DIR)/tools/testing/selftests/pci_endpoint/Makefile),\
+	$(LINUX_DIR)/tools/testing/selftests/pci_endpoint,$(LINUX_DIR)/tools/pci))
+
+PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
+	OUTPUT=$(PCI_SRCDIR)/ \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	LDLIBS="-lrt -lm"
 
 define PCI_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
+	$(Q)if test ! -f $(PCI_SRCDIR)/Makefile ; then \
 		echo "Your kernel version is too old and does not have install section in the pci tools." ; \
 		echo "At least kernel 4.20 must be used." ; \
 		exit 1 ; \
 	fi
 
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/pci \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(PCI_SRCDIR) \
 		$(PCI_MAKE_OPTS)
 endef
 
 define PCI_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/pci \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(PCI_SRCDIR) \
 		$(PCI_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
+		INSTALL_PATH=$(TARGET_DIR)/usr/lib/kselftests/pci_endpoint \
 		install
 endef

--===============4047161069299423274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4047161069299423274==--
