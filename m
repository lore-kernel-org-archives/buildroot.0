Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598E1C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F35E940414;
	Sat,  5 Nov 2022 21:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F35E940414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egtfjdLIrXbs; Sat,  5 Nov 2022 21:43:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3735A4032A;
	Sat,  5 Nov 2022 21:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3735A4032A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D4FD1BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4989660AB0
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4989660AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mxM1O84dy2NI for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:43:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63D3360AAE
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63D3360AAE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 524FD87E7D; Sat,  5 Nov 2022 21:43:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 22:41:20 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: fccf4a6a425bc9ced056e6e6a712c919fc6fb633
X-Git-Newrev: 9a80348a5d9f1c6d3a3a84e493884e3318c9c607
X-Patchwork-Hint: ignore
Message-Id: <20221105214314.524FD87E7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/expat: security
 bump to version 2.5.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9a80348a5d9f1c6d3a3a84e493884e3318c9c607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Expat 2.5.0 has been released earlier today. Most importantly, this
release fixes CVE-2022-43680: a heap use-after-free vulnerability after
overeager destruction of a shared DTD in function
XML_ExternalEntityParserCreate in out-of-memory situations, with
expected impact of denial of service or potentially arbitrary code
execution.

https://blog.hartwork.org/posts/expat-2-5-0-released
https://github.com/libexpat/libexpat/blob/R_2_5_0/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 26ec7c4d029d281fc4f0d61e18fc83b91142d9a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 15e64a4dc8..c6c25aa3e0 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.9/
-md5  8d7fcf7d02d08bf79d9ae5c21cc72c03  expat-2.4.9.tar.xz
-sha1  be91118bc495ce49b04a3fd0f27df2fb5a843e9b  expat-2.4.9.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.5.0/
+md5  ac6677b6d1b95d209ab697ce8b688704  expat-2.5.0.tar.xz
+sha1  5178e13c1e34f4643d5118d5758babfe0e836fe2  expat-2.5.0.tar.xz
 
 # Locally calculated
-sha256  6e8c0728fe5c7cd3f93a6acce43046c5e4736c7b4b68e032e9350daa0efc0354  expat-2.4.9.tar.xz
+sha256  ef2420f0232c087801abf705e89ae65f6257df6b7931d37846a193ef2e8cdcbe  expat-2.5.0.tar.xz
 sha256  122f2c27000472a201d337b9b31f7eb2b52d091b02857061a8880371612d9534  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 59854d0ee8..6f22024cc0 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.9
+EXPAT_VERSION = 2.5.0
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
