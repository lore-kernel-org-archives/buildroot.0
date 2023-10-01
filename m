Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B51E78482
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 18:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40310820F0;
	Sun,  1 Oct 2023 18:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40310820F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8F7PV1NpOLW; Sun,  1 Oct 2023 18:47:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6180F8210D;
	Sun,  1 Oct 2023 18:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6180F8210D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 029731BF5AA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB5B460AF8
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB5B460AF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pyCxZQdxJjvm for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 18:46:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 114C160D58
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 18:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 114C160D58
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CEBB83E7F; Sun,  1 Oct 2023 18:46:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 20:39:41 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 8b9251b8cc548830b27804c292eecbcfbfafe034
X-Git-Newrev: 6d6fcd1d74c65127be97395af5dad6674e80ba57
X-Patchwork-Hint: ignore
Message-Id: <20231001184643.0CEBB83E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libfastjson:
 security bump to version 0.99.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d6fcd1d74c65127be97395af5dad6674e80ba57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fixes the equivalent of CVE-2020-12762, which was a json-c vulnerability:

https://github.com/advisories/GHSA-3797-gmjf-45gm

https://github.com/rsyslog/libfastjson/pull/166

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cfe830c9ee5d66d3bdca15933ed8b59e3ec16e88)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfastjson/libfastjson.hash | 2 +-
 package/libfastjson/libfastjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfastjson/libfastjson.hash b/package/libfastjson/libfastjson.hash
index 218a738b37..f220c608df 100644
--- a/package/libfastjson/libfastjson.hash
+++ b/package/libfastjson/libfastjson.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  881f954633aa76931e4c756ece0bda6fd8a673c6e66955a3db3b2bb9d6bbff72  libfastjson-0.99.9.tar.gz
+sha256  67cde7e85fa372036d7694f3b32cfc666705ab19367920f555af9d1c183edfef  libfastjson-0.99.9.1.tar.gz
 sha256  b29370bbfa98816e1fca0901f18149d920736771bfd68b4ee0eb00c78b38d245  COPYING
diff --git a/package/libfastjson/libfastjson.mk b/package/libfastjson/libfastjson.mk
index 7ab978dc67..5ee33ba496 100644
--- a/package/libfastjson/libfastjson.mk
+++ b/package/libfastjson/libfastjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFASTJSON_VERSION = 0.99.9
+LIBFASTJSON_VERSION = 0.99.9.1
 LIBFASTJSON_SITE = $(call github,rsyslog,libfastjson,v$(LIBFASTJSON_VERSION))
 LIBFASTJSON_INSTALL_STAGING = YES
 LIBFASTJSON_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
