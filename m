From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Aug 2009 22:28:47 +0200
Subject: [Buildroot] [git commit master] webkit: disable the libtool patch
Message-ID: <20090824202957.93FBC775A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7df179ae005b44b6b3427b66e03e6b79c976f28d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The version of Webkit packaged in Buildroot uses libtool 2.x, for
which our package/buildroot-libtool.patch does not apply. So we
disable this patch. However, on my system, the lack of libtool
modification prevents the final linking to succeed (due to libtool
trying to link target code with host libraries). This will have to be
fixed separatly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/webkit.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 17f1318..bc7d062 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -10,6 +10,7 @@ WEBKIT_SITE = http://nightly.webkit.org/files/trunk/src/
 WEBKIT_INSTALL_STAGING = YES
 WEBKIT_INSTALL_TARGET = YES
 WEBKIT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
+WEBKIT_LIBTOOL_PATCH = NO
 
 WEBKIT_DEPENDENCIES = icu curl libxml2 libxslt libgtk2 sqlite enchant \
 			libsoup
-- 
1.6.3.3
