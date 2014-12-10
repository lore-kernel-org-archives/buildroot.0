From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Tue,  9 Dec 2014 18:10:55 -0800
Subject: [Buildroot] [PATCH 1/1] mtr: bump to version 0.86 and use github
	call
Message-ID: <1418177455-27127-1-git-send-email-vsergeev@kumunetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
---
 package/mtr/mtr.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index aa4d883..f376d47 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-MTR_VERSION = 0.85
-MTR_SITE = ftp://ftp.bitwizard.nl/mtr
-MTR_CONF_OPTS = --without-gtk --without-glib
+MTR_VERSION = v0.86
+MTR_SITE = $(call github,traviscross,mtr,$(MTR_VERSION))
+MTR_AUTORECONF = YES
+MTR_CONF_OPT = --without-gtk --without-glib
 MTR_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_NCURSES),ncurses)
 MTR_LICENSE = GPLv2
 MTR_LICENSE_FILES = COPYING
-- 
2.1.3
