From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 09:56:38 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-bottle:
 security bump to version 0.12.19
Message-ID: <20210210085148.C42D083984@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abc519678be9544457081ec185bf42df939b10c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issue:

CVE-2020-28473: The package bottle from 0 and before 0.12.19 are vulnerable
to Web Cache Poisoning by using a vector called parameter cloaking.  When
the attacker can separate query parameters using a semicolon (;), they can
cause a difference in the interpretation of the request between the proxy
(running with default configuration) and the server.  This can result in
malicious requests being cached as completely safe ones, as the proxy would
usually not see the semicolon as a separator, and therefore would not
include it in a cache key of an unkeyed parameter.

In addition, bottle 0.12.18 fixed a compatibility issue with python 3.8+:

https://github.com/bottlepy/bottle/issues/1181

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 14cc349d267c61a4c2e29a3dc307ae5309b6fc6f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bottle/python-bottle.hash | 4 ++--
 package/python-bottle/python-bottle.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
index 03558c1abc..7dcaac8dc6 100644
--- a/package/python-bottle/python-bottle.hash
+++ b/package/python-bottle/python-bottle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bottle/json
-md5	c7d8a42dbc6955593e5b9f957e650a60  bottle-0.12.17.tar.gz
-sha256	e9eaa412a60cc3d42ceb42f58d15864d9ed1b92e9d630b8130c871c5bb16107c  bottle-0.12.17.tar.gz
+md5  50075544706b5e662a3fbd9a98e24b07  bottle-0.12.19.tar.gz
+sha256	a9d73ffcbc6a1345ca2d7949638db46349f5b2b77dac65d6494d45c23628da2c  bottle-0.12.19.tar.gz
 # Locally computed sha256 checksums
 sha256	d0e7211f1c3c1a1c56f39d18bcb07f27f480c8a9552617756dda3a335933b8a6  LICENSE
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index a8879010e8..18f1507a97 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.12.17
+PYTHON_BOTTLE_VERSION = 0.12.19
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
-PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/c4/a5/6bf41779860e9b526772e1b3b31a65a22bd97535572988d16028c5ab617d
+PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/ea/80/3d2dca1562ffa1929017c74635b4cb3645a352588de89e90d0bb53af3317
 PYTHON_BOTTLE_LICENSE = MIT
 PYTHON_BOTTLE_LICENSE_FILES = LICENSE
 PYTHON_BOTTLE_SETUP_TYPE = setuptools
