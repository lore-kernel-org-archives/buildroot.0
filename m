Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D75606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fU7QqMpc
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24FC8409B9;
	Wed, 28 Oct 2026 21:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4z8I57eICIj; Wed, 28 Oct 2026 21:38:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C2953409E5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223537;
	b=RSy2n9BiCxGfOhkCX53nz2Wx9fGex/gAmGQnqZT9zvc2BJ2mGzDaUJBs7/zCzObRKsEs
	 AjULsgqp5zJMvdQHFPj+sVV9DrPiIgMro/w+xberzMKtapwoh2/9yw1zqB/YBL3vxlhCB
	 +oqX11ruu3iUty/RxHXMFxc/fkoGvXLddl6Cnu3zpza/jX9SIx9t/tiaiK6yvpZkuOIx1
	 dQCtOQneHPf/2rPI1fEubNr8JNrR1dS3rVRTt4FekkURCXRwUtxsb2uk9sD9+Va6LCoFA
	 9WuSibOMh1jf1x5Tvh2lW6DAe5OCNyK81Kr9BpKXcOTwn1r16ssAB79Sq7H9kc7NxDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223537;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+2fpU8cmLkfDD1KCqFJH+zpmzv7qxc/4lIbuUjNnsOU=;
	b=iZtAX3HWe3mbjEpDRgtMJpLIpbMyl9EWvQx7sgB3VWj7wT7e6BPHXpoQeg2ehqSvJk3w
	 JQPHqIAOlhCW0I1OoN8ZP+PZQjKNR8BsizP8qjUqYUfFAiULnFdEvnL+CfgrpLXtfzENN
	 I4ssq8RhIu8IOW+P5MDJGAP3Kkm4qEK0Rwy3fOBrIqePyindvm1Ui7Bqh5aO3+5MFMEMw
	 Hqb6TGWZyndn4NCQTd1CIj+Y+6ppCa9kHnbNxBdlr/mgRPi+6vpRuaNEjorR+Wbzfqs7e
	 PLNXu0G+C7gVgXX9yC3rB9g0opjOUwYxJj5C3FTT4IG4L+T7OMCQWUsOolwK6CU3rhA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223537;
	bh=+2fpU8cmLkfDD1KCqFJH+zpmzv7qxc/4lIbuUjNnsOU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=fU7QqMpc/gOENqWtYyIzOC4/zZuyFdroYoEHVRJrwEUBcLqxTUJ8QVK9pr1ikeB5k
	 U4LIK4J5uZtE7UJLfgaxUCdqG3yzTZF0iP4Urkn4L+XZMqf9OmWaUin/M/ygCTSCwF
	 oLNxzG62bAnOtkjekgVpeKdxKSon2ecEJSakIkpMAiSXQ63PtMlqFNc1iM3BTj/ENr
	 EJDC4o1Z1vOXSDzJSOXpScKVf1gqdfdHcbG3UZiqBqvXN86vTs+Ly9EfVA8J1Yvn8D
	 9A3wzRkGxDcMRh2W8fKJR0oLFB6gAsmHcE3vtwoPbzoXkJdQFpzNCxuQdH/EndRFXj
	 F15Ec4mSM+jBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2953409E5;
	Wed, 28 Oct 2026 21:38:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE9F3235
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B496B400B5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w60pDjo6S4vU for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:38:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3215A40234
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223533;
 b=q5rX1aQRG5+1y3z4/IHCWo2QgEnAksKGxet8xbq5pfJalCwG0e6sUqpn0SjUc+yYCSI9
 R6TogSYsyms39x40oX/rw8SPTb6dBmyaqW+1fMyspZK8XPz1AROl/ndV74a+hx+/wlRKQ
 7sgMpgXbn/9ae81DAK1OVTIFlD68HYG6Bnap4ZXf9LW4hTbqd7VpuntxuHQxeguSRJGSQ
 fXXe6oDeXbRyyKKH3WQpQmq3ARmFzxwcVOhRgJmA3W9OjCl6l+aGDUWIYkGNWAgjWNPkH
 ls9Zn6Zh7q3uSkS5VKihwgWet42y6DumTmtHM3JXtwU59kLPIRlJsivsyuIZEdq7Bfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223533;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=25nn/HkE7oyxhnjhncedQj/gdUoKQt+g0+dzDyG0QGw=;
 b=gNrsmxaR1RkpSZkgEy3RcxXyJFeTmbzWbWRIO3YU4fVBzqc+vZyAVOIVb09nmNq58Qv1
 NXHoEh6Unv2jwOrii/Xlt568pUzpNxEt0ONs3l4ZBkhQLcV9De65XdmJjUlf+tQ2VcOMj
 lAcFGO/zCb/y51nujJb+/BJBOK4Yha96RJi4Gm8ccgEbHmukIzqvVt/bZF1yWep1lKl+z
 S18FD1s4xK/MRw6HlLTIlgX0yPqW4qIbMHZIpInEg5S4LBJzZDBZFUy/ccuKXsp/pmhdq
 O9bDwhG5T4ggL6YHS7lHJF3+Da3vfC1NOhQphLO+FIG1EjMXjGhd5Y1b7xBufz5rVHA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=RModEGFk; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::562"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::562; helo=mail-pg1-x562.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x562.google.com (mail-pg1-x562.google.com
 [IPv6:2607:f8b0:4864:20::562])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3215A40234
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:52 +0000 (UTC)
Received: by mail-pg1-x562.google.com with SMTP id
 41be03b00d2f7-cc502d509c0so645003a12.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223532; x=1793828332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=25nn/HkE7oyxhnjhncedQj/gdUoKQt+g0+dzDyG0QGw=;
 b=BL5wm4XrL6xUnDY56v8biqGoPTsXvsi20Qj8brSr8JQMZwWOyCiCo8SgRxb1bgwPXK
 vH7nATTKzwyMyuHnQ/Mpbwm1tSh4GGw7wlM3doJo/HflSY7BgKTS+KpwujIly3JKG+eu
 /gqdyK2VPbqA0KtYG5+fqnyongZIkz3iPXiQZy5UcTzo+MBt+UmvFslzePp90Ne1EFvG
 XZw9s2GWVSqyZv55S60n01I7OeFX9rFR/CRmpudFMgJ7Vq0v/5z2PpxFTZoG1UrTra++
 Uskqkm/5jYYtidftQw8+03ScHv19FA5q5BcS/76JgkNmK4HJafsvfYW10H1uXiJ5BU5s
 021g==
