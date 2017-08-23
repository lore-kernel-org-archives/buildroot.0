From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 23:21:17 +0200
Subject: [Buildroot] [git commit] package/zmqpp: link with libatomic when
	needed
Message-ID: <20170823211714.81DAD81DC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55a9d6d55888b04ec6c476399e5b98a2412995f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/c32/c32b9b8dd00d6f6d3db27fae9d8de758a4f25138/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zmqpp/zmqpp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index d651c32..f576527 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -13,6 +13,10 @@ ZMQPP_LICENSE_FILES = LICENSE
 ZMQPP_MAKE_OPTS = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
 ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+ZMQPP_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_ZMQPP_CLIENT),y)
 ZMQPP_DEPENDENCIES += boost
 endif
