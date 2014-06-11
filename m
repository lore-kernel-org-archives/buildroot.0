From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Wed, 11 Jun 2014 17:54:21 +0200
Subject: [Buildroot] [PATCH v3 1/1] ti-gfx: bump to version 5_01_01_01
 if EABIhf is used
In-Reply-To: <87oaxzitw2.fsf@dell.be.48ers.dk>
References: <1402437038-28396-1-git-send-email-hadrien.boutteville@gmail.com>
 <87oaxzitw2.fsf@dell.be.48ers.dk>
Message-ID: <53987BAD.6070302@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Wed, 11 Jun 2014 13:10:37 +0200, Peter Korsgaard wrote:
>>>>>> "Hadrien" == Hadrien Boutteville <hadrien.boutteville@gmail.com> writes:
> 
>  > SDK 5_01_01_01 only support EABIhf so 5_01_00_01 is still used if
>  > EABIhf is not available.
> 
>  > Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
>  > ---
>  > Changes v2 -> v3:
>  >   - comment was not clear (Thomas)
> 
>  > Changes v1 -> v2:
>  >   - bump to 5_01_01_01 only if EABIhf is used as we still need to
>  >     support softfp (Yann)
>  > ---
>  >  package/ti-gfx/ti-gfx.mk | 8 +++++---
>  >  1 file changed, 5 insertions(+), 3 deletions(-)
> 
>  > diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
>  > index 324e19c..4e83f1e 100644
>  > --- a/package/ti-gfx/ti-gfx.mk
>  > +++ b/package/ti-gfx/ti-gfx.mk
>  > @@ -4,15 +4,17 @@
>  >  #
>  >  ################################################################################
>  
>  > -TI_GFX_VERSION = 5_01_00_01
>  > -TI_GFX_SO_VERSION = 1.10.2359475
>  > -
>  > +# SDK 5_01_01_01 only support EABIhf so we downgrade to 5_01_00_01 if EABIhf is
>  > +# not available.
>  >  ifeq ($(BR2_ARM_EABIHF),y)
>  > +TI_GFX_VERSION = 5_01_01_01
>  >  TI_GFX_SOURCE = Graphics_SDK_setuplinux_hardfp_$(TI_GFX_VERSION).bin
>  >  else
>  > +TI_GFX_VERSION = 5_01_00_01
>  >  TI_GFX_SOURCE = Graphics_SDK_setuplinux_softfp_$(TI_GFX_VERSION).bin
>  >  endif
>  
>  > +TI_GFX_SO_VERSION = 1.10.2359475
> 
> So it uses the same soname for the two releases? Yes, apparently.

Yes. You can find the soname's references in the README.txt and all
gfx_*_es*.x/install.sh in the SDK' sources.

> Committed, thanks.
> 

Thanks,

Hadrien
