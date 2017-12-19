From: Mario Lang <mlang@blind.guru>
Date: Tue, 19 Dec 2017 22:14:31 +0100
Subject: [Buildroot] [PATCH] package/brltty: disable X11 support for now
Message-ID: <20171219211431.22974-1-mlang@blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This stops xbrlapi from building/installing, which is really not essential
to almost all users.

Fixes:
  http://autobuild.buildroot.net/results/3fe2d053dcfdf5af791e9127f3e9f1dceaabfdc0
  http://autobuild.buildroot.net/results/6cfa5e9d37ac1571dc58df538232bb9e1749e62a
Signed-off-by: Mario Lang <mlang@blind.guru>
---
 package/brltty/brltty.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 7214f10fa0..9621d4f9c1 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -19,6 +19,7 @@ BRLTTY_CONF_OPTS = \
 	--disable-ocaml-bindings \
 	--disable-python-bindings \
 	--disable-tcl-bindings \
+	--disable-x \
 	--without-midi-package \
 	--without-mikropuhe --without-speechd --without-swift \
 	--without-theta --without-viavoice
-- 
2.15.0
