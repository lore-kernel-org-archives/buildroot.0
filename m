From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Feb 2011 14:36:52 +0100
Subject: [Buildroot] [git commit master 1/1] bind: disable parallel build
Message-ID: <20110220133715.1C57C8F407@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b1a3545a3f9dc3f18154dcfbe467c62a5088ed3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build system of bind seems to have issues with (highly) parallel
builds, breaking the build with errors like:

libtool: link: `nothreads/condition.lo' is not a valid libtool object

So disable parallel builds.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bind/bind.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index f402ad1..ff0ec04 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -11,6 +11,7 @@ BIND_TARGET_SBINS += named-compilezone rndc rndc-confgen
 BIND_TARGET_SBINS += dnssec-keygen dnssec-signzone
 BIND_TARGET_BINS = dig host nslookup nsupdate
 BIND_TARGET_LIBS = libbind9.* libdns.* libisccc.* libisccfg.* libisc.* liblwres.*
+BIND_MAKE = $(MAKE1)
 BIND_CONF_ENV =	BUILD_CC="$(TARGET_CC)" \
 		BUILD_CFLAGS="$(TARGET_CFLAGS)"
 BIND_CONF_OPT =	\
-- 
1.7.3.4
