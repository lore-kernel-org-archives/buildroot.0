From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 17:41:57 +0100
Subject: [Buildroot] [PATCH] make printvars: avoid invalid calls when
 arguments are missing
In-Reply-To: <20190223161108.22819-1-martin.kepplinger@ginzinger.com>
References: <20190223161108.22819-1-martin.kepplinger@ginzinger.com>
Message-ID: <20190223174157.28e41088@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
