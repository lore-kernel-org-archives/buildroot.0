From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Thu, 20 Aug 2020 12:30:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/elixir: fix host-erlang dependency
Message-ID: <20200820103034.11094-1-frank.vanbever@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make it explicit that host-elixir depends on host-erlang. This fixes the
build in cases where BR2_PER_PACKAGE_DIRECTORIES is set.

Fixes:
- http://autobuild.buildroot.net/results/a3a37eb724ca5689f8e83c9b2af04d07afa80315/

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
---
 package/elixir/elixir.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/elixir/elixir.mk b/package/elixir/elixir.mk
index 7a545d43b0..6d935516f4 100644
--- a/package/elixir/elixir.mk
+++ b/package/elixir/elixir.mk
@@ -8,7 +8,7 @@ ELIXIR_VERSION = 1.9.4
 ELIXIR_SITE = $(call github,elixir-lang,elixir,v$(ELIXIR_VERSION))
 ELIXIR_LICENSE = Apache-2.0
 ELIXIR_LICENSE_FILES = LICENSE
-ELIXIR_DEPENDENCIES = host-erlang
+HOST_ELIXIR_DEPENDENCIES = host-erlang
 
 define HOST_ELIXIR_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) compile
-- 
2.20.1
