From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Mar 2012 16:40:05 +0100
Subject: [Buildroot] [PATCH 1/3] transmission: add missing host-intltool
	dependency
In-Reply-To: <cover.1332171599.git.thomas.petazzoni@free-electrons.com>
References: <cover.1332171599.git.thomas.petazzoni@free-electrons.com>
Message-ID: <786d20d636d012cf657b064730b58514bd33a41c.1332171599.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following build problem:

checking for intltool >= 0.35.0... ./configure: line 17915: intltool-update: command not found
 found
configure: error: Your intltool is too old.  You need intltool 0.35.0 or later.
make: *** [/home/test/test/output/build/transmission-2.33/.stamp_configured] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1
