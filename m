Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8398C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7099640A22;
	Fri, 10 Jul 2026 13:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Yx79aXWnstZ; Fri, 10 Jul 2026 13:43:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5D4B409CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691002;
	bh=4CHerSu5gp+XhdZP6pViwOOeLsvf6knN+wly2tYumVc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nB2+UajY0QDnX7REASG38/OcGnc3TjUXpb4WVzdZ/QLfyptUO/FsV0ZQA5TVz3JXq
	 OfzzS+NqO5vS4EnJVrUH0r8WI2QBN48iiYXCWgmjApenpXqaHoKYaeftd3ooAwj6WX
	 zYh3T39juyaA5RsDBbTniPoErkACmrM7lJ1ux4NXcxqBR34gCabx3ViQULe+wspqGZ
	 yr9cSJUPgp+b039qPUmJLlzk6PqEVRrOmcXsfGx5YRvTMB9hrsAYyRWnZLvuYnH1DX
	 grIGKUj6XgXsl+FAtkceT3Y6STgnDeZBFkfX5kSuhdsgTwWi8bo9eoyhx3eqS95VUC
	 jX2EbWE+2C2Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5D4B409CF;
	Fri, 10 Jul 2026 13:43:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 365C42FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C7384076A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2D5gLEelPhPI for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4616E408FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4616E408FC
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B4B288678; Fri, 10 Jul 2026 13:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:30:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fee844130be960f70dd63c8f82f20b1f7b90a4cc
X-Git-Newrev: 634b2da1f72f42ac75cd5aec0c8a741991b18561
X-Patchwork-Hint: ignore
Message-Id: <20260710134217.7B4B288678@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ruby: security
 bump to v3.4.10
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/634b2da1f72f42ac75cd5aec0c8a741991b18561
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release announcement:
https://www.ruby-lang.org/en/news/2026/06/30/ruby-3-4-10-released/

Also drop patch that is now included upstream

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[thomas: drop ignore_cves entry]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ruby/0001-fix-CVE-2026-41316.patch | 73 ------------------------------
 package/ruby/ruby.hash                     |  4 +-
 package/ruby/ruby.mk                       |  5 +-
 3 files changed, 3 insertions(+), 79 deletions(-)

diff --git a/package/ruby/0001-fix-CVE-2026-41316.patch b/package/ruby/0001-fix-CVE-2026-41316.patch
deleted file mode 100644
index 1c5949c221..0000000000
--- a/package/ruby/0001-fix-CVE-2026-41316.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From c35379df5279777fb4e02d989064eecd9cbbf338 Mon Sep 17 00:00:00 2001
-From: Takashi Kokubun <takashikkbn@gmail.com>
-Date: Tue, 21 Apr 2026 16:27:44 +0900
-Subject: [PATCH] [ruby/erb] Prohibit def_method on marshal-loaded ERB instances
-
-Extends the @_init guard to def_method so that an ERB object created
-via Marshal.load (which bypasses initialize) raises ArgumentError
-instead of evaluating arbitrary source. def_module and def_class both
-delegate to def_method and are covered by the same check.
-
-Co-authored-by: Tristan Madani <TristanInSec@gmail.com>
-
-Upstream: https://github.com/ruby/ruby/commit/c35379df5279777fb4e02d989064eecd9cbbf338
-CVE: CVE-2026-41316
-[Titouan: Rebase on top of Ruby 3.4.9]
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- lib/erb.rb           |  3 +++
- test/erb/test_erb.rb | 27 +++++++++++++++++++++++++++
- 2 files changed, 30 insertions(+)
-
-diff --git a/lib/erb.rb b/lib/erb.rb
-index bc1615d7da..a7317c0856 100644
---- a/lib/erb.rb
-+++ b/lib/erb.rb
-@@ -463,6 +463,9 @@ def new_toplevel(vars = nil)
-   #   erb.def_method(MyClass, 'render(arg1, arg2)', filename)
-   #   print MyClass.new.render('foo', 123)
-   def def_method(mod, methodname, fname='(ERB)')
-+    unless @_init.equal?(self.class.singleton_class)
-+      raise ArgumentError, "not initialized"
-+    end
-     src = self.src.sub(/^(?!#|$)/) {"def #{methodname}\n"} << "\nend\n"
-     mod.module_eval do
-       eval(src, binding, fname, -1)
-diff --git a/test/erb/test_erb.rb b/test/erb/test_erb.rb
-index 09496d31e25ca2..9eec43da158c0c 100644
---- a/test/erb/test_erb.rb
-+++ b/test/erb/test_erb.rb
-@@ -664,6 +664,33 @@ def test_prohibited_marshal_load
-     assert_raise(ArgumentError) {erb.result}
-   end
- 
-+  def test_prohibited_marshal_load_def_method
-+    erb = ERB.allocate
-+    erb.instance_variable_set(:@src, "")
-+    erb.instance_variable_set(:@lineno, 1)
-+    erb.instance_variable_set(:@_init, true)
-+    erb = Marshal.load(Marshal.dump(erb))
-+    assert_raise(ArgumentError) {erb.def_method(Class.new, 'render')}
-+  end
-+
-+  def test_prohibited_marshal_load_def_module
-+    erb = ERB.allocate
-+    erb.instance_variable_set(:@src, "")
-+    erb.instance_variable_set(:@lineno, 1)
-+    erb.instance_variable_set(:@_init, true)
-+    erb = Marshal.load(Marshal.dump(erb))
-+    assert_raise(ArgumentError) {erb.def_module}
-+  end
-+
-+  def test_prohibited_marshal_load_def_class
-+    erb = ERB.allocate
-+    erb.instance_variable_set(:@src, "")
-+    erb.instance_variable_set(:@lineno, 1)
-+    erb.instance_variable_set(:@_init, true)
-+    erb = Marshal.load(Marshal.dump(erb))
-+    assert_raise(ArgumentError) {erb.def_class}
-+  end
-+
-   def test_multi_line_comment_lineno
-     erb = ERB.new(<<~EOS)
-       <%= __LINE__ %>
diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index e8bf51ea43..dd97a6d867 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2026/03/11/ruby-3-4-9-released/
-sha512  356fb47cc56f2d25198cb95253fc20ff7d9a6fd1fa53bc475e5c440012aebe27562537c399d271357235114ade263fd625029b66cb0f9b526f9c04f169fb9580  ruby-3.4.9.tar.xz
+# https://www.ruby-lang.org/en/news/2026/06/30/ruby-3-4-10-released/
+sha512  c28d59946c0a1b8e4385a772e0651c6f4154c18ab8a2a62289c3213eb4fe937cec0942e0076cda429576e58ad277b18f4b5611e644d15b122c1cd96baf10f284  ruby-3.4.10.tar.xz
 
 # License files, Locally calculated
 sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index a66bbd4cbf..ebe3004c6a 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).9
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).10
 RUBY_VERSION_EXT = 3.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
@@ -19,9 +19,6 @@ RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 
 RUBY_CPE_ID_VENDOR = ruby-lang
 
-# 0001-fix-CVE-2026-41316.patch
-RUBY_IGNORE_CVES += CVE-2026-41316
-
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-libyaml host-pkgconf host-openssl
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
