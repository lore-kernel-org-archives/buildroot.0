Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CC2C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 08:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 558E1418BD;
	Tue,  9 Jan 2024 08:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 558E1418BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-82_Pwj5GFg; Tue,  9 Jan 2024 08:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D13E418B4;
	Tue,  9 Jan 2024 08:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D13E418B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9428C1BF2F4
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CD6A418B4
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CD6A418B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tb7bDHsNmNr0 for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 08:19:21 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DB17417D4
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 08:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DB17417D4
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3606eb704edso13278245ab.2
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 00:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704788360; x=1705393160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jgt7//RhucRMKtqSH5q3Vwx0bT4G6meHvVTYo/MVbPM=;
 b=SUEt9KDyyCOMZgfxkHrXzHHlxsKQgB1g4mw9ajDGWD10lI782UkHHAntZjrBrt0fGN
 iee6ykpOetUwLPEd5TVQWC+GuyYHbRCQnLgB8h0HBdGnnEOe32+SDZnXsQfKcWFzLBaD
 COoCACuZ+fvrmYyClWo9BlhTsZcuI5AguyNaQk4tU6hCNysvYHEYSwtMw74I8TB9BIF8
 1NEBVn5CDIZksH/l/KhAxIVjLShR3TLDfYrSygXZSG/fBZA54/8PU3nzqI/DJDLKzb1X
 yG22/1Kru/PNNepuG50vEJ2Amid+QtFMog8zgXx704QA8ePag1Z1rdhDmXuzke58YCDd
 X9MQ==
X-Gm-Message-State: AOJu0YyY4rWGLiPBj61GVHUvh4bgq6S+C+qCQ6IMbtERfQQvBGLNixxj
 CqO/4Azf6o52BtweBJ7GBeoRnjLOytQuPw==
X-Google-Smtp-Source: AGHT+IGf1A8MxfrXi7Iqx9+MT11rI7Ai7xOyP0e0BGLuKvBH7I86rzFsW4s1Mf8BF1Pf5Bdz3clD7g==
X-Received: by 2002:a92:c54b:0:b0:35f:a46f:f40a with SMTP id
 a11-20020a92c54b000000b0035fa46ff40amr5960530ilj.11.1704788359938; 
 Tue, 09 Jan 2024 00:19:19 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 i13-20020a02c60d000000b0046dd3f7c08bsm495915jan.78.2024.01.09.00.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:19:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 01:19:17 -0700
Message-Id: <20240109081917.4070744-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704788360; x=1705393160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jgt7//RhucRMKtqSH5q3Vwx0bT4G6meHvVTYo/MVbPM=;
 b=eoTJGmPYh1Ebrg7GApIZFV0uxoD6VHnPkcgdnEhn3BEGyiDNGGHEkkWUZowibMFA3O
 ZiYjmBsM2U8LPZuzRBlWP0o41+jlE1Y2qb6GSIlgRDo3crhfEMn0v0gLodoyi1RGB4tw
 amY9D3MK4zhNNqkkSmG2ja2NoI6Aiv3l/E9ZRR3Kvfbdoouje7aIaOYt2xF3Jm+tCFPO
 QXJB57dwqana/M7a1mvmvlTZHx+onYyQaJ42DQRM7MKk79iTou6z00IfNKTL2KLTho14
 iQreAr9pfV+oYhWlS7dudFiz3ozPUNNx0ih8o4rCsQpLeM8jiIc2q2Pm9By5fIcEvsN0
 HMGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eoTJGmPY
Subject: [Buildroot] [PATCH 1/1] package/python-hwdata: bump to version 2.4.1
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required license file download.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hwdata/python-hwdata.hash |  6 +++---
 package/python-hwdata/python-hwdata.mk   | 13 ++-----------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/package/python-hwdata/python-hwdata.hash b/package/python-hwdata/python-hwdata.hash
index 0c7ca31476..57c2dd0003 100644
--- a/package/python-hwdata/python-hwdata.hash
+++ b/package/python-hwdata/python-hwdata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hwdata/json
-md5  dccf3b28d06fb9c6f56875e148356c24  hwdata-2.3.7.tar.gz
-sha256  9e5c96be38d9218ffde40834d4ca03344b8dfaed29c8c5afe0030125ea03db03  hwdata-2.3.7.tar.gz
-# Locally computed
+md5  0344fe7a3e21041c2ef0ed36ee2bef18  hwdata-2.4.1.tar.gz
+sha256  9bad80237c81cc091615179d665a3ef1213acca4caa378ff037c81f34538cde9  hwdata-2.4.1.tar.gz
+# Locally computed sha256 checksums
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/python-hwdata/python-hwdata.mk b/package/python-hwdata/python-hwdata.mk
index 5e968ce847..c277eebccc 100644
--- a/package/python-hwdata/python-hwdata.mk
+++ b/package/python-hwdata/python-hwdata.mk
@@ -4,20 +4,11 @@
 #
 ################################################################################
 
-PYTHON_HWDATA_VERSION = 2.3.7
+PYTHON_HWDATA_VERSION = 2.4.1
 PYTHON_HWDATA_SOURCE = hwdata-$(PYTHON_HWDATA_VERSION).tar.gz
-PYTHON_HWDATA_SITE = https://files.pythonhosted.org/packages/15/26/f5bc1b42129fbcbd1c99c29714af1685fc89e2cf37680a9930d4fcac1808
+PYTHON_HWDATA_SITE = https://files.pythonhosted.org/packages/ff/ec/4a6e57d765a63f7e9a8c5348f0bf3f7d39243dc5bc695fa1e887ca5856c8
 PYTHON_HWDATA_SETUP_TYPE = setuptools
 PYTHON_HWDATA_LICENSE = GPL-2.0+
 PYTHON_HWDATA_LICENSE_FILES = LICENSE
 
-# There is no LICENSE file in the PyPi tarball, but it is available in
-# upstream git repository:
-PYTHON_HWDATA_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/xsuchy/python-hwdata/python-hwdata-$(PYTHON_HWDATA_VERSION)-1/LICENSE
-
-define PYTHON_HWDATA_ADD_LICENSE_FILE
-	cp $(PYTHON_HWDATA_DL_DIR)/LICENSE $(@D)
-endef
-PYTHON_HWDATA_POST_EXTRACT_HOOKS += PYTHON_HWDATA_ADD_LICENSE_FILE
-
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
