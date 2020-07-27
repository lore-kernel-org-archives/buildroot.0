From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 13:30:59 +0200
Subject: [Buildroot] [git commit] package/rust: build and install cargo
Message-ID: <20200727112613.1932F813E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=914b99cf030a55b2dfeada832a65ee616bfbae6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cargo source code is not provided anymore as a separate tarball but is
now built along with the Rust compiler. So update rust host variant to
build Cargo.

For now, all this will be overwritten again by the host-cargo package,
but this package will be removed in later commits.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
Tested-by: Sam Voss <sam.voss@rockwellcollins.com>
[Arnout: merge all install commands in HOST_RUST_INSTALL_CMDS]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: David Pierret <david.pierret@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust/rust.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 25153966f2..6bee04b3b9 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -54,11 +54,14 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'python = "$(HOST_DIR)/bin/python$(HOST_RUST_PYTHON_VERSION)"'; \
 		echo 'submodules = false'; \
 		echo 'vendor = true'; \
+		echo 'extended = true'; \
+		echo 'tools = ["cargo"]'; \
 		echo 'compiler-docs = false'; \
 		echo 'docs = false'; \
 		echo 'verbose = $(HOST_RUST_VERBOSITY)'; \
 		echo '[install]'; \
 		echo 'prefix = "$(HOST_DIR)"'; \
+		echo 'sysconfdir = "$(HOST_DIR)/etc"'; \
 		echo '[rust]'; \
 		echo 'channel = "stable"'; \
 		echo '[target.$(RUSTC_TARGET_NAME)]'; \
