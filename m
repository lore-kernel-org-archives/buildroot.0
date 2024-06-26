Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40C5C30653
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 08:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 726BD60011;
	Wed, 26 Jun 2024 08:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7GPHlwjYfvmy; Wed, 26 Jun 2024 08:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81DD260017
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81DD260017;
	Wed, 26 Jun 2024 08:49:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12E311BF41B
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 08:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1CED80582
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 08:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vy9wyUsp7vLO for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 08:49:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B49480581
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B49480581
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B49480581
 for <buildroot@busybox.net>; Wed, 26 Jun 2024 08:49:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.75]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxUnp-1sWu3Y2Z1V-011c7g; Wed, 26
 Jun 2024 10:49:41 +0200
To: buildroot@busybox.net
Date: Wed, 26 Jun 2024 10:49:41 +0200
Message-ID: <20240626084941.20913-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Jc0mCxE7mhU5x8auKYe/LzpJs8beWDeQ7B/WjLuXD7lvLYgOZrF
 z1oDc2PfkCzvT7lgPTVZUcwwSMTMLVsdVW68AlfuTSwEaak8l5hvN3oZe5WSl2VM0vpc7rA
 bPwZrXE7chBX7JrkZ9anme8mY3/5NoCA55w/n8U8ewhNSeePje4/c3eMzGO3tgM3Y/7Yd5c
 8W1XyX1WQ7K648uUC7ovw==
UI-OutboundReport: notjunk:1;M01:P0:gQnrhOb5pV8=;wKIPxzNhjqc208eGFImBO9dQX/V
 SZcqOkicAiEsJBqqgIHEXzg9kAvOhac2+KENdcRelrTBkTkJLAp4XtLmblCdADjttLU+5CTa/
 9pHdCK42/MJyYZxJIeJrSPW/D1d+Pl6N6N3yxiue9nQ1zHiKFn4TRVUNySo8w4yBNp4/mMpsk
 Vg1+U8whSgrETR/xBSSyny9BF1uzXKaOyIsjaytRZs+PgIcS2L1wBgXYn5WmP3Q5wVir+MDSO
 cRvQ9TZDkI16fk1ZtkyXyJ5ou9FjNN1H5EYiqnLiOS9H9sgngz9yX+y1WFaTQGGcWKEvXgz3l
 V/cCPNTht+tOd32SjOqgcyFnwIlWZyBmxFzHnUXP3Iw+AScP+4ANBwRhWsXLlYtssjeswJRCg
 8Vi4C/JsPM1pcuFaFoJ1FwVTC6j7BQG8LO1fMVpIE8Sy0Q0zIEQyVZB/LBLQc+Z2fBIso3+Zk
 uOZyUxvVK4dYnBfBEvv8lF8jem1cggPoNwJuUBC8DAFDFwKQrCrYsEzYWRCGxoymOon8o7N9M
 f+e/wXFSEgJDWjhubUnpLAc70zsKvhucFoN9vnZi6MAHN0xp9OV2fgcFLpi1cyRbvOxztGtF+
 oElg5ELHYoXJ8eO+xD/utbF7KVG/j1bhzZq/n909HKpBPlAu6P8l3OJySDqH8k1RuYrh9zZyT
 dbRqN+9O+82/vyP+8iDEleshfxKXzbKw3TFPjxbMbQk+CQYJfmkKMiJTo9xFOPvSYzVNbPK62
 +8ZnQGyGvJxnzlEYiBIN4BVku36KLZZQuazk1jDMEPx+QAL80068CAXDHFuWH8KwDn2WDDn9d
 nYIX8JIa4Jop8mhgjp79nfz+ep7tUGLOrT0q3wkDjW1k4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719391781; x=1719996581; i=ps.report@gmx.net;
 bh=Jn2k8UM86lhV5m1yKWslXPQLm2SMFQEdrCfUMuICVxA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=c/Sje60FwvHnR/CxDWreUOg52sJRQuJ4sJlXuGWSIw3qeMGR1clqR6j94lteFWiI
 ElQ4Kpcfl8bBgi66TEX2BAEUs8gVpx2WyE1Bs+FHcFNd70/eCWqMfe+jF8RzLavAl
 CFNy8uqtsnmxO8zKKqxB4XtdiToXWrMnjJlBwdYJPnoxlHyD8WV/QbhAtqmbuAOIW
 foIa9hrY7IPT1dRbSY31CvVHqKjUsRajrFyser0C2FZ/IKylBc0SUBjF3d1t/tJVm
 zh3/4LvzjIJswatgddJJMwkIZtg1jCIMTlIaygPtVGxWpA7RvyZnbFLXHXhIyO5/Y
 riyzlxkn+7dm0qw7fg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=c/Sje60F
Subject: [Buildroot] [PATCH v1] package/pciutils: bump version to 3.13.0
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://github.com/pciutils/pciutils/blob/master/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/pciutils/pciutils.hash | 2 +-
 package/pciutils/pciutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index 2ac28d327b..f6a3f9eef6 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,3 +1,3 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256  238a2e27166730e53a17fe07bfad229e07fa39b618117e5944b6d7eda9fbb0e9  pciutils-3.10.0.tar.xz
+sha256  77f11f78298502634d1af50308f15a5788629f6cf45cba376f5009aea4cb4926  pciutils-3.13.0.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index a6708ce94b..ea3c21db6a 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.10.0
+PCIUTILS_VERSION = 3.13.0
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
