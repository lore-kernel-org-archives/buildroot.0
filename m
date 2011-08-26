From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 25 Aug 2011 23:15:16 -0300
Subject: [Buildroot] bash instead of busybox
In-Reply-To: <CALo-6+g4dksK0EaCbwsmNu+L53GuveFFJkheggnbePWf-PNHZg@mail.gmail.com>
References: <CALo-6+g4dksK0EaCbwsmNu+L53GuveFFJkheggnbePWf-PNHZg@mail.gmail.com>
Message-ID: <31d55143f83795e34d61b003c1defe37@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Aug 2011 09:56:38 -0700, Charles Krinke wrote:

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
>
> I dont see fileutils as a package option in the buildroot xconfig.
>
> Can someone offer a suggestion or two to a naive programmer to help
> find some of the essential packages that are now missing?

You want coreutils for ls & friends.
Probably also util-linux for mount and other friends.
Sysvinit for some nice init otherwise you'll have a hard time too.
There are other packages you might want too, like some dev manager now 
that you'll lack mdev, udev maybe? Or a static /dev tree.
You see, if they really don't want busybox the filesystem footprint 
will grow considerably, maybe that's not an issue.
If it's a license thing, well, good luck, most of the other tools 
busybox replaces are GPL too.
Regards.
