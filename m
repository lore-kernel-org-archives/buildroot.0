From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 13:50:50 +0100
Subject: [Buildroot] [git commit] package/openjdk: use AArch64 optimizations
Message-ID: <20190317124803.EB9EA8D3D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3641d98ec422607592a452b9e076bf34be1f98b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openjdk/openjdk.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 2730d014d8..cf98dd73e1 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -85,6 +85,11 @@ OPENJDK_CONF_OPTS = \
 	--with-version-build="$(OPENJDK_VERSION_MAJOR)" \
 	--with-version-string="$(OPENJDK_VERSION_MAJOR)"
 
+# If building for AArch64, use the provided CPU port.
+ifeq ($(BR2_aarch64),y)
+OPENJDK_CONF_OPTS += --with-cpu-port=aarch64 --with-abi-profile=aarch64
+endif
+
 ifeq ($(BR2_CCACHE),y)
 OPENJDK_CONF_OPTS += \
 	--enable-ccache \
