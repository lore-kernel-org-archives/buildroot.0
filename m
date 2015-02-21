From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 16:50:38 +0100
Subject: [Buildroot] [git commit] package/efl/libevas: add missing
	dependency on fontconfig
Message-ID: <20150221155344.E21F0803FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f79f5e76ad08d350c655a1baf06180b0d890822
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libevas/libevas.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index b5a2d72..30d9f7c 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -205,6 +205,13 @@ else
 LIBEVAS_CONF_OPTS += --disable-font-loader-eet
 endif
 
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+LIBEVAS_CONF_OPTS += --enable-fontconfig
+LIBEVAS_DEPENDENCIES += fontconfig
+else
+LIBEVAS_CONF_OPTS += --disable-fontconfig
+endif
+
 # libevas installs the source code of examples on the target, which
 # are generally not useful.
 define LIBEVAS_REMOVE_EXAMPLES
