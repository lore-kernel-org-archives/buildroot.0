From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 25 Sep 2018 14:05:42 -0400
Subject: [Buildroot] [PATCH 1/1] Add Greenlots glue
In-Reply-To: <20180925180221.24323-1-aduskett@gmail.com>
References: <20180925180221.24323-1-aduskett@gmail.com>
Message-ID: <CAFSsvmrvUfzCau3i+c6F4Qw5Lc6Vhxz102_yLigFJJMNxy4pOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sigh... please ignore this. GIT made 3 patches and I didn't notice it.
On Tue, Sep 25, 2018 at 2:02 PM Adam Duskett <aduskett@gmail.com> wrote:
>
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  Config.in                      | 2 ++
>  package/Config.in              | 4 ++++
>  package/greenlots/Config.in    | 8 ++++++++
>  package/greenlots/greenlots.mk | 1 +
>  4 files changed, 15 insertions(+)
>  create mode 100644 package/greenlots/Config.in
>  create mode 100644 package/greenlots/greenlots.mk
>
> diff --git a/Config.in b/Config.in
> index 6b5b2b043c..6da0024688 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -840,6 +840,8 @@ source "fs/Config.in"
>
>  source "boot/Config.in"
>
> +source "greenlots/menu/Config.in"
> +
>  source "package/Config.in.host"
>
>  source "Config.in.legacy"
> diff --git a/package/Config.in b/package/Config.in
> index f5a17492c7..50f794694a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -8,6 +8,10 @@ menu "Target packages"
>         source "package/skeleton-init-systemd/Config.in"
>         source "package/skeleton-init-sysv/Config.in"
>
> +menu "GreenLots"
> +       source "package/greenlots/Config.in"
> +endmenu
> +
>  menu "Audio and video applications"
>         source "package/alsa-utils/Config.in"
>         source "package/atest/Config.in"
> diff --git a/package/greenlots/Config.in b/package/greenlots/Config.in
> new file mode 100644
> index 0000000000..7394878657
> --- /dev/null
> +++ b/package/greenlots/Config.in
> @@ -0,0 +1,8 @@
> +source "greenlots/package/atlantis/Config.in"
> +source "greenlots/package/eguana-simulator/Config.in"
> +source "greenlots/package/gl-util/Config.in"
> +source "greenlots/package/mongodb-tools/Config.in"
> +source "greenlots/package/ocpp-node/Config.in"
> +source "greenlots/package/skywave-node/Config.in"
> +source "greenlots/package/wattnode-simulator/Config.in"
> +source "greenlots/package/site-controller/Config.in"
> diff --git a/package/greenlots/greenlots.mk b/package/greenlots/greenlots.mk
> new file mode 100644
> index 0000000000..0aec8a8276
> --- /dev/null
> +++ b/package/greenlots/greenlots.mk
> @@ -0,0 +1 @@
> +include greenlots/package/*/*.mk
> --
> 2.17.1
>
