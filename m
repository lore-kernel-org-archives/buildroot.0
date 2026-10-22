Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC161606A31D
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Aho0Afps
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB3CE81175;
	Thu, 22 Oct 2026 21:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9gGa9E9hatW; Thu, 22 Oct 2026 21:15:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E4FB9811F8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792703725;
	b=pKp9Gx1RXG+Gw5cian/tGzMnvNa2tfoIe1YGLtefLj603AUsfrNfdflnXmIxzOU3z8bD
	 /7eFo6vNOFjZZprV4FRIeJzMBYiTlGUM6uvMBxobiX9gQKNZ+/ouMoN9N63uUXRHBSCK0
	 etBxmsmvMGiuqpzQ4cd9oV8rtH2TaabS82CiuPMR4TMnwddGcGiJZmnYDbzIyjA9flkki
	 VHo0WF6/RPLerjiaUzGyYn8H1seC+d8wsaLmrAGVDkqsflgv7NYgP8Iuz0OGUsRoNLFM/
	 12rivdWiJ0LVvByhUmQ99ndDer53j5slBCahUXrED/FcIzjyszUiEZDl+3V6pb3Hy1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792703725;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Rcq/CZgr/dLbo3mFgSPbPRTmS//FTQPJZ5n7kqNfOnw=;
	b=J51sd47N0INbBc0HCN3FjYlrIBYvtaXKmjIbxdC1vMjjRR2Yl9DccOu8wjSwue512t/b
	 n7kAoUk18hMsTsp453GzzlKYtsGi/uxWxMEdUVlZyneFkstxbWnvZwJy5jW6UaP8lZ2OG
	 awx4ooDtSNg7ko/CbqdCOKbuixrqHKCO9bZJCS09UrDD24aqyRwTVBQpJP30EvljoMMFG
	 yux9vINOBPhHBOwTVHWc/j2yKmvGSZk7n6sw3xMe09M9sHs6+NIsDYB12Ip7bjgNjOhTG
	 U4UlDBvjImJDYPBz5VH64NwUQsf6EjeYDGUAZXLGXQYS5aQv6gRj7WNnLXZUfp3dJWQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792703725;
	bh=Rcq/CZgr/dLbo3mFgSPbPRTmS//FTQPJZ5n7kqNfOnw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Aho0AfpssTH37sOvZTPuWgiJ7aJ5iHQ723fDJzK+EAoNDGp0EIgGWgmwjpABYd8Dx
	 3V5uqkrd5lqyAlC5ptmxKXlsl4OfIJcZcI7wQFfgLaI4trhSWwFM0vNIogHUGJfFe7
	 VbL/+B/OxF2JD2K3fFOVLYnB1KnM2JXrty59iwGBTzj7i/Axp+JgdQjbgsWr9QtrSX
	 nfH8m+nTpbPae8UBd3ijcm2pzV7ZCiqtGUsOW1IViRU2t8HnxcSvmfTDNBwQCezNsv
	 bjZqvnYWPchBfj2DCEaJtkWnV5k4SSD9xCcYlZO5kHe+wybSjw8YGRgHWnY6Sh/lTj
	 SOwtWRXWhNy6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4FB9811F8;
	Thu, 22 Oct 2026 21:15:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F36B4BC
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0175D40270
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55Q_k7u92LH4 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:15:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3BC0C401D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792703722;
 b=Yf8b9ksXbgFlJWEjlD2F3NJ5JexI4LN8ch2Otkljmlk3HwBeZ4H2HTk8g2LUL5rUaX5O
 heU6jmj+o/wWRJGr1JFScEHJ6vOv5CLzwoccAS8dVVvgC9KiGNGMLeU9N60ZO6h50XwvU
 GnxhiFd0D/+BGaYqQ8n6e/JT5PxSbuG5gSkhfFW+ezoOBwGBA2B0AEL1H1xWrH3r6YWow
 Nk9LiCdhf+K4W9EVmtxWBeIIx0hMHn9bdF3uSwwR9W21EpAKz27jNPCbxbpjOHDKva9pn
 hMkK2fsqUCLFrytgp/jubJlaT2cJpBxRPKgr8jSOj/g+oefoIupJdzg7ujq76AssDew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792703722;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=srmeLRnEKtFJzzqii9cB6R1CxmhhXru2BixC97QjRlE=;
 b=E7hzp240CrFo2eTu+obD1Zs5ljyJfYRej1rhxcxhNtTRtqWa/gpCD/0uYYef0QqehINA
 Dtf9bjaMXa/+2IownnemqliI9w4wRbkszL+oZPfk8ViF1frHDfInjbjvnAS1UYzFgSnt3
 0yZOzOwSWD2JuaJFI2sS+4uec6vRiNxVYcykVunve2PcjuUVehdTM7MHOBkoTI9hpnMwp
 8uSh5DYy5QKKBFh6xjL7bHxyuHsdyN0gigaOGK2eWeD0nc3NYxXZVdlKjMcxoviL//IEq
 yS7cFVBWHEbeS02fumfskQDdQWxVMAQ7uwbB5qUQcjQhOQyQ0g6kgTYsrh0hqotx7Vg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BC0C401D0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:15:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A9289BE08; Thu, 22 Oct 2026 21:13:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:14:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10ad7d4cc104ff2ef197ff26bf046f6c376c2e3f
X-Git-Newrev: 948491cbfcc08a3d541ab273e5f2c6be0b3b5777
X-Patchwork-Hint: ignore
Message-Id: <20261022211358.0A9289BE08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: fix PCI endpoint
 tests build with recent kernels
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/948491cbfcc08a3d541ab273e5f2c6be0b3b5777
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
