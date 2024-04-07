Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D19CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 07:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98159605A9;
	Sun,  7 Apr 2024 07:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZULsP8xwYoRk; Sun,  7 Apr 2024 07:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCCD7605AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCCD7605AA;
	Sun,  7 Apr 2024 07:59:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60C301BF21A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 07:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A14F605AA
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 07:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gY5d9rchf1gk for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 07:59:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A27CB605A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A27CB605A9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 07:59:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BCD884633; Sun,  7 Apr 2024 07:59:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 09:57:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 516d57dc9c8dbcd991a4f7888556e28f838ac0ce
X-Git-Newrev: 59b48b5cff057f2429b1143d6f50c39d93ca8ef3
X-Patchwork-Hint: ignore
Message-Id: <20240407075910.8BCD884633@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: bump to version v0.3.27
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=59b48b5cff057f2429b1143d6f50c39d93ca8ef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since v0.3.26, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.27

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index a0f054dab7..cd59496908 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.26
-md5  bd496a1c81769ed19a161c1f8f904ccd  openblas-0.3.26.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.27
+md5  ef71c66ffeb1ab0f306a37de07d2667f  openblas-0.3.27.tar.gz
 # Locally calculated
-sha256  4e6e4f5cb14c209262e33e6816d70221a2fe49eb69eaf0a06f065598ac602c68  openblas-0.3.26.tar.gz
+sha256  aa2d68b1564fe2b13bc292672608e9cdeeeb6dc34995512e65c3b10f4599e897  openblas-0.3.27.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index a678153d7b..a3c7a194cf 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.26
+OPENBLAS_VERSION = 0.3.27
 OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
