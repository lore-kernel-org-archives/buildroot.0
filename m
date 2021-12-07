Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C24C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 17:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 631898248F;
	Tue,  7 Dec 2021 17:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W068jjU3pd_u; Tue,  7 Dec 2021 17:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8F9582457;
	Tue,  7 Dec 2021 17:14:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70D2B1BF291
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 17:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6080382457
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 17:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vNEC6YG6MVi9 for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 17:14:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65D7F82451
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 17:14:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a9so30865206wrr.8
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 09:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lKSYxriL3+XrRWnnG9BdDs8IS34ANJR4P/QGEjTPu88=;
 b=lMF7Ks/uHlm8/niVjlUZKFfFqzcsTVLN0nJaGvtDbMSuDz9A4ou8APh7Rhdj0iYgOl
 U0VGyl2p+xX+ODusjndat9Wn57Rt2s9qpahu0BnbQ+tkfOI8/jESC0V9NxqZpm1GuFks
 gTsQk4/YIozj2kfLhEOXKRToYSQceq+SlNKR+BUzOoUW3k7Y6xo+3ePBxtz1XPHWUmvH
 gMhKugBIivtobbh/gjinSEvZZ4ckvFn/2Effyl0GRDs5PVCkqQkdNBAsnn2oJYkLZG97
 saGxylMjaAm1hwLYz2a5g5PokSnnRQUkYb2EEKb70v1CabJU5xan5t2hpb9nuR+WlCJf
 /xCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lKSYxriL3+XrRWnnG9BdDs8IS34ANJR4P/QGEjTPu88=;
 b=QALGYAW9v2nd0R5lsBlkRjPgmVBIsqCo+5+rh/v/3Hat6KR4Ns6ts1QFKi6QqNJpNW
 pAyNRBUH6gTbjTrw0kkFEj9fia5b3EnOGq5s8ohEkksrMDRBxzG2qaxyEgMGIo03VUdz
 6mvewSDaP9hGgRi0bm1j0/MQdmN5Zw2SjIdnu74IXRLVgHc/EBL3/zwBPcn15xQLLhv3
 CnqxmMwEVwfYt5FD1f14iZ2Gg9IpWIzxwXc1n8FVNB2Ebpt3IV2yGmYLL5U9yrg+F7kK
 aDoIQ798BSLHwasyhySK53Midf2Pm4FGWvp726EC3CzEHxiEpBDe6VCQsTtCU90fwDxI
 euEQ==
X-Gm-Message-State: AOAM533TBQws8ysEtm6WXXKaYD5roVHGn9tjUHBrnmspJrCclFVFingB
 FDCsr2fu2Wuck5UdzwjicE80R9HGLdnQ/g==
X-Google-Smtp-Source: ABdhPJyLh4igI7EMayxOeNg97zuK+H7uW1BUuKpOG3QcFt9+UYGGutOgy8CqMW+OBewUe6IFhmbuhA==
X-Received: by 2002:adf:dbd2:: with SMTP id e18mr51608268wrj.478.1638897265241; 
 Tue, 07 Dec 2021 09:14:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h18sm331022wre.46.2021.12.07.09.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 09:14:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Dec 2021 18:14:24 +0100
Message-Id: <20211207171424.2857299-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/frr: bump to version 8.1
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- host-elfutils is mandatory since version 8.0 and
  https://github.com/FRRouting/frr/commit/5609b3af497c44d980aad2bc7d6332dedd7974e7
- This bump is needed to fix the following build failure since bump of
  libyang to version 2.0.112 in commit
  2a3edc5e00b38f4f927894d0911990c9060e4415:

In file included from lib/northbound.c:20:
lib/northbound.c: In function 'nb_node_check_config_only':
lib/northbound.c:97:22: error: dereferencing pointer to incomplete type 'const struct lys_node'
   97 |  if (CHECK_FLAG(snode->flags, LYS_CONFIG_R)) {
      |                      ^~

- Update indentation in hash file (two spaces)

https://github.com/FRRouting/frr/releases/tag/frr-8.0
https://github.com/FRRouting/frr/releases/tag/frr-8.1

Fixes:
 - http://autobuild.buildroot.org/results/bd779ee960ba2181bc60313569c77c1e60b4e726

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/frr/frr.hash | 4 ++--
 package/frr/frr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 3a044d4c2a..bb6c32b7bb 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 030d4e66f577726dfea13bd3a9c669fd41d8fd89b25953a36b5b0966d406ff28  frr-7.5.1.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  9d82c11b304ab89a30627fcbb4150f51e639f473f8563976e14101e796240599  frr-8.1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index d1ca6e0b18..e707f50ca1 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 7.5.1
+FRR_VERSION = 8.1
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0
 FRR_LICENSE_FILES = COPYING
@@ -15,7 +15,7 @@ FRR_AUTORECONF = YES
 FRR_DEPENDENCIES = host-frr readline json-c \
 	libyang libnl c-ares
 
-HOST_FRR_DEPENDENCIES = host-flex host-bison host-python3
+HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
 
 FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 	--sysconfdir=/etc/frr \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
