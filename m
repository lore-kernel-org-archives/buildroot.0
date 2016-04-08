From: Matthew Weber <matt@thewebers.ws>
Date: Thu, 7 Apr 2016 22:13:46 -0500
Subject: [Buildroot] [ PATCH Selinux v11] skeleton: busybox individual
 apps no symlink
In-Reply-To: <1458128840-15190-1-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1458128840-15190-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <CAFt09wN8xa5yfLDgU_x5jhWpsu1FgVrxZM7E1Q-hqA0temeaMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Niranjan,

On Wed, Mar 16, 2016 at 6:47 AM, Niranjan Reddy
<niranjan.reddy@rockwellcollins.com> wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
>
> Ignore the creation of a symlink when individual binaries are
> used.
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/skeleton/skeleton.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index 7618835..dacda15 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -201,10 +201,12 @@ define SKELETON_SYSTEM_BIN_SH
>         rm -f $(TARGET_DIR)/bin/sh
>  endef
>  else

Add a comment here that notes "Allow a busybox shell binary to remain
and not get replaced by a symlink if individual binaries are enabled."

> +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),)
>  define SKELETON_SYSTEM_BIN_SH
>         ln -sf $(SKELETON_TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
>  endef
>  endif
> +endif
>  TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_BIN_SH
>
>  ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
> --
> 2.5.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Thanks,
Matt
