From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Nov 2008 09:05:15 +0100
Subject: [Buildroot] Problems with new revision.
In-Reply-To: <4917D8AB.40404@genesysdesign.com.au>
References: <4917D8AB.40404@genesysdesign.com.au>
Message-ID: <20081110090515.67210707@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 10 Nov 2008 17:46:03 +1100,
Jared Holzman <j.holzman@genesysdesign.com.au> a ?crit :

> Just updated to the latest revision using svn upd. I'm now having a 
> problem with compiling fontconfig, xlib_libX11 and xlib_libXt. The 
> problem seems to be that each package requires a host runnable 
> executable to be build and it is attempting to link it using target 
> flags. I've chased it down the following difference in the Makefiles:
> 
> -LDFLAGS =
> +LDFLAGS = -L/home/jared/src/buildroot/build_arm/staging_dir/lib 
> -L/home/jared/src/buildroot/build_arm/staging_dir/usr/lib 
> -Wl,--rpath-link
> -Wl,/home/jared/src/buildroot/build_arm/staging_dir/lib
> -Wl,--rpath-link
> -Wl,/home/jared/src/buildroot/build_arm/staging_dir/usr/lib
> --sysroot=/home/jared/src/buildroot/build_arm/staging_dir/
> 
> But I don't have enough experience with the build system to track
> down where this is coming from.

It's probably another bug of the fix we're trying to work on with
Daniel Laird. But the (incorrect) fix has been removed in r23954. Can
you update after this revision and see if you're still having the
problem ?

Moreover, can you send the .config with which you were having issues,
and the exact errors you were getting ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
