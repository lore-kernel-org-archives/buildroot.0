From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 23:48:13 +0200
Subject: [Buildroot] [PATCH 4/4] Include a local.mk for package overrides
In-Reply-To: <cover.1305755245.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305755245.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c334d1f60141b01665207c49a13c56db223d49d2.1305755245.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The user can now create a local.mk file at the top of the Buildroot
source tree to override the source directory for various packages.

We could probably turn this into a configuration option, so that a
different override file can be used for different projects using the
same Buildroot source tree.

An example local.mk file:

 ZLIB_OVERRIDE_SRCDIR = /tmp/zlib

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 5f61b93..07a51d8 100644
--- a/Makefile
+++ b/Makefile
@@ -318,6 +318,7 @@ else ifeq ($(BR2_TOOLCHAIN_CTNG),y)
 include toolchain/toolchain-crosstool-ng.mk
 endif
 
+-include local.mk
 include package/*/*.mk
 
 include boot/common.mk
-- 
1.7.1
