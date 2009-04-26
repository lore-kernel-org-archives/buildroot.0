From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Apr 2009 22:10:42 +0200
Subject: [Buildroot] Buildroot comments and questions
In-Reply-To: <a4413b2d0904260736j3b85599u488c9f3d28777f36@mail.gmail.com> (Hai
	Shalom's message of "Sun\, 26 Apr 2009 17\:36\:46 +0300")
References: <a4413b2d0904260736j3b85599u488c9f3d28777f36@mail.gmail.com>
Message-ID: <873abvkwfx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hai" == Hai Shalom <hai.shalom@gmail.com> writes:

Hi,

 Hai> I've been using the buildroot for the first time, and I am
 Hai> struggling to create a stable toolchain for armeb with uclibc
 Hai> 0.9.29 and gcc 4.2.4.

Any particular reason why you aren't using the stable versions then?
(uclibc 0.9.30.1, gcc 4.3.x)

 Hai> ?
 Hai> There are few minor issues which I would like to update:
 Hai> 1. For gcc 4.2.x,? BR2_GCC_TARGET_ABI must be "aapcs" and not "aapcs-linux"
 Hai> which works only for gcc 4.3.x.

Seems like we need something like
toolchain/gcc/4.3.2/999-4.3.2-armeabi-aapcs-linux.patch for 4.2.x as
well.


 Hai> 2. I am using GNU find 4.1.20 which doesn't like the "-delete"
 Hai> flag in the main Makefile, instead you can use " | xargs rm -rf"
 Hai> which is good for all versions.

4.1.20? That's old, what distribution are you on?


 Hai> 3. There is a Thumb support patch for ARM in
 Hai> http://lists.busybox.net/pipermail
 Hai> /buildroot/2008-March/019622.html I have problems with it
 Hai> because the gcc warns that crtbegin.o doesn't support
 Hai> Thumb-interwork whilst my binary does.  Perhaps you should check
 Hai> it out?

It's still on my todo list.

 Hai>I have a few questions and I would be greatful if you
 Hai> could answer or comment: 1. I have a compilation error with
 Hai> crtstuff.c: ?
 Hai> /buildroot-2009.02/toolchain_build_armeb/gcc-4.2.4/gcc/crtstuff.c:
 Hai> In function '__do_global_dtors_aux':
 Hai> /buildroot/buildroot-2009.02/toolchain_build_armeb/gcc-4.2.4/gcc/
 Hai> crtstuff.c:267: error: '__DTOR_LIST__' undeclared (first use in
 Hai> this function)
 Hai> /buildroot/buildroot-2009.02/toolchain_build_armeb/gcc-4.2.4/gcc/
 Hai> crtstuff.c:267: error: (Each undeclared identifier is reported
 Hai> only once
 Hai> /buildroot/buildroot-2009.02/toolchain_build_armeb/gcc-4.2.4/gcc/
 Hai> crtstuff.c:267: error: for each function it appears in.)
 Hai> make[2]: *** [crtbegin.o] Error 1

Do you have the same problem with the currently stable gcc/uclibc
versions? Please post your .config

-- 
Bye, Peter Korsgaard
