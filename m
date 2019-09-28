From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:32:57 +0200
Subject: [Buildroot] [git commit] package/minimodem: add BR2_PACKAGE_FFTW
 select
Message-ID: <20190928194203.A062A81312@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38d99aadf641dd92e4997c6a7f54fafb5da39b05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes following warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_FFTW_SINGLE
  Depends on [n]: BR2_PACKAGE_FFTW [=n]
  Selected by [y]:
  - BR2_PACKAGE_MINIMODEM [=y]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
