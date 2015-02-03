From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Feb 2015 23:44:05 +0100
Subject: [Buildroot] [git commit] python-pyzmq: ensure correct path to zmq
	is used
Message-ID: <20150203224817.6DC2A80E25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60dbd1da7886217a0cc4b4bcd62cf2c19fe62dd8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/6ae/6ae84c53985ab52ab1c64dd1e2a16d0bcf9eed1e/
http://autobuild.buildroot.net/results/04d/04d5ceb5335912916f05596a285e84d38a7c7d31/
http://autobuild.buildroot.net/results/77a/77ae85f24fabd00f2981f2dbddb52d8d5091b4a8/
http://autobuild.buildroot.net/results/27a/27adf12cca4e0e998b64fda9bf4be67f6dbe1595/

And many more.

If --zmq isn't passed then python-pymq falls back to using 'pkg-config
--variable=prefix libzmq' which returns /usr, causing it to look in /usr/lib
for libraries breaking the build.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyzmq/python-pyzmq.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 82bf3d0..7f86b52 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -12,6 +12,7 @@ PYTHON_PYZMQ_LICENSE = LGPLv3+ BSD-3c Apache-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
 PYTHON_PYZMQ_DEPENDENCIES = zeromq
 PYTHON_PYZMQ_SETUP_TYPE = distutils
+PYTHON_PYZMQ_BUILD_OPTS = --zmq=$(STAGING_DIR)/usr
 
 # Due to issues with cross-compiling, hardcode to the zeromq in BR
 define PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
