Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F49AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:40:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F567610FE
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F567610FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F2D1403B4;
	Tue,  7 Sep 2021 06:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zGGQx_teix2p; Tue,  7 Sep 2021 06:40:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E2D5402F5;
	Tue,  7 Sep 2021 06:40:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BC441BF2A5
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1620E404C0
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDtbKSdxdd3n for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 06:39:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 270564028E
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 06:39:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 134AA88791; Tue,  7 Sep 2021 06:38:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 08:06:24 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 2abb3befe7da8f95d1799017c5dc91f32b612328
X-Git-Newrev: f86351591d2e79a3058bb11e0cbc84632c466e0a
X-Patchwork-Hint: ignore
Message-Id: <20210907063822.134AA88791@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/localedef: bump
 to version 2.32-50-g737efa27 to match glibc
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f86351591d2e79a3058bb11e0cbc84632c466e0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-HACK-only-build-and-install-localedef.patch                    | 0
 .../0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch      | 0
 .../0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch     | 0
 .../0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch     | 0
 .../localedef.hash                                                      | 2 +-
 package/localedef/localedef.mk                                          | 2 +-
 6 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e/0001-HACK-only-build-and-install-localedef.patch
similarity index 100%
rename from package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0001-HACK-only-build-and-install-localedef.patch
rename to package/localedef/2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e/0001-HACK-only-build-and-install-localedef.patch
diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
similarity index 100%
rename from package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
rename to package/localedef/2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch b/package/localedef/2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch
similarity index 100%
rename from package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch
rename to package/localedef/2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch
diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch b/package/localedef/2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch
similarity index 100%
rename from package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch
rename to package/localedef/2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch
diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/localedef.hash b/package/localedef/2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e/localedef.hash
similarity index 70%
rename from package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/localedef.hash
rename to package/localedef/2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e/localedef.hash
index b1d5243fcc..5e00ef7c04 100644
--- a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/localedef.hash
+++ b/package/localedef/2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e/localedef.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  f4710e9a435a7b83e1d23dd75434f0d36b898eba9b4249c946c32b467d852fd4  glibc-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2.tar.gz
+sha256  b634d38ace90752eeecb93246d71c0673bab0db8dfbd69333479ae7b10d63410  glibc-2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 57ab5a3458..4768066f6a 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2
+LOCALEDEF_VERSION = 2.32-50-g737efa27fca5c97f566a2005687fda7d6659cd2e
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
