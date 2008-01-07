From: Atle Nissestad <atle@nissestad.no>
Date: Mon, 7 Jan 2008 17:09:25 +0100
Subject: [Buildroot] Buildroot fails at libstdc++
In-Reply-To: <36163.1199717483@powersmiths.com>
References: <36163.1199717483@powersmiths.com>
Message-ID: <200801071709.25722.atle@nissestad.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 7. January 2008 15:51:23 piotr at powersmiths.com wrote:
>  Hi all,
>
>  I am having a problem with taking the buildroot process pass the libstdc++
> phase. Here is my setup:
>
>  buildroot snapshot 2008-01-02
>
>  binutils 2.18
>  kernel?? 2.6.22.10
>  gcc????? 3.4.6
>  uClibc?? 0.9.29
>
>  generic arm, nommu, no FP, soft-float, little-endian (all configs
> attached) no user apps - just the toolchain
>
>  I have made several attempts to run the buildroot program with target set
> to "linux-uclibc" and "linux". It always fails the same way:
>
>  For the "linux-uclibc" target there are no *.o files in .libs directory
> (but it contains libstdc++.a, libstdc++.la, and libstdc++.lai).
>
>  /home/piotr/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ar
> cru libstdc++_pic.a .libs/*.o ../libsupc++/*.o
> /home/piotr/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ar:
> .libs/*.o: No such file or directory make[4]: *** [install-exec-local]
> Error 1
>  make[4]: Leaving directory
> `/home/piotr/buildroot/toolchain_build_arm/gcc-3.4.6-final/arm-linux-uclibc
>/libstdc++-v3/src' make[3]: *** [install-am] Error 2
>  make[3]: Leaving directory
> `/home/piotr/buildroot/toolchain_build_arm/gcc-3.4.6-final/arm-linux-uclibc
>/libstdc++-v3/src' make[2]: *** [install-recursive] Error 1
>  make[2]: Leaving directory
> `/home/piotr/buildroot/toolchain_build_arm/gcc-3.4.6-final/arm-linux-uclibc
>/libstdc++-v3' make[1]: *** [install-target-libstdc++-v3] Error 2
>  make[1]: Leaving directory
> `/home/piotr/buildroot/toolchain_build_arm/gcc-3.4.6-final' make: ***
> [/home/piotr/buildroot/toolchain_build_arm/gcc-3.4.6-final/.installed]
> Error 2
>

There is a patch which fixes this in the bug-tracker, 
http://bugs.uclibc.org/view.php?id=1620.
Now, if someone with commit access could be so kind .....

- Atle
