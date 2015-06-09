From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:05:35 +0200
Subject: [Buildroot] [git commit] package/matchbox: forcibly disable gconf
Message-ID: <20150609211052.976DD7FEE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60844a34122bd36e846a28728e4ab0e2541586bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot does not have a gconf package, so explicitly disable gconf
support (to avoid it ends up picking the host one).

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/matchbox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 29e240e..0899208 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -11,7 +11,7 @@ MATCHBOX_LICENSE = GPLv2+
 MATCHBOX_LICENSE_FILES = COPYING
 
 MATCHBOX_DEPENDENCIES = matchbox-lib
-MATCHBOX_CONF_OPTS = --enable-expat
+MATCHBOX_CONF_OPTS = --enable-expat --disable-gconf
 
 # Workaround bug in configure script
 MATCHBOX_CONF_ENV = expat=yes
