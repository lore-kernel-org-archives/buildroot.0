From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 22:29:17 +0200
Subject: [Buildroot] [git commit] package/mender/mender.mk: fix linker
 version argument
Message-ID: <20210330200845.329268B350@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5f7fa88381e3a4aa0e6c1e567dd5f164de176ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current linker flag "-X main.Version=$(MENDER_VERSION)" no longer points
to the correct location, which results in "version: unknown" when runnning
"mender -version." Update the linker flag to point to the correct location.

Signed-off-by: Adam Duskett <Aduskett@rivian.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
