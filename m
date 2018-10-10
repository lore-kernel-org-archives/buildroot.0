From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 10 Oct 2018 16:33:08 -0500
Subject: [Buildroot] [PATCH 1/2] libselinux: remove library host symlink
In-Reply-To: <20181010212417.23047-1-fontaine.fabrice@gmail.com>
References: <20181010212417.23047-1-fontaine.fabrice@gmail.com>
Message-ID: <CANQCQpaAukgHG=z6pC3X9_YMO0Odjr8q2K=Ph2N-eRKJCgC98w@mail.gmail.com>
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
> ln -sf libselinux.so.1 $(HOST_DIR)/lib/libselinux.so
> is not needed anymore so remove it
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Good catch

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  package/libselinux/libselinux.mk | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index b3d48f7105..97b4f03062 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -102,7 +102,6 @@ endef
>  define HOST_LIBSELINUX_INSTALL_CMDS
>         $(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
>                 $(HOST_LIBSELINUX_MAKE_OPTS) install
> -       ln -sf libselinux.so.1 $(HOST_DIR)/lib/libselinux.so
>         # Install python interface wrapper
>         $(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
>                 $(HOST_LIBSELINUX_MAKE_OPTS) install-pywrap
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
