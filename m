From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Sep 2019 20:54:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/minimodem: add BR2_PACKAGE_FFTW
 select
Message-ID: <20190928185444.21791-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes following warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_FFTW_SINGLE
  Depends on [n]: BR2_PACKAGE_FFTW [=n]
  Selected by [y]:
  - BR2_PACKAGE_MINIMODEM [=y]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minimodem/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minimodem/Config.in b/package/minimodem/Config.in
index cbf0b73db1..7d4efb6900 100644
--- a/package/minimodem/Config.in
+++ b/package/minimodem/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MINIMODEM
 	bool "minimodem"
+	select BR2_PACKAGE_FFTW
 	select BR2_PACKAGE_FFTW_SINGLE
 	select BR2_PACKAGE_LIBSNDFILE if !BR2_PACKAGE_ALSA_LIB_PCM && !BR2_PACKAGE_PULSEAUDIO
 	help
-- 
2.23.0
