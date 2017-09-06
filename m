From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 12:17:04 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/zmqpp: link with
	libatomic when needed
Message-ID: <20170906112606.EF65B8211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0190c95a5a6e4441afc7846c1d77de95099ff1f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes
http://autobuild.buildroot.net/results/c32/c32b9b8dd00d6f6d3db27fae9d8de758a4f25138/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 55a9d6d55888b04ec6c476399e5b98a2412995f5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zmqpp/zmqpp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index 3e35fd7..cf233b9 100644
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
