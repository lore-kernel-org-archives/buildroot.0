Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C26C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 21:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 323A560BE9;
	Sun, 13 Mar 2022 21:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NkXveDYtFOgh; Sun, 13 Mar 2022 21:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BCF560C07;
	Sun, 13 Mar 2022 21:27:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAD021BF309
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 21:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A647C408EE
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 21:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g9Rz_1ldma23 for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 21:26:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECAEE408F4
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 21:26:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8CD4B83CFB; Sun, 13 Mar 2022 21:17:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 22:23:51 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: d578d93e0e1dce841d8d9fe75f12d37a6c1f1661
X-Git-Newrev: a8bec43ffc3ff0077a9df6327a156f1da671e2f5
X-Patchwork-Hint: ignore
Message-Id: <20220313211754.8CD4B83CFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libpjsip:
 security bump to version 2.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8bec43ffc3ff0077a9df6327a156f1da671e2f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix the following security issues (i.e. CVE-2021-37706, CVE-2021-41141,
CVE-2021-43804, CVE-2021-43845, CVE-2022-21722 and CVE-2022-21723):
- Potential integer underflow upon receiving STUN message
  (GHSA-2qpg-f6wf-w984)
- Use after free of dialog set (GHSA-ffff-m5fm-qm62)
- Missing unreleased of locks in failure cases (GHSA-8fmx-hqw7-6gmc)
- Potential out-of-bounds read when parsing RTCP BYE message
  (GHSA-3qx3-cg72-wrh9)
- Prevent OOB read for RTCP XR block (GHSA-r374-qrwv-86hh)
- Potential buffer overflow in pjsua_player_create(),
  pjsua_recorder_create(), pjmedia_wav_player_create(), and
  pjsua_call_dump() (GHSA-qcvw-h34v-c7r9)
- Potential out-of-bound read during RTP/RTCP parsing
  (GHSA-m66q-q64c-hv36)
- Prevent OOB read in multipart parsing (GHSA-7fw8-54cv-r7pm)
- Use after free of dialog set (GHSA-ffff-m5fm-qm62)

https://github.com/pjsip/pjproject/releases/tag/2.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5ed26bb378c02f2ce7f7377481853b12ad55d808)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.hash | 2 +-
 package/libpjsip/libpjsip.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index f39ebf4060..74331ab6fb 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  45f6604372df3f49293749cd7c0b42cb21c4fb666c66f8ed9765de004d1eae38  pjproject-2.11.1.tar.gz
+sha256  b3b94d9be4aba8f6d2d1cb164603e81b0a6ee17352f9e2ba5b58e325e610ca5a  pjproject-2.12.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index b05cc31a83..32cfa8c53c 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.11.1
+LIBPJSIP_VERSION = 2.12
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
-# https://github.com/pjsip/pjproject/archive/2.11.1.tar.gz
+# https://github.com/pjsip/pjproject/archive/2.12.tar.gz
 
 LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
