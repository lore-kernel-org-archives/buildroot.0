Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ECAC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 12:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECB1983F5E;
	Fri, 29 Jul 2022 12:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECB1983F5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uL6CK2ebwmN6; Fri, 29 Jul 2022 12:11:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28D3683F54;
	Fri, 29 Jul 2022 12:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28D3683F54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0BFD1C11A5
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 12:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C99BA40B63
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 12:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C99BA40B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XB2RasGcfHv for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 12:11:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC29C40154
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC29C40154
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 12:10:59 +0000 (UTC)
Received: from localhost.localdomain ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HOpUo2cqebMeiHOpVoNXvg; Fri, 29 Jul 2022 14:10:57 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 14:10:55 +0200
Message-Id: <20220729121055.168510-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220729121055.168510-1-giulio.benetti@benettiengineering.com>
References: <20220729121055.168510-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLPW4qiPa0F2pl7iBFnArImyOpii0y4wNdq5k8oFq5MJbCkTu6h8nh1cjGtPq1kXG242M5lagnaQvTlIljxqZ4/4dsKHR+WwVQsZg1aJrsueRGgGqW+m
 d2BiVjwHZlncKhM5SDM39BZpMwF7rZP3pGW5bSgSzBM/s6rBZ4nFsr7sh5zT0FrpYGWUhFVF++yPpE/JcVIBIwo7kWV2lJ1Ztq1rVOSGmtXkQJFCbimfDn38
 rGP1F7vOmHc+QpeCrZy4yI/KUDAwO5VMtwJI0qsSNxV4w/vtK2bcJteDy81qe1r2kf6EizhkIPGG4vXsn8725WfvcUSeH/SSU+TV5kMskry/GFbM+76jPGW5
 YRJZfo0MztyCC387e6FxOwB/CoSB7cXaAOXbZAObtsPkab0oSZisDirE6m0bHETClta86XXz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659096657; bh=5SGkHVUHamzJdb8cUkJT01JVKxC5jOTiKzjb/SnFaok=;
 h=From:To:Subject:Date:MIME-Version;
 b=iHHC34KAPlb9YjR8pAkyCFsM+kUeESGOK7vS3PFtLGn19ZvfbW2vQzUVZTzAVCnDZ
 jFV/vRJCBL/vzhyUeMI0Tqt+t1YGARAVpz+n3Lj5vjE+5rNzIy2qXz4owC0yjQNE1H
 W/Nwi6QhWuXrYwyiSk/WYwnyQPVfthMwxI2t2Ms9YzBNI6HeLXq2VcKFdTaCGETwT5
 xAafR3eWJq3dz/BdeFoYL4BX7uxEfRe8HgVXbszAiGXIDIBVeffuxarpUCushyYN6J
 XKaAo9MYzf1AYgtG9Iq5XFuLfWNarQWJMS/3jXhQR2K+7v9tD+yBvdaaNQlr7IBoNO
 ugzcsjHAKq3/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=iHHC34KA
Subject: [Buildroot] [PATCH 2/2] package/mariadb: work around gcc bug 68485
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With Microblaze Gcc version <= 11.x the build fails due to gcc bug 68485:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
building mariadb with optimization but not when building with -O0. To
work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using
-O0.

Fixes:
http://autobuild.buildroot.net/results/9b5/9b5dce4958b602c80140440addb1f072332e53c2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mariadb/mariadb.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 06fd1484b6..4c855985b1 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -82,6 +82,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 MARIADB_CXXFLAGS += -latomic
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+MARIADB_CXXFLAGS += -O0
+endif
+
 MARIADB_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="$(MARIADB_CXXFLAGS)" \
 	-DINSTALL_DOCDIR=share/doc/mariadb-$(MARIADB_VERSION) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
