From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:31:02 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/lirc-tools: use
 single quote with SETUPTOOLS_ENV
Message-ID: <20191222204328.39F398D6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da57f0a742542e86382954f7ca9b6a0846f15ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

With the change to pkg-python to use TARGET_CONFIGURE_OPTS in
PKG_PYTHON_SETUPTOOLS_ENV in commit 1745fcde74, the
LIRC_TOOLS_MAKE_ENV is incorrect as it sets the SETUPTOOLS_ENV using
double quotes. This causes issues because the
PKG_PYTHON_SETUPTOOLS_ENV contain double quotes as well. This causes a
build error such as:

  /bin/sh: -I/home/naourr/work/instance-0/output-1/host/include
          CXXFLAGS_FOR_BUILD=-O2: No such file or directory

Fix this by using single quotes with PKG_PYTHON_SETUPTOOLS_ENV instead
of double quotes.

Fixes:
  http://autobuild.buildroot.net/results/f7a9c02add9bde563c7289f7c0be2cb7aefd96b8

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8192ff796a7e851f128ddbd7394dd8337942df52)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lirc-tools/lirc-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index e468f2a25d..d66f4e9925 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -47,7 +47,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIRC_TOOLS_DEPENDENCIES += python3 host-python3-setuptools
-LIRC_TOOLS_MAKE_ENV += SETUPTOOLS_ENV="$(PKG_PYTHON_SETUPTOOLS_ENV)"
+LIRC_TOOLS_MAKE_ENV += SETUPTOOLS_ENV='$(PKG_PYTHON_SETUPTOOLS_ENV)'
 endif
 
 define LIRC_TOOLS_INSTALL_INIT_SYSV
