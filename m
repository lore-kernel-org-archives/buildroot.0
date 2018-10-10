From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 10 Oct 2018 16:34:32 -0500
Subject: [Buildroot] [PATCH 2/2] libsepol: remove library host symlink
In-Reply-To: <20181010212417.23047-2-fontaine.fabrice@gmail.com>
References: <20181010212417.23047-1-fontaine.fabrice@gmail.com>
 <20181010212417.23047-2-fontaine.fabrice@gmail.com>
Message-ID: <CANQCQpasYma9jZ5BjvwYUZwKRm9ZBKo++GO6_JCOZFAstrMNyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice,

On Wed, Oct 10, 2018 at 4:24 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Since bump to version 2.7 and addition of
> 0003-revert-ln-relative.patch, the creation of a symlink through
> ln -sf libsepol.so.1 $(HOST_DIR)/lib/libsepol.so
> is not needed anymore so remove it
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Sorry long day, shouldn't have sent that signed off.

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  package/libsepol/libsepol.mk | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
> index 5932ca1464..a9a9c652ea 100644
> --- a/package/libsepol/libsepol.mk
> +++ b/package/libsepol/libsepol.mk
> @@ -41,7 +41,6 @@ endef
>
>  define HOST_LIBSEPOL_INSTALL_CMDS
>         $(HOST_LIBSEPOL_MAKE_ENV) $(MAKE) -C $(@D) install $(HOST_CONFIGURE_OPTS)
> -       ln -sf libsepol.so.1 $(HOST_DIR)/lib/libsepol.so
>  endef
>
>  $(eval $(generic-package))
> --
> 2.17.1
>


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
