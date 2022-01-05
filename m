Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36797C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 10:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0B2F408DD;
	Wed,  5 Jan 2022 10:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xq78ybsR_hBV; Wed,  5 Jan 2022 10:14:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B69FF408DB;
	Wed,  5 Jan 2022 10:14:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9996F1BF589
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 10:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94632408CB
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 10:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LuUrSe4LRX_n for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 10:14:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82114405DD
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 10:14:34 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id h23so37551699iol.11
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 02:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+GjfPmadGYuaOIMmbkNaoVgg718q+j4UpoSxderLyYA=;
 b=F6JLWwF57lKs5dRz9chPitbbXVAlwXbGbSVUH8OhRE/oBa1gslN5Z0wYfWz4qTI9C6
 lALTdAw5wx6m5rOKwWMZfBfUyGe6T6ILwnfKeMJKNHRf4Qq7Tll9N6mKjQrIE+ubxAEe
 42G86cfy4zJ7iZwpoSicbOEzBWwK9F9tGFpQTHJlGMN4Mf/HtMeUf3jEbGbnxdmSO1hN
 QBgBnK3kb8xmlOxej5pVlf4mKemVNtumZti4rYmj8/9w26AzbjInsgmRoorPEM0EIQvs
 Ann+d9hZlzdb3Wz3NE3OC4Kh4fErdS6ls8pt1g2af9ZkPv1DkDVkK1zr5TaKdGqNXw51
 +1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+GjfPmadGYuaOIMmbkNaoVgg718q+j4UpoSxderLyYA=;
 b=TLiRd/QlZn5JZBu5FoT7qk2pw7QBFul/GpKWC+1SZ4awazCFifqHMMwqwd9rKWJ1/h
 xPvFVNES1Syl+4ktWq7xrjDTi+z0bFeqYiKKykVcWPux3TByAcnYtwJ29b7CY9txWV9N
 Z1dMOHUTeo+WDRtPY6Us3ZDbfvaNkmHWck35Rpd3KhhN1wDpNobElntDcDBvBJKW7P9J
 ofDZpf1qelye2WwXUZbh6QMWZPndhyQ5ijU1ZQedzeLPYYKCCvYIAhOMD5RtYX0ukeDT
 OLrSQOk+lVt4l90585bbCwTkPkPvSuAhjmRvEc+TvMDVIEy4RAPTXXzm5zDszreB2OHd
 4nvw==
X-Gm-Message-State: AOAM531Cqihc2n+ASn8n5Jnc8X+8gvxuPsfoWubh5HnX888V+NFcNM2r
 m9SQrVvTGtXJLNd4xoqFoTmUX4TVlI8r6A==
X-Google-Smtp-Source: ABdhPJwjGFHxpYUlKJoNbroKVaj+LRN6qUe5PtsFXKpSUMiwMcuPyxzkSJmvJjGJy5mS5g+bY38skQ==
X-Received: by 2002:a02:cce5:: with SMTP id l5mr23163028jaq.126.1641377673328; 
 Wed, 05 Jan 2022 02:14:33 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id n5sm5040366ilk.44.2022.01.05.02.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 02:14:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jan 2022 03:14:28 -0700
Message-Id: <20220105101430.175648-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/qt5/qt5webengine-chromium-catapult:
 new package
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version of catapult is python3 compatible and will be used to
replace the python2 only version in qt5webengine-chromium.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../qt5webengine-chromium-catapult.hash             |  3 +++
 .../qt5webengine-chromium-catapult.mk               | 13 +++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
 create mode 100644 package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk

diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
new file mode 100644
index 0000000000..8190a6dd5d
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  66b8593e665c4236f7b1c487548d41d3826eddbf486ff985dbdfd01cddcaa1a8  qt5webengine-chromium-catapult-5eedfe23148a234211ba477f76fc2ea2e8529189-br1.tar.gz
+sha256  f0df289ba9d03d857ad1c2f5918861376b1510b71588ffc60eff5c7a7bfedb09  LICENSE
diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk
new file mode 100644
index 0000000000..fac3c996fa
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# qt5webengine-chromium-catapult
+#
+################################################################################
+
+QT5WEBENGINE_CHROMIUM_CATAPULT_VERSION = 5eedfe23148a234211ba477f76fc2ea2e8529189
+QT5WEBENGINE_CHROMIUM_CATAPULT_SITE = https://chromium.googlesource.com/catapult.git
+QT5WEBENGINE_CHROMIUM_CATAPULT_SITE_METHOD = git
+QT5WEBENGINE_CHROMIUM_CATAPULT_LICENSE = BSD-3-Clause
+QT5WEBENGINE_CHROMIUM_CATAPULT_LICENSE_FILES = LICENSE
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
