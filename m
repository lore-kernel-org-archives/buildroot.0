From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Nov 2014 22:25:28 +0100
Subject: [Buildroot] [git commit] zeromq: security bump to version 4.0.5
Message-ID: <20141111213945.1A954B4346@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cefe929fa2a978b8335844ef3a89bde19c65434
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-7202 - stream_engine.cpp in libzmq (aka ZeroMQ/C++)) 4.0.5
before 4.0.5 allows man-in-the-middle attackers to conduct downgrade
attacks via a crafted connection request.
CVE-2014-7203 - libzmq (aka ZeroMQ/C++) 4.0.x before 4.0.5 does not
ensure that nonces are unique, which allows man-in-the-middle attackers
to conduct replay attacks via unspecified vectors.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sable-test_fork-if-fork-is-not-available.patch} |    0
 package/zeromq/zeromq.hash                         |    2 ++
 package/zeromq/zeromq.mk                           |    3 ++-
 3 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/zeromq/zeromq-0001-tests-disable-test_fork-if-fork-is-not-available.patch b/package/zeromq/0001-tests-disable-test_fork-if-fork-is-not-available.patch
similarity index 100%
rename from package/zeromq/zeromq-0001-tests-disable-test_fork-if-fork-is-not-available.patch
rename to package/zeromq/0001-tests-disable-test_fork-if-fork-is-not-available.patch
diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
new file mode 100644
index 0000000..729e7ea
--- /dev/null
+++ b/package/zeromq/zeromq.hash
@@ -0,0 +1,2 @@
+# Locally calculated from download (no sig, hash)
+sha256	3bc93c5f67370341428364ce007d448f4bb58a0eaabd0a60697d8086bc43342b	zeromq-4.0.5.tar.gz
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 59d276e..987c65b 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-ZEROMQ_VERSION = 4.0.4
+ZEROMQ_VERSION = 4.0.5
 ZEROMQ_SITE = http://download.zeromq.org
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_LICENSE = LGPLv3+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
+# For 0001-tests-disable-test_fork-if-fork-is-not-available.patch
 ZEROMQ_AUTORECONF = YES
 
 # Only tools/curve_keygen.c needs this, but it doesn't hurt to pass it
