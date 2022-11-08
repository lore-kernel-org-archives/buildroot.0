Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62D5C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 20:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 731E040A6E;
	Tue,  8 Nov 2022 20:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 731E040A6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LeEN5Vsm3RiJ; Tue,  8 Nov 2022 20:28:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41F2D40AA5;
	Tue,  8 Nov 2022 20:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41F2D40AA5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB55D1BF3C6
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6D6E81E7D
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6D6E81E7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KynGom0SXMBC for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 20:28:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D613281E78
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 20:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D613281E78
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C66CE8122C; Tue,  8 Nov 2022 20:28:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 21:26:51 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 378b3917978a9ebaf45a556312a95a23259b9535
X-Git-Newrev: adef0f5a569a63382c650d18acae42ac1f70c274
X-Patchwork-Hint: ignore
Message-Id: <20221108202823.C66CE8122C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/lldpd: security
 bump to version 1.0.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=adef0f5a569a63382c650d18acae42ac1f70c274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

- Fix heap overflow when reading SONMP. CVE-2021-43612.
- https://vincentbernat.github.io/lldpd/ is redirecting to
  https://lldpd.github.io/

https://github.com/lldpd/lldpd/blob/1.0.15/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 62e082ec4d58e117697324938b9833c057116710)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lldpd/Config.in  | 2 +-
 package/lldpd/lldpd.hash | 4 ++--
 package/lldpd/lldpd.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lldpd/Config.in b/package/lldpd/Config.in
index 9a9517b5b0..3e0446986f 100644
--- a/package/lldpd/Config.in
+++ b/package/lldpd/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_LLDPD
 	  lldpd is an ISC-licensed implementation of LLDP for various
 	  Unixes. It also supports some proprietary protocols.
 
-	  https://vincentbernat.github.io/lldpd/
+	  https://lldpd.github.io/
 
 if BR2_PACKAGE_LLDPD
 
diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index 6e809b2796..6db5ca98f1 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.9.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.15.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-sha256  6b64eb3125952b1e33472198b054e8aa0dee45f45d3d4be22789090a474949f5  lldpd-1.0.9.tar.gz
+sha256  f7fe3a130be98a19c491479ef60f36b8ee41a9e6bc4d7f2c41033f63956a3126  lldpd-1.0.15.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index b88dd002e4..dd6f8dcf5d 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.9
+LLDPD_VERSION = 1.0.15
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
