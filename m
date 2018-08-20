From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 17:14:09 +0200
Subject: [Buildroot] [git commit] package/mender: set version in go linker
Message-ID: <20180820150820.793A48DF52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff2c8883fbbed2708bab2f00c1373859381eb495
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is used when calling the mender client with the
-version option and it says "unknown" if not set in
linker.

Now it displays the following:

    # mender -version
    1.4.0
    runtime: go1.10.2

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/mender.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 53c39c6f7a..9275426a7b 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -32,6 +32,8 @@ MENDER_LICENSE_FILES = \
 	vendor/github.com/ungerik/go-sysfs/LICENSE \
 	vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
+MENDER_LDFLAGS = -X main.Version=$(MENDER_VERSION)
+
 define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
 	echo -n "2" > $(TARGET_DIR)/etc/mender/scripts/version
