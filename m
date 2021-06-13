Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504C4C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:05:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1994060F94
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1994060F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E932383B13;
	Tue,  3 Aug 2021 23:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mw965YICuRIs; Tue,  3 Aug 2021 23:05:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D6B483A6C;
	Tue,  3 Aug 2021 23:04:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30F8A1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B1E040633
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mlfEm6QbmO4p for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6A3A40552
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1935E873E2; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Jun 2021 18:38:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 54ba3be13b7177a55bc77e219fd0ffccbe80acff
X-Git-Newrev: e9ba1c80e8ebf5f5ad9d889d2dd37f27af87e811
X-Patchwork-Hint: ignore
Message-Id: <20210803210951.1935E873E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/harfbuzz: bump to
 version 2.8.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e9ba1c80e8ebf5f5ad9d889d2dd37f27af87e811
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

remove unknown option fontconfig

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/harfbuzz/0001-meson.build-check-for-pthread.h.patch | 9 +--------
 package/harfbuzz/harfbuzz.hash                              | 2 +-
 package/harfbuzz/harfbuzz.mk                                | 4 +---
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch b/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
index 6d7225cbb0..9fa09863c6 100644
--- a/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
+++ b/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
@@ -26,7 +26,7 @@ diff --git a/meson.build b/meson.build
 index bf3925db..6d263d48 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -281,13 +281,15 @@ endif
+@@ -281,7 +281,9 @@ endif
  # threads
  thread_dep = null_dep
  if host_machine.system() != 'windows'
@@ -37,13 +37,6 @@ index bf3925db..6d263d48 100644
  
    if thread_dep.found()
      conf.set('HAVE_PTHREAD', 1)
-   else
-     check_headers += ['sched.h']
--    check_funcs += ['sched_yield', {'link_with': 'rt'}]
-+    check_funcs += [['sched_yield', {'link_with': 'rt'}]]
-   endif
- endif
- 
 -- 
 2.29.2
 
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 98b137c8bd..ad81b34fd6 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6ad11d653347bd25d8317589df4e431a2de372c0cf9be3543368e07ec23bb8e7  harfbuzz-2.7.4.tar.xz
+sha256  4124f663ec4bf4e294d9cf230668370b4249a48ff34deaf0f06e8fc82d891300  harfbuzz-2.8.1.tar.xz
 sha256  beb3f017ceb41387667f78237a7cecf84defa0ed257c505894663d6a9f13211b  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index f1ef7ee953..60cc8b7247 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 2.7.4
+HARFBUZZ_VERSION = 2.8.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
@@ -12,7 +12,6 @@ HARFBUZZ_LICENSE_FILES = COPYING
 HARFBUZZ_CPE_ID_VENDOR = harfbuzz_project
 HARFBUZZ_INSTALL_STAGING = YES
 HARFBUZZ_CONF_OPTS = \
-	-Dfontconfig=disabled \
 	-Dgdi=disabled \
 	-Ddirectwrite=disabled \
 	-Dcoretext=disabled \
@@ -31,7 +30,6 @@ HOST_HARFBUZZ_CONF_OPTS = \
 	-Dglib=enabled \
 	-Dgobject=disabled \
 	-Dcairo=disabled \
-	-Dfontconfig=disabled \
 	-Dicu=disabled \
 	-Dgraphite=disabled \
 	-Dfreetype=enabled \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
