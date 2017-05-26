From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 26 May 2017 10:23:09 -0500
Subject: [Buildroot] [PATCH next 1/2] lvm2: add host package
In-Reply-To: <20170522134015.54040-1-Vincent.Riera@imgtec.com>
References: <20170522134015.54040-1-Vincent.Riera@imgtec.com>
Message-ID: <CANQCQpZLdG+f+eGW=ke5YgsW88fWK61dvCGMHw__O7gaPuMNBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincente,

On Mon, May 22, 2017 at 8:40 AM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/lvm2/lvm2.mk | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> index 9a422feda..6cb351c47 100644
> --- a/package/lvm2/lvm2.mk
> +++ b/package/lvm2/lvm2.mk
> @@ -47,4 +47,7 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
>  LVM2_CONF_ENV += ac_cv_flag_HAVE_PIE=no
>  endif
>
> +HOST_LVM2_INSTALL_OPTS = DESTDIR=$(HOST_DIR) install
> +
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> --
> 2.13.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
