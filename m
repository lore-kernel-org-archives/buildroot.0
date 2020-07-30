From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 30 Jul 2020 09:21:33 -0700
Subject: [Buildroot] [PATCH] package/dbus: disable systemd for host build
In-Reply-To: <20200728104519.3328479-1-john@metanate.com>
References: <20200728104519.3328479-1-john@metanate.com>
Message-ID: <CAFSsvmobOi2fb4WBVtTwGWp-wPGvo6c3RpRHDbVhw2RfSEV7cA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All;

On Tue, Jul 28, 2020 at 3:45 AM John Keeping <john@metanate.com> wrote:
>
> This fixes an issue if host-dbus happens to be rebuilt after systemd, in
> which case it autodetects systemd support but then ignored the prefix
> when installing unit files.  That means that is tries to write to the
> host system's /usr/lib/ which fails.
>
> There is no reason to build and install systemd support in the host
> build, so disable it explicitly.
>
> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  package/dbus/dbus.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
> index 312c6ba1d8..3c67625688 100644
> --- a/package/dbus/dbus.mk
> +++ b/package/dbus/dbus.mk
> @@ -107,6 +107,7 @@ HOST_DBUS_CONF_OPTS = \
>         --disable-selinux \
>         --disable-xml-docs \
>         --disable-doxygen-docs \
> +       --disable-systemd \
>         --without-x \
>         --with-xml=expat
>
> --
> 2.27.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Tested-by: Adam Duskett <aduskett@gmail.com>
