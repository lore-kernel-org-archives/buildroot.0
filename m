From: Maxime Ripard <ripard@archos.com>
Date: Tue, 12 Oct 2010 10:26:56 +0200
Subject: [Buildroot] [PATCH 4/4] python: Fix make install (Workaround
	python's bug #1669349)
In-Reply-To: <1286872016-12621-1-git-send-email-ripard@archos.com>
References: <1286872016-12621-1-git-send-email-ripard@archos.com>
Message-ID: <1286872016-12621-5-git-send-email-ripard@archos.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Maxime Ripard <ripard@archos.com>
---
 package/python/python.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 5c85c59..2525adf 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -128,7 +128,7 @@ ifneq ($(BR2_PACKAGE_PYTHON_SSL),y)
 endif
 	rm -rf $(PYTHON_DIR)/Lib/test
 	LD_LIBRARY_PATH=$(STAGING_DIR)/lib
-	$(MAKE) CC="$(TARGET_CC)" -C $(PYTHON_DIR) install \
+	$(MAKE) CC="$(TARGET_CC)" -C $(PYTHON_DIR) -i install \
 		DESTDIR=$(TARGET_DIR) CROSS_COMPILE=yes \
 		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
 		PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
-- 
1.7.1


____________________________________________________________________________

This  email  and any  files  transmitted  with it are  confidential  and are
intended solely  for the use of the individual  or entity to which  they are
addressed.  Access to this e-mail by anyone else is unauthorised. If you are
not the  intended recipient,  any disclosure,  copying,  distribution or any
action taken or omitted to be taken in reliance on it, is prohibited. E-mail
messages are not necessarily secure.  Archos does not accept  responsibility
for any changes made to this message after it was sent.
