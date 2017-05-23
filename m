From: Pascal K <pascalkrauth@gmail.com>
Date: Tue, 23 May 2017 14:40:03 +0000
Subject: [Buildroot] Building Network Manager fails at configure due to
 uuid package requirements error
In-Reply-To: <20170523152652.0b449cbe@free-electrons.com>
References: <CADj18OV=YojdFc_mYeHjf0zuQzec3e=ivO=B78=m9T1NVqeEnQ@mail.gmail.com>
 <20170523152652.0b449cbe@free-electrons.com>
Message-ID: <CADj18OXwjeKnSWMENVNU9ncLMvVqfvm2D4Gam2rq3vKAF16Dxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

you were right.

To integrate the NetworkManager I had to switch from "devtmpfs+mdev" to
"eudev" which seemed to cause a inconsistency in my setup ( a clean build
removes this) .

Thanks for your help.

Best regards,
Pascal

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schrieb am Di., 23.
Mai 2017 um 15:26 Uhr:

> Hello,
>
> On Tue, 23 May 2017 08:35:52 +0000, Pascal K wrote:
>
> > Here some console output:
> > $make
> > ...
> > build/buildroot-config/conf --silentoldconfig Config.in
> > >>> network-manager 1.4.2 Configuring
> > ...
> > checking for LIBNL... yes
> > checking for UUID... no
> > configure: error: Package requirements (uuid) were not met:
> >
> > Package uuid was not found in the pkg-config search path.
> > Perhaps you should add the directory containing `uuid.pc'
> > to the PKG_CONFIG_PATH environment variable
> > Package 'uuid', required by 'world', not found
> >
> > Consider adjusting the PKG_CONFIG_PATH environment variable if you
> > installed software in a non-standard prefix.
> >
> > Alternatively, you may set the environment variables UUID_CFLAGS
> > and UUID_LIBS to avoid the need to call pkg-config.
> > See the pkg-config man page for more details.
> >
> > Parts of my config, which I thought should do the trick with the uuid:
> > BR2_PACKAGE_UTIL_LINUX=y
> > BR2_PACKAGE_UTIL_LINUX_LIBBLKID=y
> > # BR2_PACKAGE_UTIL_LINUX_LIBMOUNT is not set
> > # BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS is not set
> > BR2_PACKAGE_UTIL_LINUX_LIBUUID=y
>
> Can you reproduce after a full rebuild, i.e "make clean all" ?
>
> If so, could you please provide a complete .config file that reproduces
> the issue ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170523/96ff4818/attachment.html>
