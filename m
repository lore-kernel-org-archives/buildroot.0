From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Sep 2014 22:40:14 +0200
Subject: [Buildroot] [git commit] setserial: don't build setserial.cat
Message-ID: <20140904204104.365FB9D5F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cad60a22ca19e381fa093bc5690a3a9638914d2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/c73/c736933d4110865008f2d1e8b531b6e392c68285/

Don't use 'make all', as that also builds setserial.cat which needs nroff on
the build machine (and isn't needed anyway as it doesn't get installed /
referenced from anywhere).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/setserial/setserial.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index d4c0396..13174be 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -10,6 +10,8 @@ SETSERIAL_SOURCE = setserial_$(SETSERIAL_VERSION).orig.tar.gz
 SETSERIAL_SITE = http://snapshot.debian.org/archive/debian/20131001T214925Z/pool/main/s/setserial
 SETSERIAL_LICENSE = GPLv2
 SETSERIAL_LICENSE_FILES = debian/copyright
+# make all also builds setserial.cat which needs nroff
+SETSERIAL_MAKE_OPT = setserial
 
 define SETSERIAL_APPLY_DEBIAN_PATCHES
 	# Touching gorhack.h is needed for the Debian patch 18 to work
