Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAC8C43334
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 10:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB05F84750;
	Thu, 21 Jul 2022 10:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB05F84750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2cH5b4P6GF6w; Thu, 21 Jul 2022 10:51:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4EA084751;
	Thu, 21 Jul 2022 10:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4EA084751
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7011B1BF3CD
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 10:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4772160D8C
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 10:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4772160D8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGgVY-tssfo0 for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 10:51:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2B9460DC6
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2B9460DC6
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 10:51:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7789F1814B9; Thu, 21 Jul 2022 12:51:45 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 21 Jul 2022 12:47:25 +0200
Message-Id: <20220721104733.3603090-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1658400711; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=vAFCWgl0qtjjq8ySvmDJ/Apk42XavXBirZ7ajSdNhJ8=;
 b=abZXe4ukdW9+IvdW9T/2ZiQX1tUe6sDw5/mTYP65DsWQSSrydUUIvg+mqiBlDqM7OkIYt/
 0Gpf9P5DKl+GDpCoqwuusXwAI2sUW0BeaZsvz2jPi59Hkgu5gOWQJDpIt65J+rOnWzd0h0
 WE0fOCZYcMDVRkSqKIR3DhReeqWiXWs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=abZXe4uk
Subject: [Buildroot] [PATCH] package/{python-}protobuf: bump to version 21.3
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

protobuf changed its versioning scheme [1]. The Release version is now only
the Minor.Patch version of the language specific version.

C++ stays on version 3, but python got bumped to 4. So the handling in the .mk
files changed to reflect that.

[1] https://developers.google.com/protocol-buffers/docs/news/2022-05-06

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 6 ++++--
 package/python-protobuf/python-protobuf.hash | 2 +-
 package/python-protobuf/python-protobuf.mk   | 3 ++-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index f37b2dee40..1006fd3d64 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  dddd73664306d7d895a95e1cf18925b31b52785e468727e4635b45edae5166f9  protobuf-cpp-3.20.1.tar.gz
+sha256  c98a4f17ed57e9e4dafc4a52e76ee012f9a6a13750488b20b4c370a3eb1561fc  protobuf-cpp-3.21.3.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index c4c33ba7da..5c08421bbc 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,9 +7,11 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 3.20.1
+PROTOBUF_VERSION_MAJOR = 3
+PROTOBUF_VERSION_MINOR = 21.3
+PROTOBUF_VERSION = ${PROTOBUF_VERSION_MAJOR}.${PROTOBUF_VERSION_MINOR}
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
-PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
+PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION_MINOR)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
 PROTOBUF_CPE_ID_VENDOR = google
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index ddfa48b491..06ec32c5b5 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d3449b4df32ca155f8cd71051db916b2bf74cc925760e269c0acf09b48ec1cb8  protobuf-python-3.20.1.tar.gz
+sha256  ab5cda843c1fa2a34c5cdd30b65ae8bd148d8063e7f1b2bfe7daf23e763b0ff2  protobuf-python-4.21.3.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index b91ba49339..8c21779faf 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
+PYTHON_PROTOBUF_VERSION_MAJOR = 4
+PYTHON_PROTOBUF_VERSION = $(PYTHON_PROTOBUF_VERSION_MAJOR).$(PROTOBUF_VERSION_MINOR)
 PYTHON_PROTOBUF_SOURCE = protobuf-python-$(PYTHON_PROTOBUF_VERSION).tar.gz
 PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
