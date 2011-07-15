From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 15 Jul 2011 21:24:24 +0200
Subject: [Buildroot] [git commit] gnutls: update to version 2.10.3
Message-ID: <20110715201119.954738A58E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8a08570c19269dfa138ed5138035c105327ee2f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are newer releases available, but this is the last release that
uses libgcrypt. Newer versions prefer nettle over gcrypt. But then there
are users of gnutls (for example libsoup and glib-networking) that
assume that gnutls uses gcrypt as its crypto backend. They won't compile
with a version of gnutls that uses nettle.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/gnutls.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 5f31e1e..db5d583 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GNUTLS_VERSION = 2.8.6
+GNUTLS_VERSION = 2.10.3
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
 GNUTLS_SITE = http://ftp.gnu.org/gnu/gnutls/
 GNUTLS_DEPENDENCIES = libgcrypt
-- 
1.7.3.4
