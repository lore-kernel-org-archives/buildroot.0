Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5847DC7619A
	for <buildroot@archiver.kernel.org>; Sun,  2 Apr 2023 11:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6C6E81F6E;
	Sun,  2 Apr 2023 11:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6C6E81F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P4zSSdZHE2PB; Sun,  2 Apr 2023 11:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B60681E70;
	Sun,  2 Apr 2023 11:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B60681E70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 949A41BF47A
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 11:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AC9060C2A
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 11:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AC9060C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIs2YqePA_nn for <buildroot@lists.busybox.net>;
 Sun,  2 Apr 2023 11:42:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD25A60B7C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD25A60B7C
 for <buildroot@buildroot.org>; Sun,  2 Apr 2023 11:42:44 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso18119111wmb.0
 for <buildroot@buildroot.org>; Sun, 02 Apr 2023 04:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680435763;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xodr0fJLmSBq7Y7GbuniQ+/Wjh1bhVN9ABJ923yIzIY=;
 b=5RXvK/ELROzc4SJedBouq3mMxDWw9zIGZ2v1n2opRx3YDnLFKD37V+kj9SNAJlv46E
 ReSKLgcq3kT2E+rsUmKL3ElkcXKDeecRonTY/yPb2AHMK22IaPiJWEX/z4Ca2nuakg52
 /waDI9qYGeoGd8zaW56WptCOZFaOXE0VcgefsFDb4mBjrGod/E6KZHeycuGZgttmwq+R
 k1FksKJzjgjg6WLdS5K+1vkvbEss6nWmiYnk5ulyL/6TFiLwu8kNuAEbnat8Rfjyb1O2
 7VZzZvciDcRNUJG+xepKP56GCZ7j0b6ouEmwIxcQxmq3qspmA6rETAbRTx28qnk1ZFAT
 tmow==
X-Gm-Message-State: AO0yUKXURHdempi8RyJdV46Y9s2kGa/xSjFNwz9DN6j18fH3p12j4INj
 ehY9r8wkZ0uApsCDk0P3JVnHLs4hgkI=
X-Google-Smtp-Source: AK7set+xyo4a+fnnPlH1xASUy4rOFH5mLynuFhK0Ry/1Omw/ApjXrrSxsz6/GiK5A0jqW014n/EQ5w==
X-Received: by 2002:a05:600c:21c1:b0:3eb:3104:efef with SMTP id
 x1-20020a05600c21c100b003eb3104efefmr24606616wmj.31.1680435762448; 
 Sun, 02 Apr 2023 04:42:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m26-20020a05600c3b1a00b003ede2c4701dsm16060082wms.14.2023.04.02.04.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 04:42:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Apr 2023 13:38:46 +0200
Message-Id: <20230402113846.938468-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680435763;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xodr0fJLmSBq7Y7GbuniQ+/Wjh1bhVN9ABJ923yIzIY=;
 b=QJIRqjtXKMIz5D1E9Ak7hW8qvAPuuZ5AMXXHImPXyrqFLe8jN2RiI86xC/kg+xpW42
 ETu/Ydd7wX9Yt/j2VtfCAubI3XEF1aCq5pg58iJWc2AJVhQVjPNDztjq+axcSKSAdKeR
 q3ZWD50iPObzR7oq9RYzOZljG/Euesoyp4SfJUdyFuMsNfmye4IhUSf8bpPo0H/VeLDF
 Sh/AN6xI4kEaJYtu/omGzGvM+hg1/IKZg6txw41M8e3ERt0QuKENhuzk9bKG6P2sWJ04
 CfQNGZJIIiAJCkThzuK1UHGjxuoBqMNVPod38pwktVj5Rrlm6YmPIv2vCyEEhog3ExTa
 h4Hg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QJIRqjtX
Subject: [Buildroot] [PATCH 1/1] package/openpowerlink: bump to version 2.7.2
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/blob/V2.7.2/revision.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openpowerlink/openpowerlink.hash | 8 ++++----
 package/openpowerlink/openpowerlink.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
index 2d8683f09c..b6ae8edcd8 100644
--- a/package/openpowerlink/openpowerlink.hash
+++ b/package/openpowerlink/openpowerlink.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.7.1/
-md5  04524d1b1f9946176dce0ccb0eecf537  openPOWERLINK_V2.7.1.tar.gz
-sha1  4ee9c6e26bbc729fdbbb272155b093ffa0d9cefd  openPOWERLINK_V2.7.1.tar.gz
+# From https://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.7.2/
+md5  80a64b0a2c2dec1e7aff22a06000b3d6  openPOWERLINK_V2.7.2.tar.gz
+sha1  09dcb5bd7cb9d59cb9e60230ae09c558996be25b  openPOWERLINK_V2.7.2.tar.gz
 # sha256 locally computed
-sha256  d0d65f4fb8f2ad209cf9575714f88f33168a1cf71e8f1801e1e1ac4df6a37ffd  openPOWERLINK_V2.7.1.tar.gz
+sha256  2cc660e0f8a939bd65c9f46176d18882dbe1017cbb2567b414a8a7c9af41a356  openPOWERLINK_V2.7.2.tar.gz
 sha256  348e31e9e5094104463d58d33abd31049fdf209afbc12ea7abb7fd4b4a147429  license.md
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 46dc3d10cd..c8dbb66d05 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = 2.7.1
+OPENPOWERLINK_VERSION = 2.7.2
 OPENPOWERLINK_SITE = https://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/V$(OPENPOWERLINK_VERSION)
 OPENPOWERLINK_SOURCE = openPOWERLINK_V$(OPENPOWERLINK_VERSION).tar.gz
 OPENPOWERLINK_LICENSE = BSD-2-Clause, GPL-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
