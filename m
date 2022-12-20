Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B83C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 12:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D124940242;
	Tue, 20 Dec 2022 12:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D124940242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtWF7DGPB1vK; Tue, 20 Dec 2022 12:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0A3C40621;
	Tue, 20 Dec 2022 12:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0A3C40621
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89BD61BF3FC
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 12:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 722C681D3A
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 12:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 722C681D3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iWFKAKV2lbPu for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 12:14:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 962C881D24
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 12:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 962C881D24
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 859E886ACA; Tue, 20 Dec 2022 12:14:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Dec 2022 13:11:16 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 0885e738c924686e94068ef7e8eecdebbb62cb41
X-Git-Newrev: cf1f4b6b527c3dc10a152319044b9ecc999335ab
X-Patchwork-Hint: ignore
Message-Id: <20221220121406.859E886ACA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/ruby: security
 bump to version 3.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf1f4b6b527c3dc10a152319044b9ecc999335ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

fix CVE-2021-33621: HTTP response splitting in CGI

see https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-3-released/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 20f7ed86aa9f2a65af9b44a599f7d1b10075f158)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch | 2 +-
 package/ruby/ruby.hash                              | 4 ++--
 package/ruby/ruby.mk                                | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch b/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
index 039a6466d6..805dfd2f89 100644
--- a/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
+++ b/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
@@ -14,7 +14,7 @@ diff --git a/ext/openssl/ossl_pkey.c b/ext/openssl/ossl_pkey.c
 index 2a4835a2..24d0da46 100644
 --- a/ext/openssl/ossl_pkey.c
 +++ b/ext/openssl/ossl_pkey.c
-@@ -670,7 +670,7 @@ ossl_pkey_export_traditional(int argc, VALUE *argv, VALUE self, int to_der)
+@@ -710,7 +710,7 @@ ossl_pkey_export_traditional(int argc, VALUE *argv, VALUE self, int to_der)
  	}
      }
      else {
diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index da6221ec50..42d8a2497f 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2022/04/12/ruby-3-1-2-released/
-sha512  4a74e9efc6ea4b3eff4fec7534eb1fff4794d021531defc2e9937e53c6668db8ecdc0fff2bc23d5e6602d0df344a2caa85b31c5414309541e3d5313ec82b6e21  ruby-3.1.2.tar.xz
+# https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-3-released/
+sha512  4b0fd334ae56132ba98b8a69adad54bdcf7f7aeabd5eba5b0f0399a3868e2054f9026ca1b1cb2dbb197a9e9b0610b263481949c0623a62071546bc5adff8ca69  ruby-3.1.3.tar.xz
 
 # License files, Locally calculated
 sha256  794c384f94396ab07e3e6f53a9f8be093facb7eb4193266024302b93b29e12dc  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index cbdfa4b826..28b1ec13ef 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.1
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
 RUBY_VERSION_EXT = 3.1.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
