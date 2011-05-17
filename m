From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 May 2011 10:00:01 +0200
Subject: [Buildroot] [git commit] Makefile.autotools.in: default to same
	<pkg>_MAKE setting for host and target
Message-ID: <20110517080243.AB17B83547@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ce1ae872aa72547bb291cc9e70adfe1b065cd2a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to how it is done for _SOURCE, _PATCH, _SITE and _SUBDIR.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 61fcfcf..917600c 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -57,9 +57,16 @@ ifndef $(2)_LIBTOOL_PATCH
  endif
 endif
 
+ifndef $(2)_MAKE
+ ifdef $(3)_MAKE
+  $(2)_MAKE = $($(3)_MAKE)
+ else
+  $(2)_MAKE ?= $(MAKE)
+ endif
+endif
+
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
-$(2)_MAKE			?= $(MAKE)
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPT			?=
 $(2)_AUTORECONF			?= NO
-- 
1.7.3.4
