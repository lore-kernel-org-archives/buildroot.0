From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Aug 2020 11:08:48 -0700
Subject: [Buildroot] [PATCH] package/avahi: disable introspection
In-Reply-To: <20200831140035.5880-1-peter@korsgaard.com>
References: <20200831140035.5880-1-peter@korsgaard.com>
Message-ID: <CAFSsvmohdGT6AS2633-H=BiGOjN=6eq9_Xi3_t7-_UqiYTb4rA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All:

Tested-by: Adam Duskett <aduskett@gmail.com>

On Mon, Aug 31, 2020 at 7:00 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> Fixes:
> http://autobuild.buildroot.net/results/b9bf7cea8be9231552a10e8ea828bf24394402ba/
>
> Building with introspection (together with D-Bus) support currently fails.
> Fixing it is not trivial, so explicitly disable introspection for now.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/avahi/avahi.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index 73db37545f..eef05f0d2f 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -35,6 +35,7 @@ AVAHI_CONF_OPTS = \
>         --disable-mono \
>         --disable-monodoc \
>         --disable-stack-protector \
> +       --disable-introspection \
>         --with-distro=none \
>         --disable-manpages \
>         $(if $(BR2_PACKAGE_AVAHI_AUTOIPD),--enable,--disable)-autoipd \
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
