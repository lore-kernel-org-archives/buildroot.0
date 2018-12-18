From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Dec 2018 08:48:26 +0100
Subject: [Buildroot] [PATCH] package/netsurf: use TMP_PREFIX inside the
 build directory
In-Reply-To: <87ftuv3h31.fsf@dell.be.48ers.dk>
References: <20181217084710.16192-1-thomas.petazzoni@bootlin.com>
 <87ftuv3h31.fsf@dell.be.48ers.dk>
Message-ID: <20181218084826.1d669768@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Dec 2018 23:48:34 +0100, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:  
> 
>  > The netsurf build system creates a stamp file inside TMP_PREFIX to
>  > know if the build was done, and if the stamp file exists, it doesn't
>  > do any build. Therefore, having this stamp file in STAGING_DIR
>  > prevents from rebuilding netsurf, even after removing its entire build
>  > directory: the stamp file exists in STAGING_DIR, and netsurf doesn't
>  > build anything, causing the installation to fail.  
> 
>  > We fix this by putting this temporary directory inside the netsurf
>  > build directory.  
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  > ---
>  >  package/netsurf/netsurf.mk | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)  
> 
>  > diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
>  > index e5a251b9c1..e4ed4fd1a7 100644
>  > --- a/package/netsurf/netsurf.mk
>  > +++ b/package/netsurf/netsurf.mk
>  > @@ -78,7 +78,7 @@ NETSURF_MAKE_OPTS = \
>  >  	BUILD_CC="$(HOSTCC)" \
>  >  	CC="$(TARGET_CC)" \
>  >  	AR="$(TARGET_AR)" \
>  > -	TMP_PREFIX=$(STAGING_DIR)/usr \
>  > +	TMP_PREFIX=$(@D)/tmpusr \  
> 
> Why do we have to set it at all? It looks like it defaults to a
> directory under the build dir as well?

Indeed, it does. So it's obviously simpler to drop it. I'll respin the
patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
