From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 17:41:09 +0200
Subject: [Buildroot] [git commit] Makefile: target-generatelocales: add
	toolchain dependency
Message-ID: <20140420154123.C9C7E9C8B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1990e79f1439830291cac58f1fe6525cc68df637
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The target depends on the toolchain so add it as a dependency.
This also fix the support to top-level parallel make.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index c33368a..d10da9d 100644
--- a/Makefile
+++ b/Makefile
@@ -598,7 +598,7 @@ ifneq ($(GENERATE_LOCALE),)
 # data comes preferably from the toolchain, or if the toolchain does
 # not have them (Linaro toolchains), we use the ones available on the
 # host machine.
-target-generatelocales: host-localedef
+target-generatelocales: host-localedef toolchain
 	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
 	$(Q)for locale in $(GENERATE_LOCALE) ; do \
 		inputfile=`echo $${locale} | cut -f1 -d'.'` ; \
