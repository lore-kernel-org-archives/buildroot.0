From: Cameron Hutchison <lists@xdna.net>
Date: Tue, 23 Feb 2010 22:00:16 -0000
Subject: [Buildroot] make -C <buildroot_directory> failed
References: <8128F0FD6C26E14C8EB4BFDB92B8D6B2134B26@2putt.int.lantronix.com>
Message-ID: <4f6b.4b844ff0.25c53@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Matthew Davison" <matt.davison@lantronix.com> writes:

>Attempting to invoke the top level buildroot makefile from a higher
>level Makefile or simply with make -C <buildroot_directory> fails during
>the kernel build. This is even true if 'make -C .' is invoked from the
>top level buildroot directory, as long as a kernel build is enabled. It
>appears that the problem has something to do with make's
>"Entering/Leaving directory" messages, as the output below suggests.
>When I passed the --no-print-directory option to make, I was able to
>build without problems.

I think I see the problem. See if this patch fixes it. I haven't tested
this, but this looks right.
