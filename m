From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2021 11:32:16 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/poppler: use
 ENABLE_GLIB
Message-ID: <20210112101557.6ACDD86FE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5be4bc484b24ec98d061e492c4ab0954475f866a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Use ENABLE_GLIB which is available since version 0.60 and
https://github.com/freedesktop/poppler/commit/766a32ff59dadd9ae4639d8a79861a17be6aec52

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bf68bd59c15047f02fbe5f52960c50617fc4a7e2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index e452c2336d..69a3bcace5 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -98,6 +98,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 POPPLER_DEPENDENCIES += libglib2
+POPPLER_CONF_OPTS += -DENABLE_GLIB=ON
+else
+POPPLER_CONF_OPTS += -DENABLE_GLIB=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
