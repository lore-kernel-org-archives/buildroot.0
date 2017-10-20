From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 19 Oct 2017 20:44:09 -0500
Subject: [Buildroot] [PATCH 1/1] setools: change sepol library directory
In-Reply-To: <20171019214603.5402-1-Adamduskett@outlook.com>
References: <20171019214603.5402-1-Adamduskett@outlook.com>
Message-ID: <CANQCQpaYnpBHenbWNBJ9BFq-tGUWBy3SZKKmpMph1vWa2vfc2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Thu, Oct 19, 2017 at 4:46 PM, Adam Duskett <aduskett@gmail.com> wrote:
> setools currently points the libsepol library directory to
> $(STAGING_DIR)/lib/ when it should be $(STAGING_DIR)/usr/lib
>
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

Beat me to this one :-)  had a test build running with the same fix.
Thanks for sending it out.

As part of the debugging I did on this one, I rechecked all the of the
destdir and prefix stuff in the libsepol install just to be sure that
lined up.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  package/setools/setools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/setools/setools.mk b/package/setools/setools.mk
> index 80d58235d3..8b93ccf45e 100644
> --- a/package/setools/setools.mk
> +++ b/package/setools/setools.mk
> @@ -24,7 +24,7 @@ endif
>  define SETOOLS_FIX_SETUP
>         # By default, setup.py will look for libsepol.a in the host machines
>         # /usr/lib directory. This needs to be changed to the staging directory.
> -       $(SED) "s at base_lib_dirs =.*@base_lib_dirs = ['$(STAGING_DIR)/lib']@g" \
> +       $(SED) "s at base_lib_dirs =.*@base_lib_dirs = ['$(STAGING_DIR)/usr/lib']@g" \
>                 $(@D)/setup.py
>  endef
>  SETOOLS_POST_PATCH_HOOKS += SETOOLS_FIX_SETUP
> --
> 2.13.6
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
