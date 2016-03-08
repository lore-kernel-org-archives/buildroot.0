From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:00:33 +0100
Subject: [Buildroot] [git commit] zeromq: unbreak pgm support
Message-ID: <20160308200039.9F1AC80AEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d518453aee601acd9dab759744f5152387e33fdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the bump to the 4.1.x series the bundled pgm library was dropped and
the --with-system-pgm option was made pointless since using unbundled
became the only option, so it was renamed to --with-pgm, which
previously meant "use bundled" (but not any longer).
However this wasn't accounted for and pgm support has been broken since
then.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zeromq/zeromq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index ce01e50..b80f8e4 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -30,7 +30,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_ZEROMQ_PGM),y)
 ZEROMQ_DEPENDENCIES += host-pkgconf openpgm
-ZEROMQ_CONF_OPTS += --with-system-pgm
+ZEROMQ_CONF_OPTS += --with-pgm
 endif
 
 # ZeroMQ uses libsodium if it's available.
