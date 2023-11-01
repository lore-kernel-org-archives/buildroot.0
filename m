Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21153C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 12:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B978D430DB;
	Wed,  1 Nov 2023 12:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B978D430DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7W34DW10Va2P; Wed,  1 Nov 2023 12:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06484430E5;
	Wed,  1 Nov 2023 12:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06484430E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB8C11BF388
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 12:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B17CB8142C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 12:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B17CB8142C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rgN2XTSxgavg for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 12:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DD5981429
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 12:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DD5981429
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC27186333; Wed,  1 Nov 2023 12:10:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 12:51:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c9dc366bf92caed532ac225fd0406e9c09ff42f
X-Git-Newrev: 1c65ba5c1d07ff311b85f65dacaebd99eb903ec0
X-Patchwork-Hint: ignore
Message-Id: <20231101121002.EC27186333@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aespipe: bump to version 2.4g
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c65ba5c1d07ff311b85f65dacaebd99eb903ec0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

aespipe-v2.4g     October 23 2023
    - Added configure script autodetection for -fno-strict-aliasing compile
      flag. This option is needed with some compilers that miscompile code
      when link-time-optimization is used.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aespipe/aespipe.hash | 8 ++++----
 package/aespipe/aespipe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/aespipe/aespipe.hash b/package/aespipe/aespipe.hash
index f7491278e0..4fe7d0753b 100644
--- a/package/aespipe/aespipe.hash
+++ b/package/aespipe/aespipe.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/loop-aes/files/aespipe/v2.4f/
-sha1  2c23e1a6be298cf4f173f06b1123e4ecd5e9a202  aespipe-v2.4f.tar.bz2
-md5  ed05c62c1954110f009bedda4bc1562f  aespipe-v2.4f.tar.bz2
+# From https://sourceforge.net/projects/loop-aes/files/aespipe/v2.4g/
+sha1  fb6b0108176d653f0e5b3be2385b132be791d800  aespipe-v2.4g.tar.bz2
+md5  c216c6c9e939fac69f859af0ad2fd8ef  aespipe-v2.4g.tar.bz2
 # Locally computed:
-sha256  b135e1659f58dc9be5e3c88923cd03d2a936096ab8cd7f2b3af4cb7a844cef96  aespipe-v2.4f.tar.bz2
+sha256  bfb97e7de161e8d7ce113b163bda1d1a8ec77d2c1afab56dcc8153d7a90187fc  aespipe-v2.4g.tar.bz2
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index fd4f776dda..4769536d2f 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AESPIPE_VERSION = 2.4f
+AESPIPE_VERSION = 2.4g
 AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
 AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
