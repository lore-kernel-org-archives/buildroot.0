From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 Jan 2015 21:03:50 +0100
Subject: [Buildroot] [PATCH 1/4 v9] Makefile: improve detection of make "-s"
	flag
In-Reply-To: <cover.1420142462.git.yann.morin.1998@free.fr>
References: <cover.1420142462.git.yann.morin.1998@free.fr>
Message-ID: <3e5ffa778bc4dea304fd9897fc983c294a0c7dc9.1420142462.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Porcedda <fabio.porcedda@gmail.com>

Because it's just checking the presence of the "s" character even a
  make --warn-undefined-variables
is detected as a silent build.

Fix that by filtering out long options.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5e0b4f2..9995df7 100644
--- a/Makefile
+++ b/Makefile
@@ -304,7 +304,7 @@ GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 TARGETS :=
 
 # silent mode requested?
-QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
+QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
 
 # Strip off the annoying quoting
 ARCH := $(call qstrip,$(BR2_ARCH))
-- 
1.9.1
