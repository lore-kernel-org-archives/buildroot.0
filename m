From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Sep 2014 11:24:21 +0200
Subject: [Buildroot] [PATCH] docs/manual: fix call to a2x
In-Reply-To: <757f6e8c-1ec8-4a9d-ab02-48a54c6f3a19@email.android.com>
References: <1410046878-22428-1-git-send-email-yann.morin.1998@free.fr>
 <757f6e8c-1ec8-4a9d-ab02-48a54c6f3a19@email.android.com>
Message-ID: <20140907092421.GB31418@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-07 07:15 +0200, Thomas De Schampheleire spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
> >While investigating an asciidoc issue in another project, I've
> >benn told on the asciidoc mailing list that options should come
> >before the input file:
> >    https://groups.google.com/d/msg/asciidoc/cs8-ihIKYXo/pdt-xjeHr8oJ
> >
> >So be it. ;-)
> >
> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >---
> > docs/manual/manual.mk | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> >index 8d401a2..9486bc6 100644
> >--- a/docs/manual/manual.mk
> >+++ b/docs/manual/manual.mk
> >@@ -70,8 +70,8 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
> > 	$$(Q)mkdir -p $$(@D)/.build
> > 	$$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
> > 	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
> >-	        -D $$(@D) $$(@D)/.build/$(1).txt \
> >-	        --asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)"
> >+	        -D $$(@D) --asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)" \
> >+	        $$(@D)/.build/$(1).txt
> > 	-$$(Q)rm -rf $$(@D)/.build
> > endef
> > 
> 
> I believe this is also fixed in Samuel's pending gendoc patches.

Indeed.

I have to admit I lost track on which gendoc series is still pending,
given the amount of work you and Samuel have put into it (Thanks!)

I'll review that series in a moment.

In the meantime, I'll update the status of this patch in Patchwork.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
