From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Sep 2015 23:30:33 +0200
Subject: [Buildroot] [PATCH 1/3] Experimental addition of the newlib
	library
In-Reply-To: <20150915213924.62547101@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 15 Sep 2015 21:39:24 +0200")
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
 <20150913101738.238ebc06@free-electrons.com>
 <CAOudHSVcePTAq7PLON-0Zig-JkJtTNnu-RzHtkYf0f00pe8atw@mail.gmail.com>
 <20150915093523.0597731f@free-electrons.com>
 <20150915175354.GA3650@free.fr>
 <20150915213924.62547101@free-electrons.com>
Message-ID: <87fv23o686.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

Sorry for the slow response, I've been away and busy with deadlines at
$WORK.

 >> However, I'm not sure it is possible to run newlib as the C library
 >> under Linux (i.e. as a replacement for glibc/uClibc/musl). IIRC, newlib
 >> really targets kernel-less systems. It seems there are linux support
 >> files in the newlib source, but I doubt tht is often tested or even
 >> compeltely supported; a cursory look at the interwebs does not return
 >> promissing results...
 >> 
 >> And in nay case, I'm afraid a lot of packages would not build against
 >> newlib.
 >> 
 >> All that to say that I need to look at the patch, and I otherwise do not
 >> see the point for having newlib in Buildroot...

 > Chris is the person who submitted the support for the NuttX operating
 > system, which is another operating system kernel than Linux. In this
 > context, newlib is the C library of choice.

 > Now, there is indeed the question of how to handle all the existing
 > packages that would anyway only build with a normal Linux C library.
 > It's an open debate.

 > Maybe we first need to get an agreement on whether we want to merge
 > something such a newlib toolchain support and NuttX support. On my
 > side, I believe I am quite favorable to that, but I was also favorable
 > to Luca's patch series on the mdev stuff without devtmpfs, which is why
 > Luca started working on this, but in the end, it got turned down.

I wouldn't call it "getting turned down", I simply wanted to make it
clear that just working around old kernels in mdev wouldn't fix the
various other packages that haven't ever been tested on such ancient
kernels, and for the mdev issue a simpler fix would just be to backport
devtmpfs support to the kernel.

I must say that my initial thought when seeing the newlib patches was
that this was really outside the scope of Buildroot, but the patches ARE
quite small and self contained, so if there is interest it might make
sense after all.

I does require that we basically stick the entire package/ under an
ifndef NEWLIB (and system / fs / linux as well), and it will stay a
lower priority than the normal Linux stuff, but if that can be done
at a high enough level then that is probably ok.

I recently bought one of those cheap arduino clones with a stm32f103
(m3) for tinkering, so I might even use it myself! ;)

-- 
Venlig hilsen,
Peter Korsgaard 
