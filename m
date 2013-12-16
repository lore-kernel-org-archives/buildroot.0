From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2013 16:53:59 +0100
Subject: [Buildroot] [git commit] knock: really fix github macro arguments
Message-ID: <20131216155503.E11719C0B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=906ab08f946936a58dc36efd878ea45ea453df69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Somehow I ended up dropping the package name when I fixed the version,
breaking download.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/knock/knock.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index cad7516..5ed6cf0 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 KNOCK_VERSION = 7666f2e86e18d482eaad5fe1fea46d87d80b0555
-KNOCK_SITE = $(call github,jvinet,$(KNOCK_VERSION))
+KNOCK_SITE = $(call github,jvinet,knock,$(KNOCK_VERSION))
 KNOCK_LICENSE = GPLv2+
 KNOCK_LICENSE_FILES = COPYING
 KNOCK_AUTORECONF = YES
