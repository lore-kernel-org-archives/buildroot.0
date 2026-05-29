Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B282ECD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3932885BDE;
	Tue,  9 Jun 2026 13:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shB0MZXue1-E; Tue,  9 Jun 2026 13:04:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A169E85567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010284;
	bh=IWN1WwRYni9GZcumhkQexsiFKbWdoM9ZtEoichJKZH0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qperhl3cOcChb9GRINCv4/t63VUGOBta2CdKN1YmH7KfmCmLp+6PEFVtMJAEBs1eh
	 lXy0gi+hy36BfV672wve/o7swJdDmih5o6A1ANNwypSqhom7JifkP9CjtEXu0jqID4
	 jcc4MM0o8rIddJAj1u4mmlIW+fzWfa9TcsODp+uvFgASi5Q8ymD3Yl7Ob/o+Kyrn7k
	 +7ZulHogatPaAhH18zQDI3y+1IZlqaNVASLNPWv5AaXajbCG3sd5PSM7W4B++PfwRM
	 gdb80GWSxLkaAaTlNzM2Wqq1FQ++XMrHme/affHPfEUC+hnWBH4poudFqT0iWeqS67
	 k50yhRSrmKNYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A169E85567;
	Tue,  9 Jun 2026 13:04:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A83BF2EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1435642728
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2aEx0mxIM600 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2B7042700
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2B7042700
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A4DE87E68; Tue,  9 Jun 2026 13:01:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 23:52:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c70315608afb4d5188cafe5d3df92edc929ce1c8
X-Git-Newrev: ce1394ee0ed07c2d06223dc5b1bbf73482316896
X-Patchwork-Hint: ignore
Message-Id: <20260609130121.1A4DE87E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libenca: bump to version 1.22 and
 migrate to new upstream
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce1394ee0ed07c2d06223dc5b1bbf73482316896
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The original upstream site (http://cihar.com/software/enca/) has been
deprecated. The project has been revived and is now maintained at:
https://github.com/Project-OSS-Revival/enca

Changes from 1.19 to 1.22:
- Project moved to GitHub under Project-OSS-Revival organization
- Updated build system and dependencies
- Various bug fixes and improvements
- Continued maintenance after original upstream abandonment

Updated:
- Version from 1.19 to 1.22
- Download site from dl.cihar.com to GitHub releases
- Homepage URL to new GitHub repository

https://github.com/Project-OSS-Revival/enca/releases

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libenca/Config.in    | 2 +-
 package/libenca/libenca.hash | 2 +-
 package/libenca/libenca.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libenca/Config.in b/package/libenca/Config.in
index 5e951ed835..55527260ba 100644
--- a/package/libenca/Config.in
+++ b/package/libenca/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_LIBENCA
 	help
 	  Extremely Naive Charset Analyser
 
-	  http://cihar.com/software/enca/
+	  https://github.com/Project-OSS-Revival/enca
diff --git a/package/libenca/libenca.hash b/package/libenca/libenca.hash
index 04c9d5127f..dfa0bb940b 100644
--- a/package/libenca/libenca.hash
+++ b/package/libenca/libenca.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3a487eca40b41021e2e4b7a6440b97d822e6532db5464471f572ecf77295e8b8  enca-1.19.tar.xz
+sha256  95a70dd21198e6427d77a1d79721f4f87dd8bd07fdefe71a2062c6f41eee39da  enca-1.22.tar.xz
 sha256  87f1bd4a52b4029476b684fcdd51fed3c6b2540e462d3c2d3bfc9be4558b2825  COPYING
diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
index 63b6895087..84c32ef7fb 100644
--- a/package/libenca/libenca.mk
+++ b/package/libenca/libenca.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBENCA_VERSION = 1.19
-LIBENCA_SITE = http://dl.cihar.com/enca
+LIBENCA_VERSION = 1.22
+LIBENCA_SITE = https://github.com/Project-OSS-Revival/enca/releases/download/$(LIBENCA_VERSION)
 LIBENCA_SOURCE = enca-$(LIBENCA_VERSION).tar.xz
 LIBENCA_INSTALL_STAGING = YES
 LIBENCA_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
