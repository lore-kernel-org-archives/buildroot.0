From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Mar 2016 22:57:52 +0100
Subject: [Buildroot] [git commit] lz4: fix legal info
Message-ID: <20160302220356.46B647FB64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98f4409b4f86ef5083eadc3dcf2772fe5c40161a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It moved, and programs are GPLv2+. Fixes:
http://autobuild.buildroot.net/results/70a/70a526b265bb16a6be9f25c5044c65070706171c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lz4/lz4.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index d2b09bb..a5a41d3 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -7,8 +7,8 @@
 LZ4_VERSION = r131
 LZ4_SITE = $(call github,Cyan4973,lz4,$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
-LZ4_LICENSE = BSD-2c
-LZ4_LICENSE_FILES = LICENSE
+LZ4_LICENSE = BSD-2c (library), GPLv2+ (programs)
+LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
 
 ifeq ($(BR2_STATIC_LIBS),y)
 define LZ4_DISABLE_SHARED
