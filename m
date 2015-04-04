From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 21:14:44 +0200
Subject: [Buildroot] [git commit] xerces: disable build and installation of
	samples
Message-ID: <20150404191543.98E92817EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd63c8bc6c86c0645374fda8dfa654c3cd668656
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit tweaks the Makefile.in to not build and install example
applications.

[Thomas: improve commit log, rebase on top of latest master.]

Signed-off-by: Damien Lanson <damien@kal-host.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xerces/xerces.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 20426b6..cf36183 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -15,6 +15,12 @@ XERCES_CONF_OPTS = \
 	--disable-threads \
 	--with-gnu-ld
 
+define XERCES_DISABLE_SAMPLES
+	$(SED) 's/ samples//' $(@D)/Makefile.in
+endef
+
+XERCES_POST_PATCH_HOOKS += XERCES_DISABLE_SAMPLES
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 XERCES_CONF_ENV += LIBS=-liconv
 XERCES_DEPENDENCIES += libiconv
