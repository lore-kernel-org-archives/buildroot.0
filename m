From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 07:56:57 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/bison: disable
 libtextstyle
Message-ID: <20201003061937.9FB488E10C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7c334c1fdb43569cdd21434a27c29ec2289bce7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Recent bison versions added support for fancy error output using gettext
provided libtextstyle. The Buildroot gettext version does not provided
all needed features. However host-bison might detect host installed
libtextstyle at configure time, but fail at run time because of missing
symbols in Buildroot provided libtextstyle.

We don't really need fancy output of host packages, so just disable
libtextstyle support.

Fixes (libpcap):
http://autobuild.buildroot.net/results/058e8ec90da3c06e31b31eb94541331cced44db3/
http://autobuild.buildroot.net/results/d99dda99722c53730b5964bd4ff1e1281c4ad759/
http://autobuild.buildroot.net/results/056fd1246554fe7def416429620175e86530c0a7/

Cc: Xogium <contact@xogium.me>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Xogium <contact@xogium.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8d389c521cebdaee04519a09a003b7b7592f40d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bison/bison.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 4cc635c445..738052096a 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -13,5 +13,6 @@ BISON_LICENSE_FILES = COPYING
 BISON_MAKE = $(MAKE1)
 HOST_BISON_DEPENDENCIES = host-m4
 HOST_BISON_CONF_OPTS = --enable-relocatable
+HOST_BISON_CONF_ENV = ac_cv_libtextstyle=no
 
 $(eval $(host-autotools-package))
