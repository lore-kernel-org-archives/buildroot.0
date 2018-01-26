From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jan 2018 09:31:02 +0100
Subject: [Buildroot] Broken link in build notification
In-Reply-To: <315211c8-1831-557c-4ef0-00d67fd8473a@gmail.com> (Zoltan
 Gyarmati's message of "Thu, 25 Jan 2018 00:34:04 +0100")
References: <20180121070008.0687520885@mail.free-electrons.com>
 <7d2636ad-5201-10d9-fe72-4d1001a94c72@gmail.com>
 <87po61o9q2.fsf@dell.be.48ers.dk>
 <315211c8-1831-557c-4ef0-00d67fd8473a@gmail.com>
Message-ID: <87mv11ja2h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Zoltan" == Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com> writes:

Hi,

 >> Sorry, my fault. I am moving sources.buildroot.net to a new VM / behind
 >> cloudflare, and DNS for autobuild.buildroot.net temporarily pointed at
 >> the VM running bugs.busybox.net instead of the autobuild master.

> OK, thanks for the clarification.

 >> There's also a few autobuilder failures because of this.

 > I couldn't reproduce the linked build failure, so you think it's
 > probably because of this and it's safe to ignore?

I don't think it is because of the DNS change (which would cause E.G. a
download failure), but I do see that the error is a segfault of a host
utility, and the build happened on gcc67, which is a Ryzen based
machine. These early Ryzen CPUs had a number of problems and we saw
similar crashes, so we stopped using them for autobuilders. I got a
notification a few days ago that the CPU had been replaced, but the
problems apparently still occur, so I have stopped the autobuilder
again.

In other words, yes - You can ignore this error.

 >> It should be fixed now, and sources.buildroot.net should be faster now.
 >> 

 > Cool, thanks for the work on this!

You're welcome!

-- 
Bye, Peter Korsgaard
