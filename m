From: Anthony Viallard <viallard@syscom-instruments.com>
Date: Mon,  7 Jan 2013 14:30:17 +0100
Subject: [Buildroot] [PATCH 4/4] gnuplot : add LICENSE things and new
	configure options
In-Reply-To: <1357565417-16782-1-git-send-email-viallard@syscom-instruments.com>
References: <1357565417-16782-1-git-send-email-viallard@syscom-instruments.com>
Message-ID: <1357565417-16782-5-git-send-email-viallard@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gnuplot isn't under GPL but has his own open source license.

Use autoreconf feature for now. Waiting upstream integration of  
gnuplot-0001-configure-add-without-demo-option.patch.

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
---
 package/gnuplot/gnuplot.mk |    8 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 3b4abc2..2e1e8c4 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -7,12 +7,16 @@ GNUPLOT_VERSION = 4.6.0
 GNUPLOT_SOURCE = gnuplot-$(GNUPLOT_VERSION).tar.gz
 GNUPLOT_SITE = http://superb-dca2.dl.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_INSTALL_STAGING = YES
-GNUPLOT_INSTALL_TARGET = YES
+GNUPLOT_LICENSE = gnuplot license (open source)
+GNUPLOT_LICENSE_FILES = Copyright
+GNUPLOT_AUTORECONF = YES
+
 GNUPLOT_CONF_OPT = --without-x \
 		--disable-raise-console \
 		--disable-mouse \
 	        --without-tutorial \
+		--without-demo \
+		--without-doc \
 	        --without-row-help \
 		--disable-history-file \
 	        --without-lisp-files \
-- 
1.7.10.4
