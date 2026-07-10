Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560C3C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 20:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DBC340977;
	Fri, 10 Jul 2026 20:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ST1mH2qYJ0Z; Fri, 10 Jul 2026 20:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DD8A40A2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783715024;
	bh=FG0Urd4WymxecCxdqsY2FdYdDyLUKv15N5tEZtdb6LM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s1gScldC5nHySeS/q/YxBDAqhDagtfk2aweuMxkQ0gmITnArQQ5jTFGNnQy1CnN1b
	 sAWNDvVdcAm3U7f+qYBx97VxRVPK/jLi8fTyj8PEGC1Lbeu/mns2JBnxraI+wtsLpj
	 l9JJv/+ZeaYwR5CEcYojoRwEgGtYjOk/9W/40nCHbxcmahldo+dxNj7r9q3pI8+Lbl
	 6a9MzMUpP+LTbE47eydlfH7q/I7GOuQv7+2SB0SBuWveEMp2iWLGLNuBKOd8GwPMKd
	 48SrjzzEU3jD7NU5PdvcmVRyLt59rJneioqJcjYi4eWZJPvp714Pkd5mzPfsRIqyZ0
	 l9eScLcQRj9kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DD8A40A2F;
	Fri, 10 Jul 2026 20:23:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19304372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0517F608C9
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTDAHwvuros9 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 20:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6082D60877
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6082D60877
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:23:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6597C886D6; Fri, 10 Jul 2026 20:23:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 22:14:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5b8983aadd3c5f43050962338cf7a0427df77dd
X-Git-Newrev: 1d257e242c7fcbe6082d774602032e92b7a2c700
X-Patchwork-Hint: ignore
Message-Id: <20260710202309.6597C886D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: bump to v4.4.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1d257e242c7fcbe6082d774602032e92b7a2c700
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.17.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 2c15d4f0f4..917ac47471 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.16.txt
-sha1  1424ea22b4959f94eb85c1fc3c510f281766144e  wireshark-4.4.16.tar.xz
-sha256  0bda0e34a4c5da72ea9009134d733783d08189c07462198e53a4f533fd1201fd  wireshark-4.4.16.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.17.txt
+sha1  d46443d5bbca3580f944f3effcdfcc59e24eb7f4  wireshark-4.4.17.tar.xz
+sha256  b89a8c60b9282f29be4db91437a6e969e61bc17e8c92ddd980cc38c7304dd772  wireshark-4.4.17.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index ab393b8a48..1fd81515c1 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.16
+WIRESHARK_VERSION = 4.4.17
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
