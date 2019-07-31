From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 00:15:50 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/zeromq: security
 bump to version 4.3.2
Message-ID: <20190731221329.8C6B48894D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e01d65f617556670e2c8a3c7722a0782191b740
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes the following security issue:

CVE-2019-13132: a remote, unauthenticated client connecting to a
libzmq application, running with a socket listening with CURVE
encryption/authentication enabled, may cause a stack overflow and
overwrite the stack with arbitrary data, due to a buffer overflow in
the library. Users running public servers with the above configuration
are highly encouraged to upgrade as soon as possible, as there are no
known mitigations. All versions from 4.0.0 and upwards are affected.
Thank you Fang-Pen Lin for finding the issue and reporting it!

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: mention security impact]
(cherry picked from commit 45e5cd5a2bab8502f0752b565c2ae77fd154a40f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zeromq/zeromq.hash | 4 ++--
 package/zeromq/zeromq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
index 5af6a3ff8d..5b87c3ca15 100644
--- a/package/zeromq/zeromq.hash
+++ b/package/zeromq/zeromq.hash
@@ -1,6 +1,6 @@
 # From https://github.com/zeromq/libzmq/releases
-md5  64cbf3577afdbfda30358bc757a6ac83  zeromq-4.3.1.tar.gz
-sha1 6cce22d830eaf95feff7cab00744df13ad7ab7f3  zeromq-4.3.1.tar.gz
+md5  2047e917c2cc93505e2579bcba67a573 zeromq-4.3.2.tar.gz
+sha1 e5253bff214f77621b3d29443f1aa6e5a106ffe5  zeromq-4.3.2.tar.gz
 # Locally computed
 sha256 bcbabe1e2c7d0eec4ed612e10b94b112dd5f06fcefa994a0c79a45d835cd21eb  zeromq-4.3.1.tar.gz
 sha256 4fd86507c9b486764343065a9e035222869a27b5789efeb4fd93edc85412d7a3  COPYING
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index d799f863c4..2c2e3e45b8 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZEROMQ_VERSION = 4.3.1
+ZEROMQ_VERSION = 4.3.2
 ZEROMQ_SITE = https://github.com/zeromq/libzmq/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
