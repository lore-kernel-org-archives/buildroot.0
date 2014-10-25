From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:07:01 +0200
Subject: [Buildroot] [git commit] ruby: disable fiddle support for bfin
Message-ID: <20141025090725.54AB0B0EF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=816f5bbad11370187e519060b22da9ed76b57484
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable fiddle support because of compile failure (no ffi_closure support
for bfin).

Fixes:
 http://autobuild.buildroot.net/results/0a8/0a854274b520d4daca3911a64777a447b5756a52/

[Thomas: slightly adjust the comment wording.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 34da13d..e633ee4 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -30,6 +30,9 @@ RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"
 
 ifeq ($(BR2_bfin),y)
 RUBY_CONF_ENV = ac_cv_func_dl_iterate_phdr=no
+# Blackfin doesn't have FFI closure support, needed by the fiddle
+# extension.
+RUBY_CONF_OPTS += --with-out-ext=fiddle
 endif
 
 # Force optionals to build before we do
