Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6735AD374AE
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 21:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2314780D49;
	Fri,  5 Dec 2025 21:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSof0qeKtd_s; Fri,  5 Dec 2025 21:43:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3371880D50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764971003;
	bh=BNszu8U5TL+cQe+WLvPaQakUeVoVLndn6C4V8UJUKgU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kjior2SRuEkRg8jdBv3r5oXuws9juMYAIsznQ0VyYMSJ0dUCWC6p20rjj6sK3DJF6
	 tEPmuKFcCU6wrenfvAMzyLwS3mMdxq7qYx2+M2oCpCwbhB5kM4uyzh6MpCOsDE40MM
	 tFDrC6FURSSzNLRpw1HTDRsibZyTFBDsJpmDyI6rmrj3QBtQwCjCS6XMLVVoSPvv7N
	 B+Sr669WmSmKDBRllFTmDDBz7oxWd5ZQiNJSgHawlKG5Ig0sS26roPjYDFb/nHHYpw
	 TL+zmeak4JKQR8k5YH84n/YQ9Lm/jXE4pnDpieyoKWchd7e1Pyze9dIw4aQI9qzMBk
	 8ITfEjynqQxRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3371880D50;
	Fri,  5 Dec 2025 21:43:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9254BE7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AFB080D1D
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngKDjdqFNr5b for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 21:43:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B249D80D19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B249D80D19
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:43:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A060986623; Fri,  5 Dec 2025 21:43:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Dec 2025 21:56:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a805d5b9056597fa4c1f69c01d4e7d76c76cd414
X-Git-Newrev: df4a87e6e6b733536df0ae15aaa83ba00e0a364a
X-Patchwork-Hint: ignore
Message-Id: <20251205214318.A060986623@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/xilinx-prebuilt: add
 local versal xsa support
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
