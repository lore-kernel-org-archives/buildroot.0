From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:48:00 +0100
Subject: [Buildroot] [git commit] lunit: remove default definition of
	PKG_SUBDIR
Message-ID: <20170302215348.7231D80468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56a9131373d149ca4a6162bd5f9bc0b943d87cb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The luarocks infra already provides the correct default value for
PKG_SUBDIR, so it doesn't have to be defined in the .mk file.

Therefore, _VERSION_UPSTREAM doesn't need to be defined either.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lunit/lunit.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/lunit/lunit.mk b/package/lunit/lunit.mk
index 3c557f8..34e22db 100644
--- a/package/lunit/lunit.mk
+++ b/package/lunit/lunit.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-LUNIT_VERSION_UPSTREAM = 0.5
-LUNIT_VERSION = $(LUNIT_VERSION_UPSTREAM)-2
-LUNIT_SUBDIR = lunit-$(LUNIT_VERSION_UPSTREAM)
+LUNIT_VERSION = 0.5-2
 LUNIT_LICENSE = MIT
 LUNIT_LICENSE_FILES = $(LUNIT_SUBDIR)/LICENSE
 
