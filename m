From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Nov 2011 20:14:40 +0100
Subject: [Buildroot] [git commit] uclibc: rename uclibc-update to
	uclibc-update-config
Message-ID: <20111111191542.804D68F4D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2af8cace6f82db28f4c4cdd28289d70515da9aa8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original name uclibc-update is confusing as it only updates a
configuration file.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uclibc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 0fc5a81..6335e6a 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -500,7 +500,7 @@ uclibc-config: $(UCLIBC_DIR)/.config
 
 uclibc-oldconfig: $(UCLIBC_DIR)/.oldconfig
 
-uclibc-update: uclibc-config
+uclibc-update-config: uclibc-config
 	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
 
 uclibc-configured: gcc_initial kernel-headers $(UCLIBC_DIR)/.configured
