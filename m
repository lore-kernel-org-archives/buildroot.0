From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 22:28:11 +0100
Subject: [Buildroot] [PATCH v2 1/1] turbovnc: new package
In-Reply-To: <59FB8C69.7050108@petroprogram.com>
References: <1509367204-12966-1-git-send-email-stefan.froberg@petroprogram.com>
 <20171101060657.tzjnt4ceb25irb3o@sapphire.tkos.co.il>
 <20171101105305.1cd82e60@windsurf>
 <59FB8C69.7050108@petroprogram.com>
Message-ID: <20171102222811.4d501282@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 02 Nov 2017 23:21:45 +0200, Stefan Fr?berg wrote:


> libbzip2.a      libfontenc.a    librandr.a    libXau.a libxkb.a
> libcomposite.a  libfreetype2.a  librender.a   libXdmcp.a libXNVCtrl.a
> libdamage.a     libmain.a       libsha1.a     libXext-server.a libzlib.a
> libdamageext.a  libmi.a         libsync.a     libxfixes.a
> libdix.a        libos.a         libvnc.a      libXfont.a
> libfb.a         libpixman.a     libvncauth.a  libXi.a

That's a lot of static libraries, but I'm sure TurboVNC didn't
duplicate the source code for all of these. Perhaps it is copying them
from their system-wide location to its build directory, for some funky
reason?

> But then doing ldd for Xvnc binary gives this:
> Xvnc:
>          linux-vdso.so.1 (0x00007fffbbffe000)
>          libturbojpeg.so.0 => /usr/lib64/libturbojpeg.so.0 
> (0x00007f1d221b8000)
>          libm.so.6 => /lib64/libm.so.6 (0x00007f1d21eba000)
>          libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f1d21c9e000)
>          libpam.so.0 => /lib64/libpam.so.0 (0x00007f1d21a90000)
>          libdl.so.2 => /lib64/libdl.so.2 (0x00007f1d2188c000)
>          libSM.so.6 => /usr/lib64/libSM.so.6 (0x00007f1d21683000)
>          libICE.so.6 => /usr/lib64/libICE.so.6 (0x00007f1d21466000)
>          libX11.so.6 => /usr/lib64/libX11.so.6 (0x00007f1d21124000)
>          libXext.so.6 => /usr/lib64/libXext.so.6 (0x00007f1d20f12000)
>          libc.so.6 => /lib64/libc.so.6 (0x00007f1d20b76000)
>          /lib64/ld-linux-x86-64.so.2 (0x00007f1d2242b000)
>          libuuid.so.1 => /lib64/libuuid.so.1 (0x00007f1d20971000)
>          libbsd.so.0 => /usr/lib64/libbsd.so.0 (0x00007f1d2075b000)
>          libxcb.so.1 => /usr/lib64/libxcb.so.1 (0x00007f1d20532000)
>          librt.so.1 => /lib64/librt.so.1 (0x00007f1d2032a000)
>          libXau.so.6 => /usr/lib64/libXau.so.6 (0x00007f1d20126000)
>          libXdmcp.so.6 => /usr/lib64/libXdmcp.so.6 (0x00007f1d1ff20000)
> 
> So it builds a static versions of libXau.a libXdmcp.a for example, but 
> then does not use them anyway in the final link but instead the system 
> wide versions ?
> 
> I posted question to github if bzip2, freetype2 and zlib can be external 
> dependencies or if they contain some TurboVNC specific stuff.

Thanks. Let's see what upstream says.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
