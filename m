Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62325CD343A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 355D4410FF;
	Mon,  4 May 2026 14:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZljOCGb8RPbk; Mon,  4 May 2026 14:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48F7D41B42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906022;
	bh=TDFbxgwFV68n3OSzhdo+YMjh4u1a+04Mo8PIuQtfm80=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qJeOBc8iC6TPgxX8pkI2nq90Y6f/geUsoSn/BNxqNpRjy53SIuMjgz9relR8YaZhS
	 WfrJbjxsFuQrjRQv/gxaZwdEvv/e+INEWnLpsF1WjS1jheBLSZ5jjwhrWnbZyCp/EA
	 Q1G9FV/z5swWbA+Hnky4Cbljj1pvXOUCNQS26GZqXZETTTyVlbtMpiGt5BzBGNT0Xi
	 TesKS5seMfRdwnIH/9Hzsf+T/XhIcrsE/fdi0X3t4TpQEyj0ixGPaH3wqa6LrOozvV
	 cQxNCeDXzWKFCGc70w0gMEABxCOe0F8XPDpiB247xjsiwpkcNyHVHyRz2E4XyyGYB3
	 KqYiN4o0thjSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F7D41B42;
	Mon,  4 May 2026 14:47:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03972190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72F3E410B2
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahCpbi85nZt1 for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 424F0410B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 424F0410B3
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 269418427E; Mon,  4 May 2026 14:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:51:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 646954350f9d1a6bcf3badd31b8f76c7d716b857
X-Git-Newrev: d64056cc50f23df75e3b15cd5ad4adfd519cb40d
X-Patchwork-Hint: ignore
Message-Id: <20260504144643.269418427E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ruby: add patch
 for CVE-2026-41316
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d64056cc50f23df75e3b15cd5ad4adfd519cb40d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This is the change from Ruby 4.0.2 to 4.0.3, rebased on top of Ruby 3.4

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit 92746d0dea25125bbda6359dcbeb2f90b192eeef)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ruby/0001-fix-CVE-2026-41316.patch | 73 ++++++++++++++++++++++++++++++
 package/ruby/ruby.mk                       |  3 ++
 2 files changed, 76 insertions(+)

diff --git a/package/ruby/0001-fix-CVE-2026-41316.patch b/package/ruby/0001-fix-CVE-2026-41316.patch
new file mode 100644
index 0000000000..1c5949c221
--- /dev/null
+++ b/package/ruby/0001-fix-CVE-2026-41316.patch
@@ -0,0 +1,73 @@
+From c35379df5279777fb4e02d989064eecd9cbbf338 Mon Sep 17 00:00:00 2001
+From: Takashi Kokubun <takashikkbn@gmail.com>
+Date: Tue, 21 Apr 2026 16:27:44 +0900
+Subject: [PATCH] [ruby/erb] Prohibit def_method on marshal-loaded ERB instances
+
+Extends the @_init guard to def_method so that an ERB object created
+via Marshal.load (which bypasses initialize) raises ArgumentError
+instead of evaluating arbitrary source. def_module and def_class both
+delegate to def_method and are covered by the same check.
+
+Co-authored-by: Tristan Madani <TristanInSec@gmail.com>
+
+Upstream: https://github.com/ruby/ruby/commit/c35379df5279777fb4e02d989064eecd9cbbf338
+CVE: CVE-2026-41316
+[Titouan: Rebase on top of Ruby 3.4.9]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ lib/erb.rb           |  3 +++
+ test/erb/test_erb.rb | 27 +++++++++++++++++++++++++++
+ 2 files changed, 30 insertions(+)
+
+diff --git a/lib/erb.rb b/lib/erb.rb
+index bc1615d7da..a7317c0856 100644
+--- a/lib/erb.rb
++++ b/lib/erb.rb
+@@ -463,6 +463,9 @@ def new_toplevel(vars = nil)
+   #   erb.def_method(MyClass, 'render(arg1, arg2)', filename)
+   #   print MyClass.new.render('foo', 123)
+   def def_method(mod, methodname, fname='(ERB)')
++    unless @_init.equal?(self.class.singleton_class)
++      raise ArgumentError, "not initialized"
++    end
+     src = self.src.sub(/^(?!#|$)/) {"def #{methodname}\n"} << "\nend\n"
+     mod.module_eval do
+       eval(src, binding, fname, -1)
+diff --git a/test/erb/test_erb.rb b/test/erb/test_erb.rb
+index 09496d31e25ca2..9eec43da158c0c 100644
+--- a/test/erb/test_erb.rb
++++ b/test/erb/test_erb.rb
+@@ -664,6 +664,33 @@ def test_prohibited_marshal_load
+     assert_raise(ArgumentError) {erb.result}
+   end
+ 
++  def test_prohibited_marshal_load_def_method
++    erb = ERB.allocate
++    erb.instance_variable_set(:@src, "")
++    erb.instance_variable_set(:@lineno, 1)
++    erb.instance_variable_set(:@_init, true)
++    erb = Marshal.load(Marshal.dump(erb))
++    assert_raise(ArgumentError) {erb.def_method(Class.new, 'render')}
++  end
++
++  def test_prohibited_marshal_load_def_module
++    erb = ERB.allocate
++    erb.instance_variable_set(:@src, "")
++    erb.instance_variable_set(:@lineno, 1)
++    erb.instance_variable_set(:@_init, true)
++    erb = Marshal.load(Marshal.dump(erb))
++    assert_raise(ArgumentError) {erb.def_module}
++  end
++
++  def test_prohibited_marshal_load_def_class
++    erb = ERB.allocate
++    erb.instance_variable_set(:@src, "")
++    erb.instance_variable_set(:@lineno, 1)
++    erb.instance_variable_set(:@_init, true)
++    erb = Marshal.load(Marshal.dump(erb))
++    assert_raise(ArgumentError) {erb.def_class}
++  end
++
+   def test_multi_line_comment_lineno
+     erb = ERB.new(<<~EOS)
+       <%= __LINE__ %>
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index c56d2510be..a66bbd4cbf 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -19,6 +19,9 @@ RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 
 RUBY_CPE_ID_VENDOR = ruby-lang
 
+# 0001-fix-CVE-2026-41316.patch
+RUBY_IGNORE_CVES += CVE-2026-41316
+
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-libyaml host-pkgconf host-openssl
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
