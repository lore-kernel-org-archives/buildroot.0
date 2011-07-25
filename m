From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Jul 2011 23:26:48 +0200
Subject: [Buildroot] BR2_PREFER_STATIC_LIB and external toolchain
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6047CB6@ex-mb1.corp.adtran.com>
 (ANDY KENNEDY's message of "Mon, 25 Jul 2011 21:12:35 +0000")
References: <F9C551623D2CBB4C9488801D14F864C6047C5D@ex-mb1.corp.adtran.com>
 <87r55e15gb.fsf@macbook.be.48ers.dk>
 <F9C551623D2CBB4C9488801D14F864C6047CB6@ex-mb1.corp.adtran.com>
Message-ID: <87aac2127b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:

 >> Yes, I noticed as well today. Unfortunately it isn't as simple as
 >> making
 >> copy_toolchain_lib_root a noop with static linking, as E.G. glibc
 >> afaik
 >> still needs libnss*.so* in the target rootfs when static linking is
 >> used.

 ANDY> Really?  What are the libnss*-pic.a for then?

I don't normally use glibc toolchains for embedded, but I believe you
only have those if you built glibc with --enable-static-nss. By default
glibc will dlopen libnss instead (to handle dynamic name resolution).

 ANDY> Also, another bone of contention is that I'm getting header files
 ANDY> in the target.  Where does that happen?

Those should get removed at the end through the target-finalize step in
the toplevel Makefile unless you have BR2_HAVE_DEVFILES enabled.

-- 
Bye, Peter Korsgaard
