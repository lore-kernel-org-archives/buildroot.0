From: William Tambe <tambewilliam@gmail.com>
Date: Tue, 21 Jul 2020 21:05:45 -0500
Subject: [Buildroot] start-stop-daemon failing due to option -q
In-Reply-To: <20200721213446.6f8e631b@windsurf.home>
References: <CAF8i9mOOn0pU=1u79T_=hgNmxBbi_en_QZ=puossyLFgzrExSw@mail.gmail.com>
 <20200712213126.59c57981@windsurf.home>
 <CAF8i9mMZ1Je-SUDHkDX97ijv8FT68D0Mz9-6D6-tw51U3ZkPnw@mail.gmail.com>
 <CAF8i9mMxkOdD0bcjcrSHbOVxs5fJsz9X__dKC5EzDUG9O_L21Q@mail.gmail.com>
 <20200721213446.6f8e631b@windsurf.home>
Message-ID: <CAF8i9mMEJH8znZvbbct6ucD-mg=eEJ4u86DPbPjiS5aOd+p08w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 21, 2020 at 2:35 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 21 Jul 2020 15:18:19 -0400
> William Tambe <tambewilliam@gmail.com> wrote:
>
> > > Are you able to run start-stop-daemon with the -q option ?
> >
> > Is anyone else seeing the issue of start-stop-daemon failing when the
> > option -q is used ?
>
> I still don't see how it is possible to not have support for the -q
> option in start-stop-daemon, I don't see any conditional in the Busybox
> source code.
>
> Could you provide the Buildroot configuration and Busybox configuration
> that exhibits the issue ?

Certainly; I am currently only using a buildroot configuration with no
busybox configuration; so I think buildroot uses a default busybox
configuration:

BR2_iron=y
BR2_ENABLE_DEBUG=y
BR2_DEBUG_3=y
# BR2_STRIP_strip is not set
BR2_OPTIMIZE_G=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/iron-toolchain/"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-elf"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_5=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
# BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_ROOTFS_MERGED_USR=y
BR2_TARGET_GENERIC_ROOT_PASSWD="root"
BR2_TARGET_GENERIC_GETTY_OPTIONS="-n -l /bin/bash"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_BASH=y
BR2_PACKAGE_HTOP=y
BR2_PACKAGE_NANO=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
# BR2_TARGET_ROOTFS_TAR is not set

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
