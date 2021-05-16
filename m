Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4701C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:47:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 875EB60F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 875EB60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B79283AFF;
	Tue,  3 Aug 2021 21:47:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQqI4_CXjU2u; Tue,  3 Aug 2021 21:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8982983B23;
	Tue,  3 Aug 2021 21:47:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 257ED1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D230C40360
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pf2G6EJ3kz69 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5268404BE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3780D87BB7; Tue,  3 Aug 2021 21:09:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 May 2021 13:47:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a5ff2a28285e8d003466d5f00be058130a02bbf2
X-Git-Newrev: ae79f0f4033e2c8c250aacc888f5f44a26aa4c86
X-Patchwork-Hint: ignore
Message-Id: <20210803210938.3780D87BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/jquery-validation:
 security bump to version 1.19.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae79f0f4033e2c8c250aacc888f5f44a26aa4c86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix CVE-2021-21252: The jQuery Validation Plugin provides drop-in
validation for your existing forms. It is published as an npm package
"jquery-validation". jquery-validation before version 1.19.3 contains
one or more regular expressions that are vulnerable to ReDoS (Regular
Expression Denial of Service).

Update hash of README.md due to changes not related to license

https://github.com/jquery-validation/jquery-validation/releases/tag/1.19.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jquery-validation/jquery-validation.hash | 4 ++--
 package/jquery-validation/jquery-validation.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/jquery-validation/jquery-validation.hash b/package/jquery-validation/jquery-validation.hash
index af451a6c1a..4dbe07e218 100644
--- a/package/jquery-validation/jquery-validation.hash
+++ b/package/jquery-validation/jquery-validation.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  14efe6f1784ef6e97116b15c77b04b7e8f47ec07b1479bcd6fa0b081faa19440  jquery-validation-1.14.0.zip
-sha256  c2f9aa180de990ff16ca7e756c9af52ecc1b3536e3fb32649d7b2c510bccf9d0  README.md
+sha256  01ad2ef0a7f9cd413aeb51081651293916da47d20e5c0a59ec62587e58b03564  jquery-validation-1.19.3.zip
+sha256  3e5a99460077c16bf75f6821a30cdac9baa339119ebf63b2a6c49f4f50421ca4  README.md
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 43e57a9fc9..920ed1cece 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JQUERY_VALIDATION_VERSION = 1.14.0
-JQUERY_VALIDATION_SITE = http://jqueryvalidation.org/files
+JQUERY_VALIDATION_VERSION = 1.19.3
+JQUERY_VALIDATION_SITE = https://github.com/jquery-validation/jquery-validation/releases/download/$(JQUERY_VALIDATION_VERSION)
 JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
 JQUERY_VALIDATION_LICENSE = MIT
 JQUERY_VALIDATION_LICENSE_FILES = README.md
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
