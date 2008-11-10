From: Jared Holzman <j.holzman@genesysdesign.com.au>
Date: Mon, 10 Nov 2008 17:46:03 +1100
Subject: [Buildroot] Problems with new revision.
Message-ID: <4917D8AB.40404@genesysdesign.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

Just updated to the latest revision using svn upd. I'm now having a 
problem with compiling fontconfig, xlib_libX11 and xlib_libXt. The 
problem seems to be that each package requires a host runnable 
executable to be build and it is attempting to link it using target 
flags. I've chased it down the following difference in the Makefiles:

-LDFLAGS =
+LDFLAGS = -L/home/jared/src/buildroot/build_arm/staging_dir/lib 
-L/home/jared/src/buildroot/build_arm/staging_dir/usr/lib 
-Wl,--rpath-link -Wl,/home/jared/src/buildroot/build_arm/staging_dir/lib 
-Wl,--rpath-link 
-Wl,/home/jared/src/buildroot/build_arm/staging_dir/usr/lib 
--sysroot=/home/jared/src/buildroot/build_arm/staging_dir/

But I don't have enough experience with the build system to track down 
where this is coming from.

Any ideas?

-- 

Regards,

Jared Holzman

------------------------------------------------------------------------

*Electronics Design Engineer*

*Genesys Electronics Design Pty Ltd*

Unit 5, 33 Ryde Rd Pymble
NSW, Australia 2073

Direct: +612 9496 8924
Phone: +612 9496 8900
Fax: +612 9496 8999

j.holzman at genesysdesign.com.au <mailto:j.holzman@genesysdesign.com.au>
www.genesysdesign.com.au <http://www.genesysdesign.com.au>

------------------------------------------------------------------------
