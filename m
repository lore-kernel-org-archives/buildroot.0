From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 23:45:59 +0100
Subject: [Buildroot] [git commit] package/spice: depend on libglib2
Message-ID: <20160221224607.A19B1817EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbc7e23402cf8e1b1ed97cd7aa4ba2d76c0b1df6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package selects BR2_PACKAGE_LIBGLIB2 but did not depend on it.

The buildsystem treats libglib2 as a hard-dependency:
https://cgit.freedesktop.org/spice/spice/tree/configure.ac?h=0.12#n117

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/spice/spice.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index a31d78d..61a9772 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -14,6 +14,7 @@ SPICE_DEPENDENCIES =        \
 	alsa-lib            \
 	celt051             \
 	jpeg                \
+	libglib2            \
 	openssl             \
 	pixman              \
 	python-pyparsing    \
