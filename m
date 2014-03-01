From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 23:46:15 +0100
Subject: [Buildroot] [git commit] bustle: use TARGET_MAKE_ENV instead of
	setting PATH in the make environment
Message-ID: <20140301224624.72A249936F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d93589c8f318654b3cf572930541085f68adbf0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TARGET_MAKE_ENV already contains the PATH definition among other useful
variables.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bustle/bustle.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 2330c08..7bc3e97 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -11,7 +11,7 @@ BUSTLE_LICENSE_FILES = LICENSE
 BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
 
 define BUSTLE_BUILD_CMDS
-	PATH=$(TARGET_PATH) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		PCAP_FLAGS='-lpcap' -C $(@D) dist/build/bustle-pcap
 endef
 
