From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 1 May 2014 21:08:06 +0200
Subject: [Buildroot] [PATCH] udev: Set the default action to "add" in
 the startup script
In-Reply-To: <1387242855-4882-1-git-send-email-paul@crapouillou.net>
References: <1387242855-4882-1-git-send-email-paul@crapouillou.net>
Message-ID: <CAAXf6LWUgMFdUpSAMMe=jFGC66hy-tv8q+dt3oE+eeTJUc2XqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, all,

On Tue, Dec 17, 2013 at 2:14 AM, Paul Cercueil <paul@crapouillou.net> wrote:
> Otherwise, when udev starts a lot of hardware will not be configured.
>
> Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
> ---
>  package/udev/S10udev | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/udev/S10udev b/package/udev/S10udev
> index 2c7b7e9..fa669ea 100755
> --- a/package/udev/S10udev
> +++ b/package/udev/S10udev
> @@ -30,7 +30,7 @@ case "$1" in
>          echo -n "Populating ${udev_root:-/dev} using udev: "
>          echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
>          $UDEV_BIN -d || (echo "FAIL" && exit 1)
> -        udevadm trigger
> +        udevadm trigger --action=add
>          echo "done"
>          ;;
>      stop)

Could you shine your light on this patch? Is this a correct change?

Thanks,
Thomas
