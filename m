From: Robin Holt <holt@sgi.com>
Date: Thu, 25 Aug 2011 13:17:36 -0500
Subject: [Buildroot] bash instead of busybox
In-Reply-To: <CALo-6+g4dksK0EaCbwsmNu+L53GuveFFJkheggnbePWf-PNHZg@mail.gmail.com>
References: <CALo-6+g4dksK0EaCbwsmNu+L53GuveFFJkheggnbePWf-PNHZg@mail.gmail.com>
Message-ID: <20110825181736.GI4926@sgi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 25, 2011 at 09:56:38AM -0700, Charles Krinke wrote:
> Gentlemen:
> 
> I have a request to build a rootfs.jffs2 for an MPC8323 with bash
> instead of busybox. So, ... I unset busybox in buildroot's make
> xconfig and set bash. Then do a "make clean && make". At the end of
> this, I see the two lines from makedevs. And, of course, to make it
> worse, after I load it into the flash and boot from it, I do get a
> shell of the form "sh-4.1#", so at least the file system boots. I
> *think* at this point that a number of packages need to be added
> starting with say, "ls" which I *think* is in the fileutils package.

I have something similar but did not uncheck busybox.  After bash has
built, it overwrites the /bin/sh symlink to busybox with a (IIRC) hard
link to bash.  That should work for you and keep you from having to
build other packages.

I don't recall, but I may have modified the busybox config to not build
the 'sh' parts, but I do not remember and my git repo is not convenient
at this time.

Robin

> 
> I dont see fileutils as a package option in the buildroot xconfig.
> 
> Can someone offer a suggestion or two to a naive programmer to help
> find some of the essential packages that are now missing?
> 
> 
> >>>   Generating root filesystem image rootfs.jffs2
> ...table='target/generic/device_table.txt'
> makedevs: line 42: regular file
> '/home/ckrinke/asvn/trunk/buildroot-glibc/output/target/bin/busybox'
> does not exist: No such file or directory
> makedevs: line 49: regular file
> '/home/ckrinke/asvn/trunk/buildroot-glibc/output/target/usr/share/udhcpc/default.script'
> does not exist: No such file or directory
> 
> 
> -- 
> Charles Krinke
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
