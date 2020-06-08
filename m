From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 8 Jun 2020 07:30:06 +0200
Subject: [Buildroot] [PATCH v2 4/7] package/docker-engine: needs more
 runtime dependencies
In-Reply-To: <CA+h8R2p5YBObVJy9b672j4VaWYLAebY=m0Hov2iVnUQzh9+NWQ@mail.gmail.com>
References: <20200530124735.1384078-1-francois.perrad@gadz.org>
 <20200530124735.1384078-5-francois.perrad@gadz.org>
 <CA+h8R2p5YBObVJy9b672j4VaWYLAebY=m0Hov2iVnUQzh9+NWQ@mail.gmail.com>
Message-ID: <CAB0FRstaryiQmuL8d6Y3ACpAQOY78oMUK_eA-A0YgfUWt3RT+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 7 juin 2020 ? 01:12, Christian Stewart <christian@paral.in> a
?crit :

> Hi Francois,
>
> On Sat, May 30, 2020 at 5:48 AM Francois Perrad <fperrad@gmail.com> wrote:
> >
> > fix error:
> >         failed to start daemon: Devices cgroup isn't mounted
>
> I don't see this error, and I don't have the cgroupfs-mount enabled.
>
> With systemd, cgroups should be mounted automatically, at least as far
> as I know.
>
>
I see this error with a host using the old default SysV init (so without
systemd)
So, I will update the patch like this:
        select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime
dependenc

Fran?ois

> diff --git a/package/docker-engine/Config.in
> b/package/docker-engine/Config.in
> > index 1fd229fcb..64afba30f 100644
> > --- a/package/docker-engine/Config.in
> > +++ b/package/docker-engine/Config.in
> > @@ -5,6 +5,7 @@ config BR2_PACKAGE_DOCKER_ENGINE
> >         depends on BR2_TOOLCHAIN_HAS_THREADS
> >         depends on !BR2_TOOLCHAIN_USES_UCLIBC # docker-containerd -> runc
> >         depends on BR2_USE_MMU # docker-containerd
> > +       select BR2_PACKAGE_CGROUPFS_MOUNT # runtime dependency
> >         select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
> >         select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
> >         select BR2_PACKAGE_IPTABLES # runtime dependency
>
> Best regards,
> Christian Stewart
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200608/0a770fdf/attachment.html>
