From: Luca Ceresoli <list@lucaceresoli.net>
Date: Sun, 02 Oct 2011 22:29:37 +0200
Subject: [Buildroot] [PATCH 4/6] libusb-compat: add host variant
In-Reply-To: <01596349e2ee119699af5a011d79ad1d2bb7eb55.1317481137.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
 <01596349e2ee119699af5a011d79ad1d2bb7eb55.1317481137.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4E88C9B1.1040506@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
>   package/libusb-compat/libusb-compat.mk |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
> index e39cdd8..99e7716 100644
> --- a/package/libusb-compat/libusb-compat.mk
> +++ b/package/libusb-compat/libusb-compat.mk
> @@ -18,4 +18,8 @@ endef
>
>   LIBUSB_COMPAT_POST_INSTALL_STAGING_HOOKS+=LIBUSB_COMPAT_FIXUP_CONFIG
>
> +HOST_LIBUSB_COMPAT_DEPENDENCIES = host-pkg-config host-libusb

I have a generic question about host packages, not strictly related to the
addition of the "Host tools" menu that's being discussed here.

I see many of the packages that have both target and host variant have
their host dependencies equal to their target package dependencies, plus a
"host-" prefix added to packages that don't have one on their own.

For example:
 > LIBUSB_COMPAT_DEPENDENCIES = host-pkg-config libusb
 > HOST_LIBUSB_COMPAT_DEPENDENCIES = host-pkg-config host-libusb

host-pkg-config does not change, libusb becomes host-libusb.

This is indeed pretty natural.

Would it be a good idea to define by default HOST_FOO_DEPENDENCIES
equal to FOO_DEPENDENCIES with suitable subst magic to add "host-" where
it is not present?

This could of course be done later, separated from this work.

Luca
