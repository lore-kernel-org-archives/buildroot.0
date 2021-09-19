Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00300C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:09:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD2061205
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CD2061205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08DF5403EC;
	Sun, 19 Sep 2021 13:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IrVulCF1oQdv; Sun, 19 Sep 2021 13:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 982F740314;
	Sun, 19 Sep 2021 13:09:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B25721BF5AC
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEFD6606AF
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uFQIDFFSeKif for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 13:08:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BEF96003C
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 13:08:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9A23E8B7F3; Sun, 19 Sep 2021 13:06:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 15:06:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 872d4fbc5c2eda12121780a592eed9b4d28cba19
X-Git-Newrev: d4877e6f88d5eea54dc74b855556ffc0dd3f399f
X-Patchwork-Hint: ignore
Message-Id: <20210919130650.9A23E8B7F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uftrace: bump to version 0.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4877e6f88d5eea54dc74b855556ffc0dd3f399f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/uftrace/uftrace.hash | 2 +-
 package/uftrace/uftrace.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uftrace/uftrace.hash b/package/uftrace/uftrace.hash
index fb1e116be6..43831d72a7 100644
--- a/package/uftrace/uftrace.hash
+++ b/package/uftrace/uftrace.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	418d30c959d3b6d0dcafd55e588a5d414a9984b30f2522a5af004a268824a5a2  uftrace-0.9.4.tar.gz
+sha256	b8b56d540ea95c3eafe56440d6a998e0a140d53ca2584916b6ca82702795bbd9  uftrace-0.10.tar.gz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
index 7c9b9b1992..b487b30695 100644
--- a/package/uftrace/uftrace.mk
+++ b/package/uftrace/uftrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFTRACE_VERSION = 0.9.4
+UFTRACE_VERSION = 0.10
 UFTRACE_SITE = $(call github,namhyung,uftrace,v$(UFTRACE_VERSION))
 UFTRACE_LICENSE = GPL-2.0
 UFTRACE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
