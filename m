Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039E6C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 955414063E;
	Sat, 15 Oct 2022 15:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 955414063E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OpJuQs1uHR9r; Sat, 15 Oct 2022 15:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBB104061F;
	Sat, 15 Oct 2022 15:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBB104061F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 72F821BF962
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D02164012B
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D02164012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9d33pUMP6inj for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:37:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01B8C40643
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01B8C40643
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E193486DB5; Sat, 15 Oct 2022 15:37:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:32:06 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3223b8f5c1285516f088371888ed0315e3da52ab
X-Git-Newrev: 66a3f84b573a710ba9384121812f14091e01ca08
X-Patchwork-Hint: ignore
Message-Id: <20221015153717.E193486DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bind: security
 bump to version 9.16.33
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

commit: https://git.buildroot.net/buildroot/commit/?id=66a3f84b573a710ba9384121812f14091e01ca08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Fix memory leak in EdDSA verify processing. (CVE-2022-38178)
- Fix memory leak in ECDSA verify processing. (CVE-2022-38177)
- Fix serve-stale crash that could happen when
  stale-answer-client-timeout was set to 0 and there was a stale CNAME
  in the cache for an incoming query. (CVE-2022-3080)
- Prevent excessive resource use while processing large delegations.
  (CVE-2022-2795)

https://gitlab.isc.org/isc-projects/bind9/-/blob/v9_16_33/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8c31f3b50f7c41f4e79b57a4ff4a1e430367bc63)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 171edc8806..d41a9bbc5e 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.31/bind-9.16.31.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.33/bind-9.16.33.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  8ca2cb6c37b605c70f7a25f0cf8a94d2040e025824db2341b92625efd96e7cfb  bind-9.16.31.tar.xz
+sha256  ec4fbea4b2e368d1824971509e33fa159224ad14b436034c6bcd46104c328d91  bind-9.16.33.tar.xz
 sha256  daf6f1eddf5983ed664a2d125b619e56e2e93917c19d0d41c7586ea153ba2155  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 5e8d9d5033..cfacf0e56b 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.31
+BIND_VERSION = 9.16.33
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
