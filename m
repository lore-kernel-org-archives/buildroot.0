From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Fri, 13 Jul 2007 12:48:44 -0500
Subject: [Buildroot] Building debug version of kernel
In-Reply-To: <000601c7c567$2bbcdf10$2c48a8c0@greyhawk.tonecommander.com>
References: <000601c7c567$2bbcdf10$2c48a8c0@greyhawk.tonecommander.com>
Message-ID: <20070713174844.GA16025@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Is editing the top-level Linux Makefile the standard method for my host
> machine to build a debug version (i.e. with "-g -O0" CFLAGS) of the Linux
> 2.6 kernel?  If so, should I make these flag changes to CFLAGS_KERNEL or
> HOSTCFLAGS or both?
> 
There is a configuration option under 'Kernel hacking' in the Linux
configuration system to turn on debugging symbols. Was there some
reason this does not work?

> The build output only shows the format "CC <object-file-name>" without
> flags, so I can't see what it's actually doing.
> 
If you add 'V=1' to your 'make vmlinux' target area in the makefile, you
can see the verbose output of the compiling, linking, etc.

-Steve
