From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:10:26 +0100
Subject: [Buildroot] [PATCH 2/2] libtirpc: Fix whitespace on 4th patch
In-Reply-To: <20181117194856.29604-2-petr.vorel@gmail.com>
References: <20181117194856.29604-1-petr.vorel@gmail.com>
 <20181117194856.29604-2-petr.vorel@gmail.com>
Message-ID: <20181119221026.7a21f37b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Nov 2018 20:48:56 +0100, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Should be the same as v1.
> ---
>  ...es-needed-to-build-rpcbind-on-top-of.patch | 78 +++++++++----------
>  1 file changed, 38 insertions(+), 40 deletions(-)
> 
> diff --git a/package/libtirpc/0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch b/package/libtirpc/0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
> index 7f53ffca16..797fb7a42c 100644
> --- a/package/libtirpc/0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
> +++ b/package/libtirpc/0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
> @@ -22,16 +22,16 @@ index aa5908e..4999066 100644
>  +++ b/Makefile.am
>  @@ -2,6 +2,9 @@ SUBDIRS = src man doc rpcgen
>   ACLOCAL_AMFLAGS = -I m4
> - 
> +

These are additional changes, i.e you are removing whitespace that is
here in the original source code.

>   GENFILES	       = tirpc/rpcsvc/crypt.h \
>  +			 tirpc/rpcsvc/mount.h \
>  +			 tirpc/rpcsvc/nfs_prot.h \
>  +			 tirpc/rpcsvc/rquota.h \
>   			 tirpc/rpc/rpcb_prot.h
> - 
> +

Ditto.

>   noinst_HEADERS	       = tirpc/reentrant.h \
>  @@ -11,6 +14,9 @@ noinst_HEADERS	       = tirpc/reentrant.h \
> - 
> +

Ditto.

I.e, in the Makefile.am, our patch is not adding any more trailing
whitespace.

Then, in the .x files, those are copy/pasted from I don't remember
which project. I'm not sure how much sense it makes to fix trailing
whitespace in those patches.

Instead, it would be tremendously more useful to work with libtirpc
upstream to get all of those patches merged. I think I tried to do so a
number of years ago, but without much luck.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
