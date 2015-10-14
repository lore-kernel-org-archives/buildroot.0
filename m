From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:48:19 +0200
Subject: [Buildroot] [git commit] slang: forcibly disable oniguruma support
Message-ID: <20151014214910.B4C1A81EBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3cd1a9febe6a051db98d737a3bb78c8f461a3af3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the host has oniguruma installed then slang can detect it and try to
(wrongly) link against it resulting in build failure. Fixes:
http://autobuild.buildroot.net/results/51f/51ff079ebbd363e0445d226ec80bc28e524fd88c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/slang/slang.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 59ef993..1a7576a 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -9,6 +9,7 @@ SLANG_SITE = http://www.jedsoft.org/releases/slang
 SLANG_LICENSE = GPLv2+
 SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
+SLANG_CONF_OPTS = --with-onig=no
 SLANG_MAKE = $(MAKE1)
 
 # Racy and we don't have/do libtermcap
