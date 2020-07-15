From: Christian Stewart <christian@paral.in>
Date: Wed, 15 Jul 2020 12:59:47 -0700
Subject: [Buildroot] [PATCH 1/1] package/gvfs: needs dynamic library
In-Reply-To: <20200715195244.253915-1-fontaine.fabrice@gmail.com>
References: <20200715195244.253915-1-fontaine.fabrice@gmail.com>
Message-ID: <CA+h8R2ox1cmfyO++py96Y-dKcotrJpLOVDZ6yx9go9F5zMjg7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Wed, Jul 15, 2020 at 12:52 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Since commit 35e240105f1db3e91fb769616efd8bdb90fb1b24, gvfs needs
> dynamic library as it uses shared_module to build libgvfs_dbus and
> libgioremote_volume_monitor
>
> Fixes:
>  - http://autobuild.buildroot.org/results/89a02fda05e75bfc9bd4fa17fea3bec23fd5da3d

[snip]

>         depends on BR2_TOOLCHAIN_HAS_THREADS # gvfs
> +       depends on !BR2_STATIC_LIBS # gvfs
>         select BR2_PACKAGE_GVFS

LGTM.

Acked-by: Christian Stewart <christian@paral.in>

Best regards,
Christian
