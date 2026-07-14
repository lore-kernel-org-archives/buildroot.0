Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CF1C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 09:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1C10608D0;
	Tue, 14 Jul 2026 09:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uW642VCn8ve0; Tue, 14 Jul 2026 09:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65093608C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784021372;
	bh=6R9UgAQ7MkQtPU1pXJ7eHw/kudF76IsSEtRH27Dgfkc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CUmSGS6NAmt3VmB4nz2+cN8a43iVJD+PbwDLdifZRJlZz57xRaq/EKVYIOgd4l8Uk
	 tCeDHEigGJ85Qd9ki7bk5GQtND+COIDY+uz333vVJll1ExA1WK38xjmQrQ+OoenNnP
	 a+p6KJK4YMoRGiTzqLH0o+F1slXyU1+BJTDBQWhs+UKmvVqSfhG4GOuQfARC1MMUK9
	 dfS/s15dd1vzOYVwuI2ekAV7ilHTlAopHgZ+gjYZ/xGbnGoGmhPp4F9UsgUe05hg8D
	 XSyV1Slaf0n2KY2msvMwfwb04NlgDXKweXxQ/9v2gbCFPz+bLBCpQzfjmHyR1HnyoK
	 39kvrWc8hY6JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65093608C1;
	Tue, 14 Jul 2026 09:29:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A1CC9CF
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86312406A0
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4D9eDP4WUsK for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 09:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B06F64069C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B06F64069C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:29:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07BA08884E; Tue, 14 Jul 2026 09:28:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 11:25:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a86946befc18241d83eeee026571dd15c900d22
X-Git-Newrev: 30dbef0e198d8b5e90c250c6f4cb3c061597c05f
X-Patchwork-Hint: ignore
Message-Id: <20260714092855.07BA08884E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-jiffy: bump to version 2.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30dbef0e198d8b5e90c250c6f4cb3c061597c05f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release Notes:
https://github.com/davisp/jiffy/releases/tag/2.0.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/erlang-jiffy/erlang-jiffy.hash | 2 +-
 package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index 73e4200b5f..454e08961c 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5c1951f819f553a34f61f33124b4c8dba1d665d9bba422e15752fe4fb52337d  erlang-jiffy-2.0.1.tar.gz
+sha256  f0accdb3ec1b651afdacc92e72a99fa2fdb4f8bcd21a05ee845071ddaa263949  erlang-jiffy-2.0.2.tar.gz
 sha256  2d1a98e412143fbcdfdaed110614017b267b007252e1b4e121f9fc921edf9ec7  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index ae1ae0004f..9b6a38112d 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 2.0.1
+ERLANG_JIFFY_VERSION = 2.0.2
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = Apache-2.0, \
 	MIT (core), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
