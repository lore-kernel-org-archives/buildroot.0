Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6805DD43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D457840A0;
	Fri, 12 Dec 2025 07:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4gLRXkrqsHs; Fri, 12 Dec 2025 07:58:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E970683F15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526264;
	bh=O8tmduTkZvi86i4NmxXx1m61NdsM+HIqkr1603ZN/58=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EkFwOb4Ez9BxtSnyId8M2+kG9C7JtyZO64xfD+EHx1rmiVpmtUsipULvmFUKnwMxP
	 h5eF8RCkRpoRguyPa7XHTjOwCFiNNViKl8Lu0eOZflrqSSAyyQikTFl0oGX1DUsRe9
	 rZqN4/SZJYsas+zs5WeSfkKeMukiD2sVq+g9saljFt4LKFWNB+x+6NAqb9D3AC7zGq
	 TSCcYK9ndxhBN6B3cMf0g3QDlGQ+CZ98D/EKICNpsTEg9cimVI82ZsyEWlssoJXqST
	 hkonEkXzNzShSkpKSkyptCMN8io5dFl/f6hBY1UPOswgn/sBBaxqKJcJJBfHCeIqMQ
	 p6xmZOvB0TkNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E970683F15;
	Fri, 12 Dec 2025 07:57:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C0DFE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D799F41121
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADDEm8elwac2 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 198EA41157
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 198EA41157
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18CB586C93; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Dec 2025 21:56:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a805d5b9056597fa4c1f69c01d4e7d76c76cd414
X-Git-Newrev: df4a87e6e6b733536df0ae15aaa83ba00e0a364a
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.18CB586C93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/xilinx-prebuilt: add local versal xsa
 support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=df4a87e6e6b733536df0ae15aaa83ba00e0a364a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most of the time, users will be running Vivado on their local host machine,
and will generate a XSA (Xilinx Shell Archive) locally.

Instead of requiring users to create a URL location for their XSA file,
this patch improves ease of use by allowing users to work directly with
just a path on the local host machine.

BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION can thus be defined as either
a simple local location or a URL location for the XSA file.

In either case, a hash for the XSA file needs to be added to the
boot/xilinx-prebuilt/xilinx-prebuilt.hash when using this option.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/xilinx-prebuilt/Config.in          | 6 +++---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index a1e711e6cf..7926b6cb9e 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -68,9 +68,9 @@ config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION
 	  file. This URL can use any protocol recognized by Buildroot,
 	  like http://, ftp://, file:// or scp://.
 
-	  When pointing to a local XSA using file://, you may want to
-	  use a make variable like $(TOPDIR) to reference the root of
-	  the Buildroot tree.
+	  When pointing to a local XSA using file:// or simply the
+	  local path, you may want to use a make variable like
+	  $(TOPDIR) to reference the root of the Buildroot tree.
 
 	  This option applies to either versal or versal2.
 
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 6bd16d663a..7433444924 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -10,6 +10,9 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
 XILINX_PREBUILT_FILE = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION))
 XILINX_PREBUILT_SITE = $(patsubst %/,%,$(dir $(XILINX_PREBUILT_FILE)))
 XILINX_PREBUILT_SOURCE = $(notdir $(XILINX_PREBUILT_FILE))
+ifeq ($(findstring ://,$(XILINX_PREBUILT_FILE)),)
+XILINX_PREBUILT_SITE_METHOD = file
+endif
 define XILINX_PREBUILT_EXTRACT_CMDS
 	$(UNZIP) $(XILINX_PREBUILT_DL_DIR)/$(XILINX_PREBUILT_SOURCE) -d $(@D)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
