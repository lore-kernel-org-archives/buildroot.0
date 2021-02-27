From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Feb 2021 16:55:28 +0100
Subject: [Buildroot] [git commit] package/python-aiohttp: security bump to
 version 3.7.4
Message-ID: <20210227153339.5F951861BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e60a9aa835a2141d4f8e382dc736862a29f6e7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

CVE-2021-21330: Open redirect vulnerability in aiohttp
(normalize_path_middleware middleware)

Beast Glatisant and Jelmer Vernooij reported that python-aiohttp, a async
HTTP client/server framework, is prone to an open redirect vulnerability.  A
maliciously crafted link to an aiohttp-based web-server could redirect the
browser to a different website.

For more details, see the advisory:
https://github.com/aio-libs/aiohttp/security/advisories/GHSA-v6wp-4m6f-gcjg

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 36056d2f99..db7dfd6b15 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  a66039c12f33dd093a2c260f5c459632  aiohttp-3.7.3.tar.gz
-sha256  9c1a81af067e72261c9cbe33ea792893e83bc6aa987bfbd6fdc1e5e7b22777c4  aiohttp-3.7.3.tar.gz
+md5  586eb4e4dcb1e41242ede0c5bcfd4014  aiohttp-3.7.4.tar.gz
+sha256  5d84ecc73141d0a0d61ece0742bb7ff5751b0657dab8405f899d3ceb104cc7de  aiohttp-3.7.4.tar.gz
 # Locally computed sha256 checksums
 sha256  96627bed0ad08e9b2efa9f4e04e80837cd0550e7694a0fec33b1dab2550282ab  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index e5a1354267..f1e755c023 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.7.3
+PYTHON_AIOHTTP_VERSION = 3.7.4
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/68/96/40a765d7d68028c5a6d169b2747ea3f4828ec91a358a63818d468380521c
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/7a/95/eb60aaad7943e18c9d091de93c9b0b5ed40aa67c7d5e3c5ee9b36f100a38
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
