From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:52 +0200
Subject: [Buildroot] [PATCH 41/83 v2] package/gnuradio: split long omment
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <fda179f1f20228dfe91ad5d6d0f88381d6c26b63.1467624132.git.yann.morin.1998@free.fr>
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
index 9efe9d3..4bc71b9 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -67,8 +67,11 @@ config BR2_PACKAGE_GNURADIO_UTILS
 	help
 	  Misc python utilities
 
-comment "gr-fft, -filter, -analog, -channels, -digital, -trellis, -pager, -qtgui depends fftw's single precision"
-	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
+if !BR2_PACKAGE_FFTW_PRECISION_SINGLE
+comment "gr-analog, gr-channels, gr-digital, gr-fft,i"
+comment "gr-filter, gr-pager, gr-trellis and gr-qtgui"
+comment "all depend on fftw with single precision.   "
+endif
 
 if BR2_PACKAGE_FFTW_PRECISION_SINGLE
 
-- 
2.7.4
