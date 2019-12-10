From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 22:59:46 +0100
Subject: [Buildroot] [PATCH 07/12] package/cargo: add missing extract
 dependencies
In-Reply-To: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191210215952.902477-8-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cargo uses suitable-extractor to manually extract a tarball, so it
should have the appropriate package dependencies added to
<pkg>_EXTRACT_DEPENDENCIES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cargo/cargo.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
index a387281b4c..adb7bc282e 100644
--- a/package/cargo/cargo.mk
+++ b/package/cargo/cargo.mk
@@ -42,6 +42,7 @@ define HOST_CARGO_EXTRACT_DEPS
 endef
 
 HOST_CARGO_POST_EXTRACT_HOOKS += HOST_CARGO_EXTRACT_DEPS
+HOST_CARGO_EXTRACT_DEPENDENCIES += $(call extractor-pkg-dependency,$(CARGO_DEPS_SOURCE))
 
 define HOST_CARGO_EXTRACT_INSTALLER
 	@mkdir -p $(@D)/src/rust-installer
@@ -51,6 +52,7 @@ define HOST_CARGO_EXTRACT_INSTALLER
 endef
 
 HOST_CARGO_POST_EXTRACT_HOOKS += HOST_CARGO_EXTRACT_INSTALLER
+HOST_CARGO_EXTRACT_DEPENDENCIES += $(call extractor-pkg-dependency,$(CARGO_INSTALLER_SOURCE))
 
 define HOST_CARGO_SETUP_DEPS
 	mkdir -p $(@D)/.cargo
-- 
2.23.0
