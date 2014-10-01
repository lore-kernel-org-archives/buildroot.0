From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 22:45:24 +0200
Subject: [Buildroot] [git commit] package/gnupg2: add readline optional
	dependency
Message-ID: <20141001204538.D63129C769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f9d235e667b5ae61e90b1c03efdf2055e62c262
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is to improve build reproducibility.

[Thomas: add --with-readline and --without-readline options to
explicitly enable/disable readline usage.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/gnupg2.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index b0e7297..4b0a26e 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -33,4 +33,11 @@ else
 GNUPG2_CONF_OPT += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+GNUPG2_CONF_OPT += --with-readline=$(STAGING_DIR)
+GNUPG2_DEPENDENCIES += readline
+else
+GNUPG2_CONF_OPT += --without-readline
+endif
+
 $(eval $(autotools-package))