X-Gm-Message-State: AFq9FYLR4Fqua+MnubJg+iIjnZANuAFrKDyW30mDugrAGw7okpFWjLCY
 gVWcaxlFdkOY5FavtlUu+UAehSDGhTvbEewasIRwo6H/hcAnl5UW8nYOQegCcs/+FLtcTpsrudF
 QW9TQfMXFHtyDbajDGEh3pVKfAPT8vtIGlGjLCpGILdlMiJwN6epeBrTLoS/LxahuEOsAy0yKPf
 waNJrAyk4xq0IUcBpnuDZlD0mhm/1cdm2BbILZu3jpTNpJ7c6RRQMmQyyej2otfWOPleHbpZbw+
 YrDrJWeAFnYkxCFiw==
X-Gm-Gg: AYBFou0ouwQrZBwoUDb9sTbmpOlYGp2etwuC6XVExgFuYAKfvtGHogc4BU/j3VDoegT
 F+/z74RGpdnlvGKdG0pqdD32qZEIvrDm+6r6b3mfJP/8bXCQkskOav7kM3YgK3Oc5Lalz2Gxwsq
 nl2/GmA711lH40rFROzPqfWgf665+Lyo9eELn2hAXHBrbc97Atajsgj7guHPEdqBUMyefLYhGhH
 msB+6V1sOX9HZyEjpzcDk0YSRNYy+q1UfQzMQNkVibUxYqHVcnDK2ZLJDMNDTnwAtUTIXcCm2I3
 iOBQcOQZqIpNme8uYvUrZng07NwQCbw+6MYVHwpu+u6PYCyqsEioABDFggdagIrwokjJRHuA488
 SpWmsqUwU6lhYMan7gmJEGvwZly2b1XaG1FZhhl68GswWWpOB1ORUXHLMV1/wULPWdd0NAJUQOB
 5tUHM63nji6xO8vqVm6dYnKjXW9/Wb/p9hr3O9F2bw
