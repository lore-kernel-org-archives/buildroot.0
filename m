From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 27 Sep 2011 21:21:11 +0200
Subject: [Buildroot] [PATCH 3 of 3] uclibc: rename uclibc-update to
	uclibc-update-config
In-Reply-To: <patchbomb.1317151268@localhost6.localdomain6>
References: <patchbomb.1317151268@localhost6.localdomain6>
Message-ID: <a164f8ac3c32fb24936b.1317151271@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original name uclibc-update is confusing as it only updates a
configuration file.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 toolchain/uClibc/uclibc.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -500,7 +500,7 @@
 
 uclibc-oldconfig: $(UCLIBC_DIR)/.oldconfig
 
-uclibc-update: uclibc-config
+uclibc-update-config: uclibc-config
 	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
 
 uclibc-configured: gcc_initial kernel-headers $(UCLIBC_DIR)/.configured
