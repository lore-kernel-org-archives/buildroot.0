From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 07:21:21 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-dpkt:
 remove Python2 only dependency
Message-ID: <20200506051931.D56598B7AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f882e9942ff70d054ccf4c11657f743dd530629
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

python-dpkt supports both Python flavors.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 12ccb92fce1ecb4215ff1071656292a5b9d4313d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-dpkt/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-dpkt/Config.in b/package/python-dpkt/Config.in
index d8e3388d7e..9bd7a98d26 100644
--- a/package/python-dpkt/Config.in
+++ b/package/python-dpkt/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_DPKT
 	bool "python-dpkt"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  Fast, simple packet creation / parsing, with definitions
 	  for the basic TCP/IP protocols.