X-Received: by 2002:a17:90b:2705:b0:3a8:7096:9b48 with SMTP id
 98e67ed59e1d1-3ae57e357cfmr2668661a91.1.1793223531999; 
 Wed, 28 Oct 2026 14:38:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae55a6d629sm1103754a91.0.2026.10.28.14.38.51
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:38:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5363763b556so32394031cf.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:38:50 -0700 (PDT)
X-Received: by 2002:ac8:5fcf:0:b0:531:11ac:23cf with SMTP id
 d75a77b69052e-53fcb50534emr65429181cf.19.1793223530430; 
 Wed, 28 Oct 2026 14:38:50 -0700 (PDT)
X-Received: by 2002:ac8:5fcf:0:b0:531:11ac:23cf with SMTP id
 d75a77b69052e-53fcb50534emr65428661cf.19.1793223529894; 
 Wed, 28 Oct 2026 14:38:49 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-538394c38easm114397821cf.7.2026.10.28.14.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:38:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:30 -0700
Message-Id: <20261028213744.511429-10-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 09/23] linux: build out of tree
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce <pkg>_SUPPORTS_OUT_OF_TREE. A package that sets it is always
built out of tree:

 - <pkg>_SRCDIR is $(SRC_DIR)/<basename>, i.e. output/source/..., where
   the sources are extracted and patched, while <pkg>_BUILDDIR remains
   in $(BUILD_DIR) and only contains generated files. Other packages
   keep extracting in $(BUILD_DIR), so they are not affected;
 - when <pkg>_OVERRIDE_SRCDIR is set, <pkg>_SRCDIR is the overridden
   directory, used in place: nothing is rsynced into $(BUILD_DIR), only
   the pre/post rsync hooks still run, and the source-related stamp
   files (rsynced, patched, ...) live in the build directory so that
   nothing is created in the user's tree;
 - kconfig packages start from the source directory with O=<builddir>,
   which makes kbuild generate its wrapper Makefile in the build
   directory, so that all the existing -C $(LINUX_DIR) invocations keep
   working unmodified;
 - <pkg>-dirclean and 'make clean' also remove the extracted sources.

