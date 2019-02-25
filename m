From: Kepplinger Martin <Martin.Kepplinger@ginzinger.com>
Date: Mon, 25 Feb 2019 07:09:12 +0000
Subject: [Buildroot] [PATCH] make printvars: avoid invalid calls when
 arguments are missing
In-Reply-To: <20190223174157.28e41088@windsurf.home>
References: <20190223161108.22819-1-martin.kepplinger@ginzinger.com>,
 <20190223174157.28e41088@windsurf.home>
Message-ID: <468427c5e6854794aa8a97373bfdaf30@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(sorry for the horrible email format)

my patch does not break the build. In fact, it *adds* host-tar to my build (for the first time
ever it seems because it just downloaded).

My impression is that what's *below* the $(1) expression in support/dependencies/dependencies.mk
didn't get defined... (host-tar).

I've built successfully. Still, the kind of change doesn't look very beautiful.

Maybe there someone who sees the mistake at first sight :)

thanks

                                   martin



Martin Kepplinger | Entwicklung Software

GINZINGER ELECTRONIC SYSTEMS GMBH

Tel.: +43 7723 5422 157
Mail: martin.kepplinger at ginzinger.com
Web: www.ginzinger.com




________________________________________
Von: Thomas Petazzoni [thomas.petazzoni at bootlin.com]
Gesendet: Samstag, 23. Februar 2019 17:41
An: Kepplinger Martin
Cc: buildroot at buildroot.org
Betreff: Re: [Buildroot] [PATCH] make printvars: avoid invalid calls when arguments are missing

Hello Martin,

On Sat, 23 Feb 2019 17:11:08 +0100
Martin Kepplinger <martin.kepplinger@ginzinger.com> wrote:

> diff --git a/package/Makefile.in b/package/Makefile.in
> index dc818a2c18..f4f3864e8d 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -232,6 +232,7 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
>  # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
>  # Exit code chooses option. "$$TMP" is can be used as temporary file and
>  # is automatically cleaned up.
> +ifneq ($(1),)

$(1) only makes sense inside the macro itself. Outside the macro $(1)
does not make sense at all, and will always be empty I believe. Are you
sure your patch is working, and does not break the build ?

Indeed, I believe the two macros you enclose in ifneq tests will in
fact no longer be defined.

Thomas
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



________________________________________

Ginzinger electronic systems GmbH
Gewerbegebiet Pirath 16
4952 Weng im Innkreis
www.ginzinger.com

Firmenbuchnummer: FN 364958d
Firmenbuchgericht: Ried im Innkreis
UID-Nr.: ATU66521089


Diese Nachricht ist vertraulich und darf nicht an andere Personen weitergegeben oder von diesen verwendet werden. Verst?ndigen Sie uns, wenn Sie irrt?mlich eine Mitteilung empfangen haben.

This message is confidential. It may not be disclosed to, or used by, anyone other than the addressee. If you receive this message by mistake, please advise the sender.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3616 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190225/762a5ca4/attachment.bin>
