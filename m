From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:49:48 +0100
Subject: [Buildroot] [git commit] mtr: bump to version 0.86 and use github
	call
Message-ID: <20141210205014.41DC7800B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1e016d7da35873b55cd24b67a1282d728bd74ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: remove useless --without-glib option, as noticed by Vincent.]

Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtr/mtr.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index aa4d883..3f73a5f 100644
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
+MTR_CONF_OPTS = --without-gtk
 MTR_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_NCURSES),ncurses)
 MTR_LICENSE = GPLv2
 MTR_LICENSE_FILES = COPYING
