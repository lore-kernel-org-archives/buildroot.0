From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 18:04:27 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/mender/mender.mk:
 fix linker version argument
Message-ID: <20210403154209.D85588A30D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9262d6a01cb81df8068662cbfaeae5e277e0a450
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The current linker flag "-X main.Version=$(MENDER_VERSION)" no longer points
to the correct location, which results in "version: unknown" when runnning
"mender -version." Update the linker flag to point to the correct location.

Signed-off-by: Adam Duskett <Aduskett@rivian.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b5f7fa88381e3a4aa0e6c1e567dd5f164de176ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/mender.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 1807ccfee0..0224e84a47 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -35,7 +35,7 @@ MENDER_LICENSE_FILES = \
 
 MENDER_DEPENDENCIES = xz
 
-MENDER_LDFLAGS = -X main.Version=$(MENDER_VERSION)
+MENDER_LDFLAGS = -X github.com/mendersoftware/mender/conf.Version=$(MENDER_VERSION)
 
 MENDER_UPDATE_MODULES_FILES = \
 	directory \
