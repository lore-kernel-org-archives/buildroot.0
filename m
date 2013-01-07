From: Anthony Viallard <viallard@syscom-instruments.com>
Date: Mon,  7 Jan 2013 14:30:14 +0100
Subject: [Buildroot] [PATCH 2/5] gnuplot : disable inadequate options for
	embedded platform
In-Reply-To: <1357565417-16782-1-git-send-email-viallard@syscom-instruments.com>
References: <1357565417-16782-1-git-send-email-viallard@syscom-instruments.com>
Message-ID: <1357565417-16782-2-git-send-email-viallard@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable options for embedded platform to save space and
make a good cross compilation.

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
---
 package/gnuplot/gnuplot.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 2f05624..ea4a6f4 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -8,7 +8,17 @@ GNUPLOT_SOURCE = gnuplot-$(GNUPLOT_VERSION).tar.gz
 GNUPLOT_SITE = http://superb-dca2.dl.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_INSTALL_STAGING = YES
 GNUPLOT_INSTALL_TARGET = YES
-GNUPLOT_CONF_OPT = 
+GNUPLOT_CONF_OPT = --without-x \
+		--disable-raise-console \
+		--disable-mouse \
+	        --without-tutorial \
+		--without-demo --disable-demo \
+	        --without-row-help \
+		--disable-history-file \
+	        --without-lisp-files \
+	        --disable-wxwidgets \
+	        --without-lua \
+		--without-latex \
+	        --without-cairo
 
 $(eval $(autotools-package))
-- 
1.7.10.4
