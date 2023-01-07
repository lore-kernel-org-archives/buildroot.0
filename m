Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2633DC46467
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 15:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 533B041584;
	Sat,  7 Jan 2023 15:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 533B041584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VhbazTa172FW; Sat,  7 Jan 2023 15:32:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3567A4159C;
	Sat,  7 Jan 2023 15:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3567A4159C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE6E81BF2A1
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 15:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDF26611E0
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 15:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDF26611E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQcL9Dj6tvdo for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 15:32:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F4F760B53
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F4F760B53
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 15:32:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.160]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MkYbu-1oVXoR3C2Q-00m1cq; Sat, 07 Jan 2023 16:31:57 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat,  7 Jan 2023 16:31:56 +0100
Message-Id: <20230107153156.26347-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:GhcHKNyD7ip8jmEP+bsR3R4sVdqZo6h6f8t6+62tiz0wzedNbbw
 gyrdDLgEmC+HORIh5GcDg4r/lnM/qF+56bp1oiTC3z9i60QxQDCbePoZUMzMXLP5TJGJMAU
 /ZzwbrvC8wZp8S/w0fbRJCb/ubZAlInnj3Y9EeiQFvKMrHS1DRLwVJjg+7w2HFij8r4LEsJ
 +xp3y52/R+6i67przFS/g==
UI-OutboundReport: notjunk:1;M01:P0:aw0d4GDNdPA=;CyMy3M9rvCTQov9r2oNIjO9yXC6
 aJZ/7LaADUlfW5WL/VIdU41SmeKFo4l+JMV0ul9D4KnDJDE+uIEGzNATwgo32TeOLCle+KcAj
 kn5jEK9VLp96IMjbrBe+JNtZBFqCpnUwgRyL9WnvfvRFVaCmnqaP5Gb5YlJNEY9yO1CqZ5D5x
 a30pgl76uv+MzNWPyoK9vhyz68vTjGOQvlxb8TMQLOE5FKiS1uNdGajKFQpYoHkLhwDnZB3cR
 7FpTU04zpqXASDR42FR5SDMNjPC9boH3Tps07e2SvcuujC6M2BI14uxS7VHSMbO5ZUsRJdLbD
 ZEyoHxjgOuv2hSr3Rk1OPLPnEoPmx7slDw7zfgOS+LL0G23qO+N1s5glI/UTml3sFcnQ+hJNC
 qp0J8xnns4jj01ZrPqpzwp1k2ru7pSKaMRvGUskEZYPj/QMIAoLubBkkoZX9z8GzZeDdbmCpk
 jTt3nRbqeSS1qeZwEWj6ROORtj5ZlA0UaxCdTfneOGNax7QC/nYLyRXR37WbxsyWVL0XYT4yJ
 jaYKOa3oM5V5YWixYt6RTMAeeUFBXgPn/+V1mTfjayxoFblqQn7quXMZ70efvZdLpUNIbCFoW
 mjBprb3GPC5UoB81kSWO009a0rYw/A4dqRgEdxwUKwMRhP9Nr06CitKT8zbakhaqd1eJD6IY4
 Tt8XzdJbJl+VCJCyCi/lMLon4aCtCt/Mwa/o+ejGDYNO2V96TCWmVKrwjg5YF94XTGjWz8uca
 XP7CwEUELrws2agJqc6UgFDVNGmA9faNpJq2Y/K0Af2kNkX8D2kqcE1gVS4N8m7P7CDjx8MhT
 0w5ojIAwqYijZuWP8q7Gw9H5Vh5M0t/m96BTYjf7nzruoTFOCzjK4mxeyAB4Wi5fomYE6fDlb
 iSsgf65EQzrvwSp7UDR32msSByKJCW6XvBbU0dfnwilbsnrZQe9PgDV48ylWSZ6LF/hV+xmii
 QbhTo1Z0vLVNvXUEbJAtUZKNRek=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1673105518; bh=pmbHd590JZg6mzvNSbf/n+8HJ638jfNq9Lp7tOvMdx8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=f0zfVPTmG1ZJxIR/yfrYfZ2ghRFvMvmaP473qZEnJsMmxUd0Q53OgDbJ25eSm07WK
 fFVlU8pkYOlp5jY35gWYJh8SvNrGQBZtaNEeu2zpN4KVwFTOlMfrRHKOFl8TCRnp9v
 llu5Lhn1/JcSoJyGZNshFgR7IJpbMMA6ncGct5FMeMgjmliw4HoeoE2RgV+9rUt/CI
 RrXcDAyVKy2Ewx+0ljQhCM1VhaoitaAxhddqddaelgXmn664kkW+4EDDTD4bT6fN3E
 PqK4/9u3rBcxMqC7dyNXP1YXxsx6FRwhAnkywAsGJf0mfHayjyL1fAKtcE42UKD3dG
 oszL5J7fgY18Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=f0zfVPTm
Subject: [Buildroot] [PATCH v1] package/qt6: bump version to 6.4.2
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1] and [2].

[1] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.4.1/release-note.md
[2] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.4.2/release-note.md

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt6/qt6.mk                           | 2 +-
 package/qt6/qt6base/qt6base.hash             | 4 ++--
 package/qt6/qt6serialport/qt6serialport.hash | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 575b2f826c..431bb8c9d3 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT6_VERSION_MAJOR = 6.4
-QT6_VERSION = $(QT6_VERSION_MAJOR).0
+QT6_VERSION = $(QT6_VERSION_MAJOR).2
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 6544a371c6..0c722ccded 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.0/submodules/qtbase-everywhere-src-6.4.0.tar.xz.sha256
-sha256  cb6475a0bd8567c49f7ffbb072a05516ee6671171bed55db75b22b94ead9b37d  qtbase-everywhere-src-6.4.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.2/submodules/qtbase-everywhere-src-6.4.2.tar.xz.sha256
+sha256  a88bc6cedbb34878a49a622baa79cace78cfbad4f95fdbd3656ddb21c705525d  qtbase-everywhere-src-6.4.2.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 54a45681fa..1eaa3d6150 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.0/submodules/qtserialport-everywhere-src-6.4.0.tar.xz.sha256
-sha256  f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa43b91bac614f4a4483  qtserialport-everywhere-src-6.4.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.2/submodules/qtserialport-everywhere-src-6.4.2.tar.xz.sha256
+sha256  336d95919037800184b3c3de8ccb6f62954b20f3756c05adce8d5010504340fa  qtserialport-everywhere-src-6.4.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
