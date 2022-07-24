Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09848C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9593542486;
	Sun, 24 Jul 2022 09:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9593542486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3iItq8jiU_m; Sun, 24 Jul 2022 09:19:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6A7D417C4;
	Sun, 24 Jul 2022 09:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6A7D417C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C469F1BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EE154031E
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EE154031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8G3uN2X5KXwV for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:19:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B45EF40025
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B45EF40025
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E417E856C2; Sun, 24 Jul 2022 09:05:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 10:58:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff3b5ca2c11bae44a5410da6f8630fff1971c063
X-Git-Newrev: b0f825f4488ee7d78b3ea77c4bc2343da3a84ea9
X-Patchwork-Hint: ignore
Message-Id: <20220724090529.E417E856C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jquery-validation: security bump
 to version 1.19.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0f825f4488ee7d78b3ea77c4bc2343da3a84ea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2021-43306: An exponential ReDoS (Regular Expression Denial
  of Service) can be triggered in the jquery-validation npm package,
  when an attacker is able to supply arbitrary input to the url2 method
- Fix CVE-2022-31147: The jQuery Validation Plugin (jquery-validation)
  provides drop-in validation for forms. Versions of jquery-validation
  prior to 1.19.5 are vulnerable to regular expression denial of service
  (ReDoS) when an attacker is able to supply arbitrary input to the url2
  method. This is due to an incomplete fix for CVE-2021-43306. Users
  should upgrade to version 1.19.5 to receive a patch.
- Use LICENSE.md instead of README.md which is available since version
  1.14.0 and
  https://github.com/jquery-validation/jquery-validation/commit/96b7036eb45375eb4861082d8ca442d94a9c666c

https://github.com/jquery-validation/jquery-validation/releases/tag/1.19.4
https://github.com/jquery-validation/jquery-validation/releases/tag/1.19.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/jquery-validation/jquery-validation.hash | 4 ++--
 package/jquery-validation/jquery-validation.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/jquery-validation/jquery-validation.hash b/package/jquery-validation/jquery-validation.hash
index 4dbe07e218..31ecd62bcb 100644
--- a/package/jquery-validation/jquery-validation.hash
+++ b/package/jquery-validation/jquery-validation.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  01ad2ef0a7f9cd413aeb51081651293916da47d20e5c0a59ec62587e58b03564  jquery-validation-1.19.3.zip
-sha256  3e5a99460077c16bf75f6821a30cdac9baa339119ebf63b2a6c49f4f50421ca4  README.md
+sha256  52381e080f266f8bca1a17acd6a4a68be4c2606a8b16f8a12e597cc69f2c0584  jquery-validation-1.19.5.zip
+sha256  f398878cab338b869638bdac1aeae76bf3ac11b2b89da6e0b68bc1a645733440  LICENSE.md
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 920ed1cece..1ed37ee73b 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-JQUERY_VALIDATION_VERSION = 1.19.3
+JQUERY_VALIDATION_VERSION = 1.19.5
 JQUERY_VALIDATION_SITE = https://github.com/jquery-validation/jquery-validation/releases/download/$(JQUERY_VALIDATION_VERSION)
 JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
 JQUERY_VALIDATION_LICENSE = MIT
-JQUERY_VALIDATION_LICENSE_FILES = README.md
+JQUERY_VALIDATION_LICENSE_FILES = LICENSE.md
 JQUERY_VALIDATION_CPE_ID_VENDOR = jqueryvalidation
 JQUERY_VALIDATION_CPE_ID_PRODUCT = jquery_validation
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
