From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Mar 2014 21:24:27 +0100
Subject: [Buildroot] [git commit] httping: needs host-gettext
Message-ID: <20140316205026.28E209A8DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0bf78b830b9a5f2f1cdaa1fc097018edf1abd0eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For msgfmt, fixes:
http://autobuild.buildroot.net/results/9ce/9ce9b4c52a7e0d0159b5b4b9835b9e3e7f8b2a08/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/httping/httping.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 42d694f..610cecb 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -10,7 +10,7 @@ HTTPING_SITE = http://www.vanheusden.com/httping
 HTTPING_LICENSE = GPLv2
 HTTPING_LICENSE_FILES = license.txt
 HTTPING_LDFLAGS = $(if $(BR2_NEEDS_GETTEXT),-lintl) $(TARGET_LDFLAGS)
-HTTPING_DEPENDENCIES = \
+HTTPING_DEPENDENCIES = host-gettext \
 	$(if $(BR2_NEEDS_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_FFTW),fftw)
