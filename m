From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 14:26:18 +0100
Subject: [Buildroot] [git commit] package/zmqpp: add patch to fix build issue
Message-ID: <20151122132630.B1F7381DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9d9bcb4e13651faf1898e9dcfa6d7af707a092b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch from upstream to fix build error:
  error: no match for 'operator<<'

Fixes:
http://autobuild.buildroot.net/results/ed4508a00663b03632a4eb9411ba05852d02fd88/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zmqpp/zmqpp.hash |    1 +
 package/zmqpp/zmqpp.mk   |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/zmqpp/zmqpp.hash b/package/zmqpp/zmqpp.hash
index 3d4a984..7bca39f 100644
--- a/package/zmqpp/zmqpp.hash
+++ b/package/zmqpp/zmqpp.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	92cb5bf7e1df8b99792fe1eb530bf91fced9c2d14159007bec011bb1b8248269  zmqpp-3.2.0.tar.gz
+sha256	0b76169a48a0ba9dd581b63787b4852f3922de0c22b7a325cab688c1bafb3dd7  260a9304f6c74272bd3c396f6cca685657b4aff1.patch
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index 03c6475..e506eaf 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -10,6 +10,7 @@ ZMQPP_INSTALL_STAGING = YES
 ZMQPP_DEPENDENCIES = zeromq
 ZMQPP_LICENSE = MIT
 ZMQPP_LICENSE_FILES = LICENSE
+ZMQPP_PATCH = https://github.com/zeromq/zmqpp/commit/260a9304f6c74272bd3c396f6cca685657b4aff1.patch
 
 ZMQPP_MAKE_OPTS = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
 ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
