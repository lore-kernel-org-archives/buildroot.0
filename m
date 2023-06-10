Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE7FC7EE29
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 15:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EE0F84382;
	Sat, 10 Jun 2023 15:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EE0F84382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DoMrh7yQL8b9; Sat, 10 Jun 2023 15:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3870A8436C;
	Sat, 10 Jun 2023 15:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3870A8436C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EE131BF38C
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 15:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 650E860E03
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 15:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 650E860E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWRhUaquKTQe for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 15:38:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 481F060C2F
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 481F060C2F
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 15:38:24 +0000 (UTC)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout02.t-online.de (Postfix) with SMTP id AF2D92ADF5
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 17:38:21 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd74.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q80fT-3kzNCb0; Sat, 10 Jun 2023 17:38:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:42510)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q80fT-0007G9-0c
 for buildroot@buildroot.org; Sat, 10 Jun 2023 17:38:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 17:38:19 +0200
Message-Id: <20230610153819.936259-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686411499-337FDCD8-0F4D15B5/0/0 CLEAN NORMAL
X-TOI-MSGID: b9320157-3b32-498d-ad72-dc0121de6049
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: security bump version
 to 10.01.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch tarball to .xz

Fixes CVE-2023-28879:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-28879

Release notes:
https://ghostscript.readthedocs.io/en/latest/News.html?utm_source=ghostscript&utm_medium=website&utm_content=inline-link

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index ca26a38a02..30c45a5a74 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9561/SHA512SUMS
-sha512  f498384af80654c040635564b8bc9a64c4bb5b0769bb00aade4042bbe9117c482362dc1a1fac72db3ce9487dd5a5bb8fb81b35b360680fe598df33dfbbe79499  ghostscript-9.56.1.tar.gz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10011/SHA512SUMS
+sha512  d944be9e8aef68d1176d64c40db6fa86d55d0c9e30047f2147c02806ab61cfe9ac2cb00d4e5b218ff3c51cc6ed47ceffe1bac4dd9d4cc1760b7974f30c6c2735  ghostscript-10.01.1.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 364fa1469a..d215afccd2 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 9.56.1
+GHOSTSCRIPT_VERSION = 10.01.1
+GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
