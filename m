From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Dec 2008 20:48:25 +0100
Subject: [Buildroot] Bug building fontconfig
In-Reply-To: <4946E738.6020803@dynonavionics.com>
References: <4946E738.6020803@dynonavionics.com>
Message-ID: <20081216204825.00249c96@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 15 Dec 2008 15:24:40 -0800,
Dan Lykowski <dan.lykowski@dynonavionics.com> a ?crit :

> Building fontconfig crashes with the following problem on Ubuntu
> 8.04/8.10.
> 
> /usr/bin/gcc -L/buildroot/build_i686/staging_dir/lib 
> -L/buildroot/build_i686/staging_dir/usr/lib 
> --sysroot=/buildroot/build_i686/staging_dir/ -o fc-case fc-case.o
> /usr/bin/ld: this linker was not configured to use sysroots
> collect2: ld returned 1 exit status
> 
> Removing the --sysroot and building by hand allows the file to link.
> I cant seem to find where this is being added to the cflags/ldflags.
> Any help would be appreciated. It continues to happen whenever
> linking using the host linker.

My patch committed at r24408 added a --sysroot option in the case of
external toolchains, to get things working properly. Are you by any
chance using a configuration with an external toolchain ?

Could you send your .config ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
