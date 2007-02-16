From: Alexander Rigbo <alexander.rigbo@acgnystrom.se>
Date: Fri, 16 Feb 2007 08:32:35 +0100
Subject: [Buildroot] changing the mk file in a package
In-Reply-To: <20070215192046.HM.00000000000000h@daniel_ng11.bos-mail-wwl24.lycos.com>
References: <20070215192046.HM.00000000000000h@daniel_ng11.bos-mail-wwl24.lycos.com>
Message-ID: <200702160832.36046.alexander.rigbo@acgnystrom.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Sounds like this is some other error. I doubt that cramfs would fail just 
because you changed a .mk.
My suggestion: disable the creation of the cramfs-image when you're changing 
the .mk. Also, if you want your package completely rebuilt just do:

rm -rf build_<arch>/<package>-<version>

Best regards
Alexander Rigbo

On Friday 16 February 2007 01.20.46 Daniel Ng wrote:
> Hi,
>
> I'm adding a new package to buildroot. Following the standard docco I add a
> new package directory and the relevant config.in and xxx.mk file.
>
> I've noticed that if I make changes to xxx.mk I have to do a 'make clean'
> then a 'make' ie. a full rebuild. Otherwise if I just try to run 'make'
> after changing xxx.mk, I get the following error from fakeroot-
>
> # Use fakeroot so mkcramfs believes the previous fakery
> /home/dng/linuxppc/gcc-4.0.2_uclibc/usr/bin/fakeroot \
>  -i /home/dng/linuxppc/gcc-4.0.2_uclibc/fakeroot.env \
>  -s /home/dng/linuxppc/gcc-4.0.2_uclibc/fakeroot.env -- \
>  /home/ppcroot/swdev/buildroot-dng/build_powerpc/cramfs-1.1/mkcramfs -q -
> b \
>  /home/ppcroot/swdev/buildroot-
> dng/build_powerpc/root
> /home/ppcroot/swdev/buildroot-dng/rootfs.powerpc.cramfs Swapping filesystem
> endian-ness
> mkcramfs: mmap failed: /home/ppcroot/swdev/buildroot-
> dng/build_powerpc/root/usr/usr/local
> make: *** [cramfsroot] Error 8
>
> -but my new package has nothing to do with mmap!
>
> If I do a full rebuild, I don't get the above problem. But the fully
> rebuild takes about 30 minutes! Is there a way to get a more sensible
> 'make' behaviour, so that I can avoid having to do these full rebuilds?
>
> Cheers,
> Daniel
>
>
>
>
>  Free Movies?100's of Free Feature Length Films - Meet Friends, Watch
> Movies & Win!
