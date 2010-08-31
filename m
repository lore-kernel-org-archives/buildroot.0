From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 31 Aug 2010 18:39:01 +0000 (UTC)
Subject: [Buildroot] libssp missing from target
References: <i5j4vi$oj9$1@dough.gmane.org> <20100831200709.11d5a800@surf>
Message-ID: <i5ji85$mrr$2@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-08-31, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> On Tue, 31 Aug 2010 14:52:34 +0000 (UTC)
> Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> I just added a package (systemtap) that uses libssp.  I find libssp.so
>> et al. are present in output/staging/lib but missing from
>> output/target/lib. Is there something I need to do in my package
>> makefile to tell buildroot that my package needs libssp to be copied
>> from staging into target?
>
> What is libssp?

I don't really know.  Here are the text symbols it defines:

 __chk_fail
 __stack_chk_fail
 __stack_chk_fail_local
 __gets_chk
 __memcpy_chk
 __memmove_chk
 __mempcpy_chk
 __memset_chk
 __stpcpy_chk
 __strcat_chk
 __strcpy_chk
 __strncat_chk
 __strncpy_chk

My guess is it's some internal uClibc stuff.

> Who needs it (besides systemtap)

Nothing that I happen to be building (as far as I know).

> and for what?

I don't know.  Does it matter?

> It seems to exist in uClibc toolchains, but not in glibc toolchains.

OK.

Why not run "ldd" on the binaries in output/target/bin and
output/target/usr/bin and just copy whatever libraries they need?

Does buildroot need to know exactly for what a library is used by each
binary?

-- 
Grant Edwards               grant.b.edwards        Yow! I want to kill
                                  at               everyone here with a cute
                              gmail.com            colorful Hydrogen Bomb!!
