From: David Barbion <david.barbion@ext.leroymerlin.fr>
Date: Tue, 12 Jun 2018 08:02:53 +0200
Subject: [Buildroot] [PATCH 1/1] qt5webengine: fix enable condition
Message-ID: <20180612060253.5142-1-david.barbion@ext.leroymerlin.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Barbion <david.barbion@ext.leroymerlin.fr>
---
 package/qt5/qt5webengine/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 38486c6dcf..744d659567 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -31,7 +31,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # qt5base-icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5base-icu
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || BR2_PACKAGE_QT5_VERSION_5_6 # libnss
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || BR2_PACKAGE_QT5_VERSION_5_6 # libnss
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
-- 
2.17.1



Ce message et toutes les pi?ces jointes sont ?tablis ? l'attention exclusive de leurs destinataires et sont confidentiels. Si vous recevez ce message par erreur, merci de le d?truire et d'en avertir imm?diatement l'exp?diteur. L'internet ne permettant pas d'assurer l'int?grit? de ce message, le contenu de ce message ne repr?sente en aucun cas un engagement de la part de Leroy Merlin.
