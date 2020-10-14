From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 21:14:27 +0200
Subject: [Buildroot] [git commit] package/pkg-waf.mk: allow for override of
 <pkg>_WAF directive
Message-ID: <20201014190349.6FD808E306@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d49f2846b0821d10bbafa7e4a71a17e56a1bbf73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages have their own waf copy, but not located at the
top-level directory. In order to support those packages, we allow
packages to override the default <pkg>_WAF location.

Signed-off-by: David GOUARIN <dgouarin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-waf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index 35e56d3c13..038d89454e 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -46,7 +46,7 @@ ifeq ($$($(2)_NEEDS_EXTERNAL_WAF),YES)
 $(2)_DEPENDENCIES += host-waf
 $(2)_WAF = $$(HOST_DIR)/bin/waf
 else
-$(2)_WAF = ./waf
+$(2)_WAF ?= ./waf
 endif
 
 $(2)_BUILD_OPTS				?=
