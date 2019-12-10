From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 22:59:49 +0100
Subject: [Buildroot] [PATCH 10/12]
 package/nvidia-tegra23/nvidia-tegra32-binaries: add missing extract
 dependencies
In-Reply-To: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191210215952.902477-11-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nvidia-tegra23-binaries uses suitable-extractor to manually extract a
tarball, so it should have the appropriate package dependencies added
to <pkg>_EXTRACT_DEPENDENCIES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
index 9b153b0250..1785856847 100644
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
@@ -44,6 +44,7 @@ define NVIDIA_TEGRA23_BINARIES_EXTRACT_FURTHER
 	$(TAR) --strip-components=0 -C $(@D)/nv_tegra/nv_sample_apps/nvgstapps/ $(TAR_OPTIONS) -
 endef
 NVIDIA_TEGRA23_BINARIES_POST_EXTRACT_HOOKS += NVIDIA_TEGRA23_BINARIES_EXTRACT_FURTHER
+NVIDIA_TEGRA23_BINARIES_EXTRACT_DEPENDENCIES += $(call extractor-pkg-dependency,nvidia_drivers.tbz2)
 
 define NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS
 	mkdir -p $(1)/usr/lib
-- 
2.23.0
