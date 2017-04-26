From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 08:51:30 +0200
Subject: [Buildroot] Builroot - android ndk
In-Reply-To: <20170416101954.5f581953@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 16 Apr 2017 10:19:54 +0200")
References: <CAJU5dMciTnGkiu4=op-ZLhmHk4VEaeO6Zi2oEyKajy9TAAYhBA@mail.gmail.com>
 <20170416101954.5f581953@free-electrons.com>
Message-ID: <87inlrr79p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 15 Apr 2017 13:38:05 -0400, Alvaro Denis wrote:

 >> If I build the toolchain using make_standalone_toolchain.py
 >> <https://developer.android.com/ndk/guides/standalone_toolchain.html>
 >> it is a "pure toolchain"? it can be used in buildroot as preintstaled
 >> toolchain?

 > We have never tested Android toolchains, so I don't know. However, what
 > is sure is that those toolchains use the bionic C library, which we
 > don't support. And you most likely won't be able to build most of the
 > Linux applications against bionic, at  least not without some effort.

But you can afaik combine a Buildroot rootfs (built against
glibc/musl/uclibc) with an android rootfs without much problems, as the
same paths aren't used. In the worst case you can do a static build.

-- 
Bye, Peter Korsgaard
