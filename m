From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:53:48 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/elixir: fix
 host-erlang dependency
Message-ID: <20200828164650.A85DC865E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61b25934d8a1d67cfccc22be73c640b837db5399
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

There is no target elixir package, so setting a value to
ELIXIR_DEPENDENCIES has no effect, HOST_ELIXIR_DEPENDENCIES must be
used instead.

Fixes:

  http://autobuild.buildroot.net/results/a3a37eb724ca5689f8e83c9b2af04d07afa80315/

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d059946df0ed896872dcb83cf49635c374e2c203)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
