From: Christian Stewart <christian@paral.in>
Date: Sat, 6 Jun 2020 16:11:55 -0700
Subject: [Buildroot] [PATCH v2 4/7] package/docker-engine: needs more
 runtime dependencies
In-Reply-To: <20200530124735.1384078-5-francois.perrad@gadz.org>
References: <20200530124735.1384078-1-francois.perrad@gadz.org>
 <20200530124735.1384078-5-francois.perrad@gadz.org>
Message-ID: <CA+h8R2p5YBObVJy9b672j4VaWYLAebY=m0Hov2iVnUQzh9+NWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Sat, May 30, 2020 at 5:48 AM Francois Perrad <fperrad@gmail.com> wrote:
>
> fix error:
>         failed to start daemon: Devices cgroup isn't mounted

I don't see this error, and I don't have the cgroupfs-mount enabled.

With systemd, cgroups should be mounted automatically, at least as far
as I know.

> diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
> index 1fd229fcb..64afba30f 100644
> --- a/package/docker-engine/Config.in
> +++ b/package/docker-engine/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_DOCKER_ENGINE
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         depends on !BR2_TOOLCHAIN_USES_UCLIBC # docker-containerd -> runc
>         depends on BR2_USE_MMU # docker-containerd
> +       select BR2_PACKAGE_CGROUPFS_MOUNT # runtime dependency
>         select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
>         select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
>         select BR2_PACKAGE_IPTABLES # runtime dependency

Best regards,
Christian Stewart
