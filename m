From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Sep 2020 23:11:33 +0200
Subject: [Buildroot] [PATCH 2/3 v4] package/qt5/qt5webengine: ffmpeg
 supports needs webp mux
In-Reply-To: <cover.1600290685.git.yann.morin.1998@free.fr>
References: <cover.1600290685.git.yann.morin.1998@free.fr>
Message-ID: <3ffb3868cd4aa642a914fb61f5caec94a956b45b.1600290685.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nathan Ford <nford@westpond.com>

qt5webengine also now requires webp mux support or the auto
detection of ffmpeg will fail.

Signed-off-by: Nathan Ford <nford@westpond.com>
[yann.morin.1998 at free.fr:
  - refresh on master
  - split into ists own patch
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5webengine/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 9879345e1e..c830420479 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -44,6 +44,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	select BR2_PACKAGE_OPUS
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
+	select BR2_PACKAGE_WEBP_MUX
 	select BR2_PACKAGE_QT5BASE_DBUS
 	select BR2_PACKAGE_QT5BASE_EGLFS
 	select BR2_PACKAGE_QT5BASE_FONTCONFIG
-- 
2.20.1
