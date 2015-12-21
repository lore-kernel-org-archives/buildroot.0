From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 16:56:59 +0100
Subject: [Buildroot] [PATCH 8/8 RFC] package/libhid: no need for custom PATH
In-Reply-To: <cover.1450712392.git.yann.morin.1998@free.fr>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
Message-ID: <5927b9370935b82aedcdcade5cdd5d9c280528d5.1450712392.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we have all the target foo-config scripts early in the PATH, we
no longer need a cutom PATH.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/libhid/libhid.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 92a3049..3c65814 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -11,9 +11,7 @@ LIBHID_INSTALL_STAGING = YES
 LIBHID_AUTORECONF = YES
 LIBHID_LICENSE = GPLv2
 LIBHID_LICENSE_FILES = COPYING
-# configure runs libusb-config for cflags/ldflags. Ensure it picks up
-# the target version
-LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(TARGET_PATH)
+
 LIBHID_CONF_OPTS = \
 	--disable-swig \
 	--disable-werror \
-- 
1.9.1
