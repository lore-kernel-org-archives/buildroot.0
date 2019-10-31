From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 15:22:08 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/libunwind: add
 cxx exceptions support
Message-ID: <20191031142409.4C85A8E249@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7a2c7e066ee90c3675f6cd494bc8eb1cae8b07b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

If C++ is enabled, enable cxx exceptions, so libunwind will implement
_Unwind_GetIP which is used by mono (which already depends on C++)

Fixes:
 - http://autobuild.buildroot.net/results/dbd64c89815d393a4e28b312d74fd80ee6de92da

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d5bcb30cf910f13f08f4543cfb0d92a5ec103613)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libunwind/libunwind.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 94d1899bd3..26deaa5f00 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -11,7 +11,9 @@ LIBUNWIND_LICENSE_FILES = COPYING
 LIBUNWIND_LICENSE = MIT
 LIBUNWIND_AUTORECONF = YES
 
-LIBUNWIND_CONF_OPTS = --disable-tests
+LIBUNWIND_CONF_OPTS = \
+	--disable-tests \
+	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cxx-exceptions,--disable-cxx-exceptions)
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBUNWIND_DEPENDENCIES = libatomic_ops
