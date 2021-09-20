Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE9AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:09:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E12E60F93
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E12E60F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41A8440370;
	Mon, 20 Sep 2021 19:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CxuPVw-VyFdb; Mon, 20 Sep 2021 19:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1A964036D;
	Mon, 20 Sep 2021 19:09:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8004B1BF97F
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F17A605AA
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B84xZ3X6b6YU for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:08:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B90656058F
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 19:08:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 48C8F8B822; Mon, 20 Sep 2021 19:06:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 21:03:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4877e6f88d5eea54dc74b855556ffc0dd3f399f
X-Git-Newrev: 929cb205bb83c30bf838517f654af546c57c19e6
X-Patchwork-Hint: ignore
Message-Id: <20210920190639.48C8F8B822@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgit2: bump to version 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=929cb205bb83c30bf838517f654af546c57c19e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

COPYING was updated with a copy of the openssl licence since libgit2 now
include openssl headers so it can dlopen it:

    openssl: dynamically load libssl and symbols (optionally)

    Provide an interface around OpenSSL to dynamically load the
    libraries and symbols, so that users can distribute a libgit2
    library that is not linked directly against OpenSSL.  This enables
    users to target multiple distributions with a single binary.

    This mechanism is optional and disabled by default.  Configure cmake
    with -DUSE_HTTPS=OpenSSL-Dynamic to use it.

We do not use that option so the headers are not even used, plus the
headers are not installed on the target anyway, so this patch includes
no license changes.

Upstream also stopped providing release tarballs, relying on
github-generated tarballs instead.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libgit2/libgit2.hash | 4 ++--
 package/libgit2/libgit2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 367ade3afe..5522f5fe45 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ad73f845965cfd528e70f654e428073121a3fa0dc23caac81a1b1300277d4dba  libgit2-1.1.0.tar.gz
-sha256  afc8bde99ba630012107c25d3c42dde628ec5f0cd3f428131f7e3a0f7d58ff42  COPYING
+sha256  701a5086a968a46f25e631941b99fc23e4755ca2c56f59371ce1d94b9a0cc643  libgit2-1.2.0.tar.gz
+sha256  8b7e4f54f8bf210c8fe010a49571a1ee57463ef020cc43f051d4d3fbb74942af  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 668fa758f8..4c715302d1 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.1.0
-LIBGIT2_SITE = https://github.com/libgit2/libgit2/releases/download/v$(LIBGIT2_VERSION)
+LIBGIT2_VERSION = 1.2.0
+LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch)
 LIBGIT2_LICENSE_FILES = COPYING
 LIBGIT2_CPE_ID_VENDOR = libgit2_project
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
