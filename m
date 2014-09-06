From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Sep 2014 01:41:18 +0200
Subject: [Buildroot] [PATCH] docs/manual: fix call to a2x
Message-ID: <1410046878-22428-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While investigating an asciidoc issue in another project, I've
benn told on the asciidoc mailing list that options should come
before the input file:
    https://groups.google.com/d/msg/asciidoc/cs8-ihIKYXo/pdt-xjeHr8oJ

So be it. ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/manual.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 8d401a2..9486bc6 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -70,8 +70,8 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 	$$(Q)mkdir -p $$(@D)/.build
 	$$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
 	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
-	        -D $$(@D) $$(@D)/.build/$(1).txt \
-	        --asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)"
+	        -D $$(@D) --asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)" \
+	        $$(@D)/.build/$(1).txt
 	-$$(Q)rm -rf $$(@D)/.build
 endef
 
-- 
1.9.1
