From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 13:12:25 +0200
Subject: [Buildroot] [git commit] faifa: force GIT_REV to a correct value
Message-ID: <20140611111743.4CB239B9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04c32c30a1d39cc141484d6ebcab1f5f5e1dda2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variable is looked up by the Makefile throught a git command line
invocation.
Since we don't keep the '.git' folder in the packages when we clone
them, the command line fail to find anything.

Even worse, it can keep going up the tree until it finds buildroot's
'.git' directory.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/faifa/faifa.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/faifa/faifa.mk b/package/faifa/faifa.mk
index 8f5d258..c83b02a 100644
--- a/package/faifa/faifa.mk
+++ b/package/faifa/faifa.mk
@@ -11,6 +11,8 @@ FAIFA_DEPENDENCIES = libpcap host-autoconf
 FAIFA_LICENSE = GPLv2+
 FAIFA_LICENSE_FILES = COPYING
 
+FAIFA_MAKE_OPT += GIT_REV=$(FAIFA_VERSION)
+
 # This package uses autoconf, but not automake, so we need to call
 # their special autogen.sh script, and have custom target and staging
 # installation commands.
