From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 10 Oct 2019 20:12:11 +0200
Subject: [Buildroot] [PATCH 3/3] [DO NOT MERGE] board/beelink_gs1: add
 root passwd and eth0 auto
In-Reply-To: <fcffd262-0574-4a43-ac7f-ac1e6591862b@mind.be>
References: <20190920190813.21516-1-peron.clem@gmail.com>
 <20190920190813.21516-4-peron.clem@gmail.com>
 <fcffd262-0574-4a43-ac7f-ac1e6591862b@mind.be>
Message-ID: <CAJiuCcc7qrNNYo4fedLgKv99gAH4jsRmL-ptgAX9zoVfqMef-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, 21 Sep 2019 at 12:36, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 20/09/2019 21:08, Cl?ment P?ron wrote:
> > Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
> > ---
> >  board/beelink/gs1/rootfs_overlay/etc/network/interfaces | 7 +++++++
> >  configs/beelink_gs1_defconfig                           | 2 ++
> >  2 files changed, 9 insertions(+)
> >  create mode 100644 board/beelink/gs1/rootfs_overlay/etc/network/interfaces
> >
> > diff --git a/board/beelink/gs1/rootfs_overlay/etc/network/interfaces b/board/beelink/gs1/rootfs_overlay/etc/network/interfaces
> > new file mode 100644
> > index 0000000000..0af5845617
> > --- /dev/null
> > +++ b/board/beelink/gs1/rootfs_overlay/etc/network/interfaces
> > @@ -0,0 +1,7 @@
> > +# Configure Loopback
> > +auto lo
> > +iface lo inet loopback
> > +
> > +# Configure eth0 with DHCP
> > +auto eth0
> > +iface eth0 inet dhcp
>
>  Doesn't BR2_SYSTEM_DHCP="eth0" work? We do that in a lot of other defconfigs.
Thanks for the tips, I didn't know about this option.

Regards,
Cl?ment

>
>  Regards,
>  Arnout
>
> > diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
> > index ccf4771cc7..4794df7914 100644
> > --- a/configs/beelink_gs1_defconfig
> > +++ b/configs/beelink_gs1_defconfig
> > @@ -3,6 +3,8 @@ BR2_aarch64=y
> >  BR2_ARM_FPU_VFPV4=y
> >  BR2_TARGET_GENERIC_ISSUE="Welcome to Beelink GS1"
> >  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> > +BR2_TARGET_GENERIC_ROOT_PASSWD="admin"
> > +BR2_ROOTFS_OVERLAY="board/beelink/gs1/rootfs_overlay"
> >  BR2_ROOTFS_POST_BUILD_SCRIPT="board/beelink/gs1/post-build.sh"
> >  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beelink/gs1/genimage.cfg"
> >
