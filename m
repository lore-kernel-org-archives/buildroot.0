Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29307C7EE30
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 10:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA0B083E54;
	Wed, 25 Jun 2025 10:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2e1JssMX4nP; Wed, 25 Jun 2025 10:01:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAF4683E7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAF4683E7B;
	Wed, 25 Jun 2025 10:01:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE622154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 10:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5552411E0
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 10:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFCqfs0wOwM6 for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 10:01:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 399844009C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 399844009C
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 399844009C
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 10:01:50 +0000 (UTC)
X-CSE-ConnectionGUID: hfNIgpcKR+mVg2gd/IqEMw==
X-CSE-MsgGUID: II0OQSjdTcK09XVmw60u+g==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:01:48 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jun 2025 12:01:48 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 25 Jun 2025 12:01:47 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 25 Jun 2025 12:01:47 +0200
X-CSE-ConnectionGUID: iWlGvca4Tjupg7Isei3vyQ==
X-CSE-MsgGUID: CPPQxTI+SYy+Ng7+1R/j+g==
X-IronPort-AV: E=Sophos;i="6.16,264,1744063200"; d="scan'208";a="305978891"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Wed, 25 Jun 2025 12:01:46 +0200
Message-ID: <6250e91113bf6a48ab5035b038cad4db1931d57a.1750845702.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1750845702.git.yann.morin@orange.com>
References: <cover.1750845702.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX208.corporate.adroot.infra.ftgroup (10.115.27.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1750845711; x=1782381711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k+uAihF77GxsdVyOOhzmbi9YHb0+nuHIDlhsWl4uZCU=;
 b=lERgsal4Mi/YTJottVIFHxfKr8za480mg+jcj4d41nF9kR/V3iUD+MpV
 Pt98LCgM6WFkjryG3Ik2z3AEp1Zncr7xCv3C158N/wblxnv0iY3lrjelc
 egGlRJeiOB82awboC5jR6sSFFetr7xFUKrVIWiWJMR1B3xp2f6AKrC9rc
 VkcDE9Ippk4SJEIjtJ4kcuUl46WQZT0MsvIpJIY5iVu/dfsbFb/DW3iHb
 x79nfC8mX8hjMcoMa2dw4RnzCdmP2t8YRnLdA7xBfOXnCKqUQMdA3VHzF
 zoaoRSTBgXcf96jnKngAXKYtY/xUNvshcbLMiCseYY+Fgfub3TZ0rMh0R
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=lERgsal4
Subject: [Buildroot] [PATCH 1/2] boot/syslinux: fix install with top-level
 parallel build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

syslinux is... special. It is a target package, but it is installed in
HOST_DIR *in the target install commands*: in addition to the boot files
that run on the target, syslinux installs a set of host tools that are
to be used at build time (e.g. extlinux, to prepare bootable media, like
an iso96660 image). Then, from HOST_DIR, the actual boot files are
copied into BINARIES_DIR (i.e. images/); we do it that way because the
boot files are scattered about everywhere in the build tree, while they
are all packed together in a single directory once installed.

However, there is no dependency between the target and image install
steps. So, when using top-level parallel builds, there is no guarantee
that the target install commands are finished before the image install
commands are started.

We fix that by first installing into a temporary location, as part of
the build step, and by then copying from there as part of the install
step. This ensures that the boot files are easily available, without
needing a dependency on the target install step, that we can't express.

Note that we do not change the actual installation into HOST_DIR: it can
be set up differently that our temporary location, and we do not want
to duplicate that setup here (it's going to diverge over time).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 boot/syslinux/syslinux.mk | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index cc52c49aee..084acc398e 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -56,6 +56,11 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 # syslinux build system has no convenient way to pass CFLAGS,
 # and the internal zlib should take precedence so -I shouldn't
 # be used.
+# Install in a temporary location that eases final install into
+# images/ (see corresponding command, below).
+# Repeat the target, otherwise syslinux will try to build everything
+# Repeat LD (and CC) as it happens that some binaries are linked at
+# install-time.
 define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) \
 		ASCIIDOC_OK=-1 \
@@ -70,6 +75,10 @@ define SYSLINUX_BUILD_CMDS
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
 		PYTHON=$(HOST_DIR)/bin/python3 \
 		$(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
+	$(TARGET_MAKE_ENV) $(MAKE1) $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(@D)/br-root.temp \
+		CC="$(TARGET_CC)" \
+		LD="$(TARGET_LD)" \
+		-C $(@D) $(SYSLINUX_TARGET) install
 endef
 
 # While the actual bootloader is compiled for the target, several
@@ -77,6 +86,8 @@ endef
 # Repeat the target, otherwise syslinux will try to build everything
 # Repeat LD (and CC) as it happens that some binaries are linked at
 # install-time.
+# Don't use the temporarily-installed br-root.temp: HOST_DIR may be setup
+# differently (merged usr, merged bin...)
 define SYSLINUX_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) \
 		CC="$(TARGET_CC)" \
@@ -99,15 +110,15 @@ SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_EFI) += $(SYSLINUX_EFI_BITS)/efi/syslinux.
 
 SYSLINUX_C32 = $(call qstrip,$(BR2_TARGET_SYSLINUX_C32))
 
-# We install the c32 modules from the host-installed tree, where they
-# are all neatly installed in a single location, while they are
+# We install the c32 modules from the temporarily installed tree, where
+# they are all neatly installed in a single location, while they are
 # scattered around everywhere in the build tree.
 define SYSLINUX_INSTALL_IMAGES_CMDS
 	for i in $(SYSLINUX_IMAGES-y); do \
 		$(INSTALL) -D -m 0755 $(@D)/$$i $(BINARIES_DIR)/syslinux/$${i##*/}; \
 	done
 	for i in $(SYSLINUX_C32); do \
-		$(INSTALL) -D -m 0755 $(HOST_DIR)/share/syslinux/$${i} \
+		$(INSTALL) -D -m 0755 $(@D)/br-root.temp/usr/share/syslinux/$${i} \
 			$(BINARIES_DIR)/syslinux/$${i}; \
 	done
 endef
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
