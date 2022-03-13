Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3596C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 09:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 815EC81AF4;
	Sun, 13 Mar 2022 09:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WXzkIlAkH_ZJ; Sun, 13 Mar 2022 09:29:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DC0C81ABB;
	Sun, 13 Mar 2022 09:29:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E91E21BF2A6
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1A3760E3A
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2WV0Z9jclZ3k for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 09:29:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA73C60BA3
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:29:13 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 v130-20020a1cac88000000b00389d0a5c511so3734408wme.5
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 01:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Zgjn3WR0gSM+4URGe2hTNHLe+KLrASdmO13F0FV58c=;
 b=qn/KXXB60dgdGXhq/hYKH1WYoOk75ewn9hyU86VZZNPCykq9Fz7Rz47mhOryrmL5Xk
 8yU3jNLi4Dr6/NMsPAUNSlBeIYF6gZIgGMKu+x15+XARCf+S7WR7V9hfzaVcADztVs+K
 LABL52YmS39O3ITmGKCaah97qB1Xbo8sC2ir3Eu1b0rZC3nGJib23EeBR3J8Vq/zbe/Z
 SfTAVZtEzfoBnjGtF/PAv+1Bt8z0mpjbFz7juyzcfiUwMVnctFeJKXLStXyceWqGgFjs
 06FEl20a2Pot3Q/llxyPSTaaxL9slpF2Aq39QhGDHxx9dpk7IFe5DT2kylh5YOzHpTEg
 tcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Zgjn3WR0gSM+4URGe2hTNHLe+KLrASdmO13F0FV58c=;
 b=WCUtewpDn17ucmykjCKgWIBtBZwewuQvJKpjyXyAb7uvBXwNYFKSkl3ZSpf3t9L1jz
 nNyLqV9eDxTPPOeXKjNh8TUuzDji/SHuapbdzrN4Acv5pvGWLWHUlRPSnHbDTSvBgp6P
 BPYZXdVrhnh2r0wP9CNyjFzJoHsNa+vphh/Yvikv1aIkx9Mo6/dk4x3bxDHh/q2w0AEY
 Bi7HNvZY2XVagSyOFksoKngwnDskAm7+yzeQ38XvA1hSL30/m6RbL2QcA/aSkSPHZXw1
 yM39P8VJM2nmZ0JdeCkst21dKNJOrYv0XoXZBmGo43TgyNW5KIdKl6cjL7bwiK5XIKx+
 N3EQ==
X-Gm-Message-State: AOAM530C3mgXfRdhcD+xfhdYxDJtigwjvaRMB6jrhSHcLc4XjBFftMu/
 Qn26J/fqA4Z8rA86AvrvGNFatWGPyrM=
X-Google-Smtp-Source: ABdhPJxDzq6cCHAKV6WfPKixIFSHNQ91ot5bj3PQgLD25aFj98SX9hZgMZGNRkymm3sclHMktWpiLQ==
X-Received: by 2002:a05:600c:19cc:b0:389:d0a8:d3ab with SMTP id
 u12-20020a05600c19cc00b00389d0a8d3abmr16429136wmq.57.1647163751905; 
 Sun, 13 Mar 2022 01:29:11 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c2c4c00b003816932de9csm14808452wmg.24.2022.03.13.01.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 01:29:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 10:28:21 +0100
Message-Id: <20220313092821.357580-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tree: fix build with gcc 4.8
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since bump to
version 2.0.2 in commit 11a3989dbf7ac2535fac04b24ab3d959da3686b3:

color.c: In function 'parse_dir_colors':
color.c:103:11: error: redeclaration of 'i' with no linkage
   for(int i=0; i < DOT_EXTENSION; i++) color_code[i] = NULL;
           ^

Fixes:
 - http://autobuild.buildroot.org/results/e05595696727622eaf517944d4ff4414baf66bb2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tree/tree.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index 7c111b47d2..da0acbae49 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -11,7 +11,8 @@ TREE_LICENSE = GPL-2.0+
 TREE_LICENSE_FILES = LICENSE
 
 define TREE_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -std=c99" \
+		-C $(@D)
 endef
 
 define TREE_INSTALL_TARGET_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
