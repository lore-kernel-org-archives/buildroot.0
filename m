From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:16:46 +0100
Subject: [Buildroot] [git commit] Revert "packages infra: add function to
	get a Kconfig option"
Message-ID: <20140304181827.55AD690409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=371327f7b6a7be641ecb109bb0f42d5d9550382b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit c28a28eed1943c1efb958448a87a2e8f0baf48d6. The
whole host-lzop optional dependency logic cannot work, since the
configuration file will only be known after the kernel sources are
extracted, if an internal kernel defconfig is used, which is quite
common.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-utils.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 99fefe6..91a1981 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -52,8 +52,6 @@ define KCONFIG_DISABLE_OPT
 	echo "# $(1) is not set" >> $(2)
 endef
 
-KCONFIG_GET_OPT = $(shell sed -e 's/^$(1)=//p' $(2))
-
 # Helper functions to determine the name of a package and its
 # directory from its makefile directory, using the $(MAKEFILE_LIST)
 # variable provided by make. This is used by the *TARGETS macros to