Enable it for the Linux kernel. When the sources are overridden, the
source tree must be clean (no in-tree .config, include/config,
arch/*/include/generated).

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 Makefile               |  4 ++--
 linux/linux.mk         |  5 +++++
 package/pkg-generic.mk | 46 ++++++++++++++++++++++++++++++------------
 package/pkg-kconfig.mk |  6 +++++-
 4 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/Makefile b/Makefile
index c1f12a4bfc38..7aa43126540c 100644
--- a/Makefile
+++ b/Makefile
@@ -211,7 +211,7 @@ endif
 # Avoids doing the $(or...) everytime
 BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
-SRC_DIR := $(BASE_DIR)/build
+SRC_DIR := $(BASE_DIR)/source
 BUILD_DIR := $(BASE_DIR)/build
 BINARIES_DIR := $(BASE_DIR)/images
 BASE_TARGET_DIR := $(BASE_DIR)/target
@@ -1133,7 +1133,7 @@ show-vars:
 .PHONY: clean
 clean:
 	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
-		$(BUILD_DIR) $(BASE_DIR)/staging \
+		$(BUILD_DIR) $(SRC_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR) $(O)/pkg-stats.*
 
 .PHONY: distclean
diff --git a/linux/linux.mk b/linux/linux.mk
index a90e09afe906..5734d78aa9a2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -6,6 +6,11 @@
 
 LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPL-2.0
+
+# The kernel is always built out of tree: the sources are in $(LINUX_SRCDIR)
+# and the kernel is built in $(LINUX_BUILDDIR) with O=. When
+# LINUX_OVERRIDE_SRCDIR is set, the sources are not rsynced.
+LINUX_SUPPORTS_OUT_OF_TREE = YES
 LINUX_LICENSE_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_LICENSE_FILES))
 
 LINUX_CPE_ID_VENDOR = linux
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 138fe9ccef4f..0f4bf73fa064 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -171,7 +171,7 @@ endef
 ################################################################################
 
 # Retrieve the archive
-$(SRC_DIR)/%/.stamp_downloaded:
+$(BUILD_DIR)/%/.stamp_downloaded $(SRC_DIR)/%/.stamp_downloaded:
 	@$(call step_start,download)
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DOWNLOAD_DEPENDENCIES))
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
@@ -196,7 +196,7 @@ $(SRC_DIR)/%/.stamp_downloaded:
 	$(Q)touch $@
 
 # Retrieve actual source archive, e.g. for prebuilt external toolchains
-$(SRC_DIR)/%/.stamp_actual_downloaded:
+$(BUILD_DIR)/%/.stamp_actual_downloaded $(SRC_DIR)/%/.stamp_actual_downloaded:
 	@$(call step_start,actual-download)
 	$(call DOWNLOAD,$($(PKG)_ACTUAL_SOURCE_SITE)/$($(PKG)_ACTUAL_SOURCE_TARBALL))
 	$(Q)mkdir -p $(@D)
@@ -204,7 +204,7 @@ $(SRC_DIR)/%/.stamp_actual_downloaded:
 	$(Q)touch $@
 
 # Unpack the archive
-$(SRC_DIR)/%/.stamp_extracted:
+$(BUILD_DIR)/%/.stamp_extracted $(SRC_DIR)/%/.stamp_extracted:
 	@$(call step_start,extract)
 	@$(call MESSAGE,"Extracting")
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_EXTRACT_DEPENDENCIES))
@@ -219,19 +219,19 @@ $(SRC_DIR)/%/.stamp_extracted:
 
 # Rsync the source directory if the <pkg>_OVERRIDE_SRCDIR feature is
 # used.
-$(SRC_DIR)/%/.stamp_rsynced:
+$(BUILD_DIR)/%/.stamp_rsynced $(SRC_DIR)/%/.stamp_rsynced:
 	@$(call step_start,rsync)
-	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
+	@$(call MESSAGE,"$(if $($(PKG)_OUT_OF_TREE),Using out-of-tree source dir,Syncing from source dir) $(SRCDIR)")
 	@mkdir -p $(@D)
 	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
-	rsync -au --chmod=u=rwX,go=rX $($(PKG)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) $(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
+	$(if $($(PKG)_OUT_OF_TREE),,rsync -au --chmod=u=rwX,go=rX $($(PKG)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) $(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D))
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	@$(call step_end,rsync)
 	$(Q)touch $@
 
 # Patch
-$(SRC_DIR)/%/.stamp_patched:
+$(BUILD_DIR)/%/.stamp_patched $(SRC_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
 	@$(call MESSAGE,"Patching")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
@@ -390,6 +390,7 @@ $(BUILD_DIR)/%/.stamp_installed:
 $(BUILD_DIR)/%/.stamp_dircleaned:
 	$(if $(BR2_PER_PACKAGE_DIRECTORIES),rm -Rf $(PER_PACKAGE_DIR)/$(NAME))
 	rm -Rf $(@D)
+	$(if $(filter $(SRC_DIR)/%,$($(PKG)_SRCDIR)),rm -Rf $($(PKG)_SRCDIR))
 
 ################################################################################
 # virt-provides-single -- check that provider-pkg is the declared provider for
@@ -559,13 +560,32 @@ ifndef $(2)_STRIP_COMPONENTS
 endif
 
 $(2)_SRCDIR = $$($(2)_DIR)
-$(2)_BUILDDIR = $$($(2)_DIR)
+$(2)_BUILDDIR ?= $$($(2)_DIR)
 $(2)_SRCSUBDIR = $$($(2)_SRCDIR)/$$($(2)_SUBDIR)
 
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_VERSION = custom
 endif
 
+# Packages that set <pkg>_SUPPORTS_OUT_OF_TREE = YES are always built out of
+# tree: the sources live in $(SRC_DIR), and only the build directory lives in
+# $(BUILD_DIR). When <pkg>_OVERRIDE_SRCDIR is set, the sources are used
+# where they are (no rsync). The source-related stamp files must then not be
+# created in the (user-owned) source directory, so they live in the build
+# directory.
+# Out-of-tree builds are disabled by default. A package infrastructure may
+# set a different default before calling this macro.
+$(3)_SUPPORTS_OUT_OF_TREE ?= NO
+$(2)_STAMP_SRCDIR = $$($(2)_SRCDIR)
+ifeq ($$($(3)_SUPPORTS_OUT_OF_TREE),YES)
+$(2)_OUT_OF_TREE = YES
+$(2)_SRCDIR = $$(SRC_DIR)/$$($(2)_BASENAME)
+ifneq ($$($(2)_OVERRIDE_SRCDIR),)
+$(2)_SRCDIR = $$(abspath $$(call qstrip,$$($(2)_OVERRIDE_SRCDIR)))
+$(2)_STAMP_SRCDIR = $$($(2)_BUILDDIR)
+endif
+endif
+
 ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
@@ -844,11 +864,11 @@ $(2)_TARGET_INSTALL_IMAGES =	$$($(2)_BUILDDIR)/.stamp_images_installed
 $(2)_TARGET_INSTALL_HOST =	$$($(2)_BUILDDIR)/.stamp_host_installed
 $(2)_TARGET_BUILD =		$$($(2)_BUILDDIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_BUILDDIR)/.stamp_configured
-$(2)_TARGET_RSYNC =		$$($(2)_SRCDIR)/.stamp_rsynced
-$(2)_TARGET_PATCH =		$$($(2)_SRCDIR)/.stamp_patched
-$(2)_TARGET_EXTRACT =		$$($(2)_SRCDIR)/.stamp_extracted
-$(2)_TARGET_SOURCE =		$$($(2)_SRCDIR)/.stamp_downloaded
-$(2)_TARGET_ACTUAL_SOURCE =	$$($(2)_SRCDIR)/.stamp_actual_downloaded
+$(2)_TARGET_RSYNC =		$$($(2)_STAMP_SRCDIR)/.stamp_rsynced
+$(2)_TARGET_PATCH =		$$($(2)_STAMP_SRCDIR)/.stamp_patched
+$(2)_TARGET_EXTRACT =		$$($(2)_STAMP_SRCDIR)/.stamp_extracted
+$(2)_TARGET_SOURCE =		$$($(2)_STAMP_SRCDIR)/.stamp_downloaded
+$(2)_TARGET_ACTUAL_SOURCE =	$$($(2)_STAMP_SRCDIR)/.stamp_actual_downloaded
 $(2)_TARGET_DIRCLEAN =		$$($(2)_BUILDDIR)/.stamp_dircleaned
 
 # default extract command
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 8a63d55be033..5e46c62c58e6 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -147,8 +147,12 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 		fi; \
 	done
 
+# For an out-of-tree build, the first kconfig run is what creates the
+# wrapper Makefile in the build directory, so it must be started from
+# the source directory.
 $(2)_KCONFIG_MAKE = \
-	$$($(2)_MAKE_ENV) $$($(2)_MAKE) -C $$($(2)_BUILDDIR) \
+	$$($(2)_MAKE_ENV) $$($(2)_MAKE) \
+	$$(if $$($(2)_OUT_OF_TREE),-C $$($(2)_SRCDIR) O=$$($(2)_BUILDDIR),-C $$($(2)_BUILDDIR)) \
 		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS)
 
 # The specified source configuration file and any additional configuration file
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
