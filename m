From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Mar 2012 16:43:31 +0100
Subject: [Buildroot] [git commit] transmission: add missing host-intltool
	dependency
Message-ID: <20120319154430.209CD953ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8125e977fb752e99f65f7318ad278ecf238ed763
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following build problem:

checking for intltool >= 0.35.0... ./configure: line 17915: intltool-update: command not found
 found
configure: error: Your intltool is too old.  You need intltool 0.35.0 or later.
make: *** [/home/test/test/output/build/transmission-2.33/.stamp_configured] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/transmission/transmission.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index c0d763b..9ffd432 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -8,6 +8,7 @@ TRANSMISSION_SITE = http://download.transmissionbt.com/files/
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.bz2
 TRANSMISSION_DEPENDENCIES = \
 	host-pkg-config \
+	host-intltool \
 	libcurl \
 	libevent \
 	openssl \
