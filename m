From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 20 Mar 2021 15:28:33 -0700
Subject: [Buildroot] [PATCH 2/4] package/mender/mender.mk: fix linker
 version argument
In-Reply-To: <20210320222835.3951325-1-aduskett@gmail.com>
References: <20210320222835.3951325-1-aduskett@gmail.com>
Message-ID: <20210320222835.3951325-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@rivian.com>

The current linker flag "-X main.Version=$(MENDER_VERSION)" no longer points
to the correct location, which results in "version: unknown" when runnning
"mender -version." Update the linker flag to point to the correct location.

Signed-off-by: Adam Duskett <Aduskett@rivian.com>
---
 package/mender/mender.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 3e82f556fb..16d7178a6b 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -37,7 +37,7 @@ MENDER_LICENSE_FILES = \
 
 MENDER_DEPENDENCIES = openssl xz
 
-MENDER_LDFLAGS = -X main.Version=$(MENDER_VERSION)
+MENDER_LDFLAGS = -X github.com/mendersoftware/mender/conf.Version=$(MENDER_VERSION)
 
 MENDER_UPDATE_MODULES_FILES = \
 	directory \
-- 
2.25.1
