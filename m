From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 15:09:11 +0200
Subject: [Buildroot] [[PATCH v2 11/14] package/mender: set version in go
 linker
In-Reply-To: <20180820130914.22377-1-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
Message-ID: <20180820130914.22377-12-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is used when calling the mender client with the
-version option and it says "unknown" if not set in
linker.

Now it displays the following:

    # mender -version
    1.4.0
    runtime: go1.10.2

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---

Changes in V2:
- None

 package/mender/mender.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index fafb0d923a..7e6f18f523 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -32,6 +32,8 @@ MENDER_LICENSE_FILES = \
 	vendor/github.com/ungerik/go-sysfs/LICENSE \
 	vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md

+MENDER_LDFLAGS = -X main.Version=$(MENDER_VERSION)
+
 define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/mender
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/uboot
--
2.11.0
