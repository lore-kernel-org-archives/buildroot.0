From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 23 Oct 2014 21:58:34 +0200
Subject: [Buildroot] [PATCH] ruby: disable fiddle support for bfin
Message-ID: <1414094314-11429-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable fiddle support because of compile failure (no ffi_closure support
for bfin).

Fixes:
 http://autobuild.buildroot.net/results/0a8/0a854274b520d4daca3911a64777a447b5756a52/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ruby/ruby.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 34da13d..f425865 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -30,6 +30,8 @@ RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"
 
 ifeq ($(BR2_bfin),y)
 RUBY_CONF_ENV = ac_cv_func_dl_iterate_phdr=no
+# disabled because of compile error (missing ffi_closure support for bfin)
+RUBY_CONF_OPTS += --with-out-ext=fiddle
 endif
 
 # Force optionals to build before we do
-- 
1.8.1.4
