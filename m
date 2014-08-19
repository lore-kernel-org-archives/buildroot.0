From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Aug 2014 20:07:18 +0200
Subject: [Buildroot] [PATCH 6/6] metacity: refactor with host-perl
In-Reply-To: <1408471638-4551-1-git-send-email-francois.perrad@gadz.org>
References: <1408471638-4551-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1408471638-4551-6-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/metacity/metacity.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index 6ded5d1..91ed1d3 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -12,6 +12,8 @@ METACITY_SITE = http://ftp.gnome.org/pub/gnome/sources/metacity/$(METACITY_VERSI
 METACITY_LICENSE = GPLv2+
 METACITY_LICENSE_FILES = COPYING
 
+METACITY_CONF_ENV = INTLTOOL_PERL=$(PERL_RUN)
+
 METACITY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib \
 		--disable-glibtest --disable-gconf \
-- 
1.9.1
