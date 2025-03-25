Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B92C36008
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 18:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0A0861018;
	Tue, 25 Mar 2025 18:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMV9m6ruWLRV; Tue, 25 Mar 2025 18:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C97FC608EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C97FC608EB;
	Tue, 25 Mar 2025 18:25:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 076AB1B8
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E17AD608EB
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_n2NuphRLmM for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 18:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 108F460803
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 108F460803
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:25:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F17A082B98; Tue, 25 Mar 2025 18:25:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Mar 2025 19:23:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4d259727e16a4a3352a20c085f787c783c9f53c
X-Git-Newrev: 64b7774fc5c3e74616d41848991be633a31587a0
X-Patchwork-Hint: ignore
Message-Id: <20250325182540.F17A082B98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: update to 3.4.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=64b7774fc5c3e74616d41848991be633a31587a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for a changelog:
https://github.com/ruby/ruby/releases/tag/v3_4_2

This commit also update the LEGAL license hash:
https://github.com/ruby/ruby/commit/8a86e52fb5fc49367e79f8f49fb451ab74e089bb

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Julien: fix LEGAL license hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ruby/ruby.hash | 6 +++---
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index be3e380a55..81c9f9c9db 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,7 +1,7 @@
-# https://www.ruby-lang.org/en/news/2024/12/25/ruby-3-4-1-released/
-sha512  8d2e34117696f9debf463ae1eed288fdbb5c1a12e32800e901b69218e3b7302a0066052077e2ebca851e3a635296199bd5a10437eea1d6f787f69a77bb865680  ruby-3.4.1.tar.xz
+# https://www.ruby-lang.org/en/news/2025/02/14/ruby-3-4-2-released/
+sha512  cb8b5023bce316393716548c5f0a44c7d0240724ff79b995517641266af30bedc6f402c1c8fa27368ea607e2aa6d36bbb201e00c6e9dd2a80d837431d32343b5  ruby-3.4.2.tar.xz
 
 # License files, Locally calculated
-sha256  39917f453428cba1f1054c6a1973f74599a30b8d92e752da94e205a213ef8f92  LEGAL
+sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
 sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
 sha256  36a9a6e7347214bbba599a412617204e65bff065dcbe5c46f5cb454c80de9eb0  BSDL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index be1b38ae59..891fd78d4b 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
 RUBY_VERSION_EXT = 3.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
