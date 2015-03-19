From: Steven Noonan <steven@uplinklabs.net>
Date: Thu, 19 Mar 2015 12:54:07 -0700
Subject: [Buildroot] [PATCH 02/15] openvmtools: move systemd service to
	/usr/lib
In-Reply-To: <1426787807-29510-3-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <1426787807-29510-3-git-send-email-mike@mikebwilliams.com>
Message-ID: <CAKbGBLjD2nLhi-aBNJ5bm3n5NDc-5TmpCD4v4_JJLjaKCExaAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 19, 2015 at 10:56 AM, Mike Williams <mike@mikebwilliams.com> wrote:
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>

Reviewed-by: Steven Noonan <steven@uplinklabs.net>

> ---
>  package/openvmtools/openvmtools.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
> index e0ec6d6..84d9a81 100644
> --- a/package/openvmtools/openvmtools.mk
> +++ b/package/openvmtools/openvmtools.mk
> @@ -67,9 +67,9 @@ endef
>
>  define OPENVMTOOLS_INSTALL_INIT_SYSTEMD
>         $(INSTALL) -D -m 644 package/openvmtools/vmtoolsd.service \
> -               $(TARGET_DIR)/etc/systemd/system/vmtoolsd.service
> +               $(TARGET_DIR)/usr/lib/systemd/system/vmtoolsd.service
>         mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -       ln -fs ../vmtoolsd.service \
> +       ln -fs /usr/lib/systemd/system/vmtoolsd.service \
>                 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/vmtoolsd.service
>  endef
>
> --
> 2.1.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
