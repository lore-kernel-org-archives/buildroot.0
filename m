Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B85ECD8C9D
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 19:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D74B81241;
	Thu, 11 Jun 2026 19:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxK9S7PCT2JT; Thu, 11 Jun 2026 19:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB63C80E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781206786;
	bh=nwt+DxuOol3xTGmHIW2xW013Wewo38BGwEIZs7idip4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RrD6vTAaoh7YkloNMEyGpqYFSBM82LM2dbiHKyibFuI7sAb56mH6UxLPEtGVQSdwo
	 XJ9pr1qVdonxJax1tzrLh9HffuUhC1Njsu8BIuSRpYQUW2YLCZGWPVwvSKvzEfVdxI
	 5PxXawWRF0OY8nkODn1ZoPY7G/qeu87pi7hb1ndWhErxFwrEYaILkLf+58jyJYOmxK
	 nLa4ESRxBgbSvC1+x+ZF/gkLQXRAbQMet3oPk0sp55SsW3eXgT6pRhFf2o+fhbUyZE
	 qocwiiZq3klrQr0CHG4EKA8btn6U3ZNU12OblOwz5xcG9CyxcGq3t459p5Q0jIW/El
	 oaKSLgyzojaTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB63C80E79;
	Thu, 11 Jun 2026 19:39:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CCD912F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2ECD240468
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGjy2-PC3aN2 for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 19:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30E7940074
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30E7940074
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:39:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40B5D88033; Thu, 11 Jun 2026 19:39:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 21:33:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0ea6e310fc8a77e7c982154b38a482d2c3a8b64
X-Git-Newrev: 2e6e611fd52579a187f5c142f5b63cd43f167adb
X-Patchwork-Hint: ignore
Message-Id: <20260611193925.40B5D88033@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gettext-tiny: bump to version 0.3.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e6e611fd52579a187f5c142f5b63cd43f167adb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://github.com/sabotage-linux/gettext-tiny/compare/v0.3.2...v0.3.3

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to change log in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gettext-tiny/gettext-tiny.hash | 2 +-
 package/gettext-tiny/gettext-tiny.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index f7ed50b49f..e255aded2c 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -1,5 +1,5 @@
 # Locally Computed:
-sha256  29cc165e27e83d2bb3760118c2368eadab550830d962d758e51bd36eb860f383  gettext-tiny-0.3.2.tar.gz
+sha256  daff8b4a7863745710ec0b02657fd20bda2d90398f54945751259bb94d6ebffd  gettext-tiny-0.3.3.tar.gz
 sha256  4c938aa3d8fa3c184bba5e87a8a2febc89560627c9d0567536879e3eca1a7b4f  LICENSE
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
 # Locally Computed:
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 3fe8a781d9..625ec56945 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_TINY_VERSION = 0.3.2
+GETTEXT_TINY_VERSION = 0.3.3
 GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,v$(GETTEXT_TINY_VERSION))
 GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)
 GETTEXT_TINY_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
