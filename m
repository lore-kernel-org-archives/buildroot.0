Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE2DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC391416C7;
	Thu, 27 Jan 2022 07:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DUZq3igH8Jzf; Thu, 27 Jan 2022 07:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1823741660;
	Thu, 27 Jan 2022 07:13:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B67AB1C1135
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A395E41C5D
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J1yZ7RVxqiq2 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAC1D41C5A
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:12:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 68431814A4; Thu, 27 Jan 2022 07:05:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 08:09:39 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 28d817c058aa7cbb24ccd3f67c17012fbd22f8ce
X-Git-Newrev: 652752cb4d9b2709519198761b36c24761a30be9
X-Patchwork-Hint: ignore
Message-Id: <20220127070548.68431814A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/sofia-sip: bump
 version to 1.13.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=652752cb4d9b2709519198761b36c24761a30be9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Removed patches which were applied upstream:
https://github.com/freeswitch/sofia-sip/commit/f6f29b483e9c31ce8d3e87419ec3deea8679312d
https://github.com/freeswitch/sofia-sip/commit/d568475eb7291bc72f585a116319b05d80b818e1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7210b40c93c8c2d3ac1f51e546544b8453974a9b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ag.h-reintroduce-soatag_local_sdp_str_ref.patch | 30 -----------------
 .../sofia-sip/0002-sofia-sip-fix-s2tcase.c.patch   | 38 ----------------------
 package/sofia-sip/sofia-sip.hash                   |  2 +-
 package/sofia-sip/sofia-sip.mk                     |  2 +-
 4 files changed, 2 insertions(+), 70 deletions(-)

diff --git a/package/sofia-sip/0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch b/package/sofia-sip/0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
deleted file mode 100644
index 57c0bfe250..0000000000
--- a/package/sofia-sip/0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From bcd0f17fd83f2dfe570a3ab17249a5c7290b27f2 Mon Sep 17 00:00:00 2001
-From: Pekka Pessi <Pekka.Pessi at nokia.com>
-Date: Thu, 24 Mar 2011 14:45:21 +0200
-Subject: [PATCH] soa_tag.h: reintroduce soatag_local_sdp_str_ref
-
-Thanks to Erik Habicht <e.habicht at thiesen.com> for spotting it
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[rebased for sofia-sip 1.13.1-d10a3d268c, patch sent upstream
- https://github.com/freeswitch/sofia-sip/pull/23]
----
- libsofia-sip-ua/soa/sofia-sip/soa_tag.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/libsofia-sip-ua/soa/sofia-sip/soa_tag.h b/libsofia-sip-ua/soa/sofia-sip/soa_tag.h
-index 723ca02..d9448d6 100644
---- a/libsofia-sip-ua/soa/sofia-sip/soa_tag.h
-+++ b/libsofia-sip-ua/soa/sofia-sip/soa_tag.h
-@@ -130,7 +130,7 @@ SOFIAPUBVAR tag_typedef_t soatag_local_sdp_ref;
- SOFIAPUBVAR tag_typedef_t soatag_local_sdp_str;
- #define SOATAG_LOCAL_SDP_STR_REF(x) \
-   soatag_local_sdp_str_ref, tag_str_vr(&(x))
--SOFIAPUBVAR tag_typedef_t soatag_session_sdp_str_ref;
-+SOFIAPUBVAR tag_typedef_t soatag_local_sdp_str_ref;
- 
- #define SOATAG_AF(x)             soatag_af, tag_int_v((x))
- SOFIAPUBVAR tag_typedef_t soatag_af;
--- 
-1.7.7
-
diff --git a/package/sofia-sip/0002-sofia-sip-fix-s2tcase.c.patch b/package/sofia-sip/0002-sofia-sip-fix-s2tcase.c.patch
deleted file mode 100644
index a2cc412843..0000000000
--- a/package/sofia-sip/0002-sofia-sip-fix-s2tcase.c.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From d66a2e55daf223737c07c59b1be45a2d91212ef6 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 26 Jul 2020 13:47:16 +0200
-Subject: [PATCH] [sofia-sip] fix s2tcase.c
-
-Fixes build error with recent libcheck:
-https://github.com/freeswitch/sofia-sip/issues/22
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- s2check/s2tcase.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libs/sofia-sip/s2check/s2tcase.c b/libs/sofia-sip/s2check/s2tcase.c
-index 382aaa3ad7..d67694c2ce 100644
---- a/s2check/s2tcase.c
-+++ b/s2check/s2tcase.c
-@@ -57,7 +57,7 @@ void s2_tcase_add_test(TCase *tc, TFun tf, char const *name,
-       if (strcmp(*patterns, "*")) {
- 	printf("%s: selected\n", name);
-       }
--      _tcase_add_test(tc, tf, name, signo, 0, start, end);
-+      _tcase_add_test(tc, tf, name, signo, start, end);
-       return;
-     }
-   }
-@@ -67,7 +67,7 @@ void s2_tcase_add_test(TCase *tc, TFun tf, char const *name,
-       if (strcmp(*patterns, "*")) {
- 	printf("%s: selected\n", name);
-       }
--      _tcase_add_test(tc, tf, name, signo, 0, start, end);
-+      _tcase_add_test(tc, tf, name, signo, start, end);
-       return;
-     }
-   }
--- 
-2.27.0
-
diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index 99b315e276..0484cc1501 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4cf0de1aaa1e1737db5a8fe4104021a8e60a148a4534f92b5affdd9782e404aa  sofia-sip-1.13.1-d10a3d268c.tar.gz
+sha256  b539444a5d03e281b829ee9133ae9e717f2d2a03399808365e5ab85574e25d95  sofia-sip-1.13.3-8071e8accd.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index ef1b35fa2c..5c383400ff 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.1-d10a3d268c
+SOFIA_SIP_VERSION = 1.13.3-8071e8accd
 SOFIA_SIP_SITE = https://files.freeswitch.org/downloads/libs
 SOFIA_SIP_INSTALL_STAGING = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
