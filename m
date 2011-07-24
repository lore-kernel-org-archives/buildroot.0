From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jul 2011 14:02:25 +0200
Subject: [Buildroot] [git commit] bind: fix intermittent build issues with
	high BR2_JLEVEL
Message-ID: <20110724135547.73F198B486@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aa7a46d612654f7a03b19edacc9a8b1416012295
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build sometimes breaks with:

libtool: link: `unix/os.lo' is not a valid libtool object
make[3]: *** [rndc-confgen] Error 1
make[3]: *** Waiting for unfinished jobs....
make[4]: Leaving directory `/scratch/peko/build/bind-9.6-ESV-R4/bin/rndc/unix'

So disable parallel builds.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bind/bind.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 2df6ae8..0530934 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -6,6 +6,7 @@
 
 BIND_VERSION = 9.6-ESV-R4
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
+BIND_MAKE = $(MAKE1)
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
 BIND_TARGET_SBINS += named-compilezone rndc rndc-confgen dnssec-dsfromkey
 BIND_TARGET_SBINS += dnssec-keyfromlabel dnssec-keygen dnssec-signzone
-- 
1.7.3.4
