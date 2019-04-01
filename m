From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 21:52:12 +0200
Subject: [Buildroot] [git commit] package/gettext-tiny: host and target
 legal-info are different
Message-ID: <20190401194835.B59C981052@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9766d7eec1b23888276c8a37389d856a0ead3d37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the target, we only ever use the gettext-tiny source, while for
the host we also use that of gettext-gnu.

Fixes:
    http://autobuild.buildroot.org/results/572/5724b246cf411d95702fcff6dbf2b809b899108c/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: "Giulio Benetti" <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gettext-tiny/gettext-tiny.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index c9052d0d7c..881edc6f35 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -8,7 +8,8 @@ GETTEXT_TINY_VERSION = v0.3.1
 GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
 GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)
 GETTEXT_TINY_INSTALL_STAGING = YES
-GETTEXT_TINY_LICENSE_FILES = LICENSE extra/COPYING
+GETTEXT_TINY_LICENSE_FILES = LICENSE
+HOST_GETTEXT_TINY_LICENSE_FILES = LICENSE extra/COPYING
 
 GETTEXT_TINY_PROVIDES = gettext
 
