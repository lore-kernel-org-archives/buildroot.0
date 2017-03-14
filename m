From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 22:20:24 +0100
Subject: [Buildroot] binutils now adds sysroot for ld -rpath search
In-Reply-To: <1489484038.1572.7.camel@embedded.rocks>
References: <1489484038.1572.7.camel@embedded.rocks>
Message-ID: <20170314222024.7fe9af37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 10:33:58 +0100, J?rg Krause wrote:

> After a discussion with Brad King on the CMake issue tracker [1] about
> how the linker should handle -rpath we agreed that ld should add the
> sysroot when searching for files (but not when setting the RPATH header
> value).
> 
> I picked up a five years old patch from the binutils mailing list [2]
> which already proposed the change, but was not submitted then.
> 
> I resend the patch [3] and this time Alan Modra accepted the change. He
> submitted two patches [4,5] which will add the sysroot to -rpath?for
> absolute paths.

Aaah indeed. I also recently looked at some package that was failing to
build because -rpath /usr/lib was passed. And then I realized that
things were clunky: what if you really a RPATH to be encoded in the
generated binary, but don't want this path to be looked at on the build
machine during the cross-compilation.

Your patch solves exactly that. I guess we'll have to integrate it in
Buildroot as well, but we will still have issues with external
toolchains, sadly :-/

Thanks a lot for this work!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
