From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:34 +0100
Subject: [Buildroot] [PATCH 12/25] lunit: remove default definition of
	PKG_SUBDIR
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-13-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The luarocks infra already provides the correct default value for
PKG_SUBDIR, so it doesn't have to be defined in the .mk file.

Therefore, _VERSION_UPSTREAM doesn't need to be defined either.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lunit/lunit.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/lunit/lunit.mk b/package/lunit/lunit.mk
index 3c557f8748..34e22db757 100644
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
 
-- 
2.11.0
