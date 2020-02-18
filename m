From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2020 23:16:15 +0100
Subject: [Buildroot] [git commit] package/libsigrok: explain why
 host-doxygen is needed
Message-ID: <20200218221040.49A298E41C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8e4b9362ec71f4c6bea8fcba202577a1b400b50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigrok/libsigrok.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 4c1f31ea6e..8e7c355fd0 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -53,6 +53,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBSIGROKCXX),y)
 LIBSIGROK_CONF_OPTS += --enable-cxx
+# host-doxygen is used by C++ bindings to parse libsigrok symbols
 LIBSIGROK_DEPENDENCIES += \
 	glibmm \
 	host-doxygen \
