From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 20 Nov 2015 21:54:40 +0100
Subject: [Buildroot] [PATCH 2/3] package/zmqpp: add patch to fix build issue
In-Reply-To: <1448052881-29222-1-git-send-email-joerg.krause@embedded.rocks>
References: <1448052881-29222-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1448052881-29222-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch from upstream to fix build error:
  error: no match for 'operator<<'

Fixes:
http://autobuild.buildroot.net/results/ed4508a00663b03632a4eb9411ba05852d02fd88/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/zmqpp/zmqpp.hash | 1 +
 package/zmqpp/zmqpp.mk   | 1 +
 2 files changed, 2 insertions(+)

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
-- 
2.6.2
