From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Aug 2009 22:41:03 +0200
Subject: [Buildroot] CramFS + SquashFS
In-Reply-To: <26fbce020908240822l7ef7d181mafdb04f577651bb6@mail.gmail.com>
	(Luciano Greiner's message of "Mon\,
	24 Aug 2009 12\:22\:12 -0300")
References: <26fbce020908240822l7ef7d181mafdb04f577651bb6@mail.gmail.com>
Message-ID: <87ws4tndwg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luciano" == Luciano Greiner <luciano.greiner@gmail.com> writes:

 Luciano> Hello.
 Luciano>    I'm doing a custom build for a set-top box. The Dreambox device
 Luciano> uses a CramFS image to hold kernel image and bootloader, and a
 Luciano> squashfs image containing the root file system.
 Luciano> How do i create these separete images using Buildroot?

That's not supported in BR. The easiest option is either to build
kernel+bootloader+cramfs outside buildroot and just use the squashfs
target, or use the tarball target and split up the content in
cramfs+squashfs outside buildroot.

-- 
Bye, Peter Korsgaard
