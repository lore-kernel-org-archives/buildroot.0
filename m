From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 19 Oct 2016 23:11:56 +0530
Subject: [Buildroot] [PATCH 3/3] usbredir: improve license description
In-Reply-To: <1476898916-7434-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1476898916-7434-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1476898916-7434-3-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For consistency use 'libraries' and 'program' as component names and
adjust license string for readability when we conditionally specify
license for server program.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/usbredir/usbredir.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 926a1ff..6765a9b 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -7,14 +7,14 @@
 USBREDIR_VERSION = 0.7.1
 USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.bz2
 USBREDIR_SITE = http://spice-space.org/download/usbredir
-USBREDIR_LICENSE = LGPLv2.1+
+USBREDIR_LICENSE = LGPLv2.1+ (libraries)
 USBREDIR_LICENSE_FILES = COPYING.LIB
 USBREDIR_INSTALL_STAGING = YES
 USBREDIR_DEPENDENCIES = host-pkgconf libusb
 
 ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
 
-USBREDIR_LICENSE += (for the library), GPLv2+ (for the server)
+USBREDIR_LICENSE := $(USBREDIR_LICENSE), GPLv2+ (program)
 USBREDIR_LICENSE_FILES += COPYING
 
 else # BR2_PACKAGE_USBREDIR_SERVER != y
-- 
2.6.2
