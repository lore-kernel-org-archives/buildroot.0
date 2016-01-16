From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:37 +0100
Subject: [Buildroot] [PATCH 45/80 v1] package/gnuradio: split long omment
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <db4e2619cc112a795d22f0dace2f2d94e53a39d7.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It does not fit even is a wider-than-normal terminal.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes RFC -> v1;
  - tabulate comment  (Arnout)
  - slightly tweak sentence  (Arnout)
  - follow alphabetical ordering

---
Note to Arnout: I did not exactly use your proposal to fix the sentence,
because it was too wide or would have required yet another line.
---
 package/gnuradio/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index f2c884b..3dfd0a3 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -58,8 +58,11 @@ config BR2_PACKAGE_GNURADIO_UTILS
 	help
 	  Misc python utilities
 
-comment "gr-fft, -filter, -analog, -channels, -digital, -trellis, -pager depends fftw's single precision"
-	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
+if !BR2_PACKAGE_FFTW_PRECISION_SINGLE
+comment "gr-analog, gr-channels, gr-digital, gr-fft,"
+comment "gr-filter, gr-pager and gr-trellis support "
+comment "all depend on fftw with single precision.  "
+endif
 
 if BR2_PACKAGE_FFTW_PRECISION_SINGLE
 
-- 
1.9.1
