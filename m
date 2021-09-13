Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B89FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:43:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB9E0610F9
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB9E0610F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A911580EA8;
	Mon, 13 Sep 2021 20:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljXm4n5j023Y; Mon, 13 Sep 2021 20:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4C8380DFA;
	Mon, 13 Sep 2021 20:43:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3F1B1BF322
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3AA760749
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eFn5fZ8Irfv9 for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 20:43:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 369F160690
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 20:43:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CF6478A6B7; Mon, 13 Sep 2021 20:41:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 22:43:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41bcefbd4384cd76963ac4ea6ea431eca8ec3449
X-Git-Newrev: 0e5a901d3141a3d7e477f0fb79e8f6a748f06449
X-Patchwork-Hint: ignore
Message-Id: <20210913204154.CF6478A6B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcre: bump to version 8.45
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e5a901d3141a3d7e477f0fb79e8f6a748f06449
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre/0002-Disable-C-unit-tests.patch | 8 ++++----
 package/pcre/pcre.hash                       | 2 +-
 package/pcre/pcre.mk                         | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pcre/0002-Disable-C-unit-tests.patch b/package/pcre/0002-Disable-C-unit-tests.patch
index c5c1a49f23..1c9f26eb2e 100644
--- a/package/pcre/0002-Disable-C-unit-tests.patch
+++ b/package/pcre/0002-Disable-C-unit-tests.patch
@@ -27,16 +27,16 @@ index 6d03912..2c42b3e 100644
  @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE@am__append_25 = $(GCOV_CXXFLAGS)
  @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE@am__append_26 = $(GCOV_LIBS)
  @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE@am__append_27 = $(GCOV_LIBS)
-@@ -362,9 +356,6 @@ libpcreposix_la_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC \
- @WITH_PCRE8_TRUE@am__EXEEXT_1 = pcregrep$(EXEEXT)
+@@ -190,9 +184,6 @@ libpcreposix_la_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC \
+ 	"$(DESTDIR)$(includedir)"
  @WITH_REBUILD_CHARTABLES_TRUE@am__EXEEXT_2 = dftables$(EXEEXT)
  @WITH_JIT_TRUE@am__EXEEXT_3 = pcre_jit_test$(EXEEXT)
 -@WITH_PCRE_CPP_TRUE@am__EXEEXT_4 = pcrecpp_unittest$(EXEEXT) \
 -@WITH_PCRE_CPP_TRUE@	pcre_scanner_unittest$(EXEEXT) \
 -@WITH_PCRE_CPP_TRUE@	pcre_stringpiece_unittest$(EXEEXT)
  PROGRAMS = $(bin_PROGRAMS) $(noinst_PROGRAMS)
- am__dftables_SOURCES_DIST = dftables.c
- @WITH_REBUILD_CHARTABLES_TRUE@am_dftables_OBJECTS =  \
+ am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
+ am__vpath_adj = case $$p in \
 -- 
 2.7.3
 
diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
index 628d617353..a84d63e1bc 100644
--- a/package/pcre/pcre.hash
+++ b/package/pcre/pcre.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  19108658b23b3ec5058edc9f66ac545ea19f9537234be1ec62b714c84399366d  pcre-8.44.tar.bz2
+sha256  4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8  pcre-8.45.tar.bz2
 # License files, locally calculated
 sha256  0dd9c13864dbb9ee4d77a1557e96be29b2d719fb6584192ee36611aae264c4a3  LICENCE
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index c8498b7acf..264eaa10c7 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE_VERSION = 8.44
+PCRE_VERSION = 8.45
 PCRE_SITE = https://ftp.pcre.org/pub/pcre
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
