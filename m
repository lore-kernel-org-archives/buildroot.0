From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  1 Mar 2014 20:59:08 +0100
Subject: [Buildroot] [PATCH v5 1/4] bustle: use TARGET_MAKE_ENV instead of
	setting PATH in the make environment
In-Reply-To: <1393703951-7059-1-git-send-email-s.martin49@gmail.com>
References: <1393703951-7059-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1393703951-7059-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TARGET_MAKE_ENV already contains the PATH definition among other useful
variables.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
changes v4 -> v5:
- rebase
- add Acked-by tag

changes v3 -> v4:
- add this change to the series (ThomasP)
---
 package/bustle/bustle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 2330c08..7bc3e97 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -11,7 +11,7 @@ BUSTLE_LICENSE_FILES = LICENSE
 BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
 
 define BUSTLE_BUILD_CMDS
-	PATH=$(TARGET_PATH) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		PCAP_FLAGS='-lpcap' -C $(@D) dist/build/bustle-pcap
 endef
 
-- 
1.9.0
