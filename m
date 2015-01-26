From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 08:40:57 +0100
Subject: [Buildroot] [git commit] bison: add host-m4 as dependency
Message-ID: <20150126074120.330FD7F9D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b6f4d49a99f6c8edb5286e52f2cc54f7094d5d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pull in host-m4 as dependency since it requires a new-enough m4 to build
properly and some distributions don't update that often. Fixes:
http://autobuild.buildroot.net/results/ee8/ee88f2c2a80dc19699d176ff2acde62fbc8a251f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bison/bison.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 76ceb6e..5779673 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -9,5 +9,6 @@ BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPLv3+
 BISON_LICENSE_FILES = COPYING
+HOST_BISON_DEPENDENCIES = host-m4
 
 $(eval $(host-autotools-package))
