From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 07 Sep 2014 07:15:10 +0200
Subject: [Buildroot] [PATCH] docs/manual: fix call to a2x
In-Reply-To: <1410046878-22428-1-git-send-email-yann.morin.1998@free.fr>
References: <1410046878-22428-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <757f6e8c-1ec8-4a9d-ab02-48a54c6f3a19@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>While investigating an asciidoc issue in another project, I've
>benn told on the asciidoc mailing list that options should come
>before the input file:
>    https://groups.google.com/d/msg/asciidoc/cs8-ihIKYXo/pdt-xjeHr8oJ
>
>So be it. ;-)
>
>Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>---
> docs/manual/manual.mk | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
>index 8d401a2..9486bc6 100644
>--- a/docs/manual/manual.mk
>+++ b/docs/manual/manual.mk
>@@ -70,8 +70,8 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
> 	$$(Q)mkdir -p $$(@D)/.build
> 	$$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
> 	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
>-	        -D $$(@D) $$(@D)/.build/$(1).txt \
>-	        --asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)"
>+	        -D $$(@D) --asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)" \
>+	        $$(@D)/.build/$(1).txt
> 	-$$(Q)rm -rf $$(@D)/.build
> endef
> 

I believe this is also fixed in Samuel's pending gendoc patches.

Best regards,
Thomas
