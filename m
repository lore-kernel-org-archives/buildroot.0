From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 18 Feb 2013 09:30:59 +0000
Subject: [Buildroot] [git commit] libffi: switch to using a Git version,
 brings Microblaze and Xtensa support
In-Reply-To: <87y5enp8sb.fsf@dell.be.48ers.dk>
References: <20130205150055.C510A9A987@busybox.osuosl.org>
 <CAG2jQ8iKxtdxCTc2DyMTy-3naNtQjWRdonxP8u0e7tVF0tsecA@mail.gmail.com>
 <87y5enp8sb.fsf@dell.be.48ers.dk>
Message-ID: <CAG2jQ8jnzs8_qv57gycLSekrfcUNQP+OvSbF4p0kU6_OZaVG-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17 February 2013 09:52, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:
>
> Hi,
>
>  Markos> Hi Peter,
>
>  Markos> A new libffi is released[1]. Maybe we should revert to the old
>  Markos> Makefile now that a new version is out?
>  Markos> I can provide a patch if needed.
>
>  Markos> [1] ftp://sourceware.org/pub/libffi/libffi-3.0.12.tar.gz
>
> Yes, that's probably a good idea. I'm just back from holidays and still
> catching up on mails. Do we need to do it for 2013.02? E.G. does it fix
> something critical compared to the git version?
>
> --
> Bye, Peter Korsgaard

Hi Peter,

I think it makes sense to include the libffi stable version in the the
2013.02 release. First of all, it would be easier to apply upstream
patches in the future if needed. Secondly, having a random git
snapshot in a stable buildroot release does not look right. Below, are
the changes between the current git sha1 we have in buildroot and the
final 3.0.12 release. It seems to me that there are some commits worth
including in the buildroot package as well.

f308faf Add moxie support.  Release 3.0.12.
4ea22e5 Update README
10e7722 mend
a952141 sparc v8 and testsuite fixes
70b11b4 Fix small struct passing on ppc
63ba1fa Remove xfail for arm*-*-*.
24fbca4 Fix typo
b0fa11c More man page cleanup
8bd15d1 Fix many.c testcase for ppc
7aab825 Add missing files to dist
cb03ea8 sparc v9 fixes for sun tools
35ee8d4 Fix microblaze big-endian struct issue
9db7e1a Fix botched sparc patch. Update version.
ce0138e Update bug report address. rc2.
fd07c9e Add cache flushing routine for sun compiler on sparc solaris 2.8
ed6ae95 Add libtool-ldflags. Define toolexeclibdir for non-GCC builds.
 create mode 100755 libtool-ldflags
ffef2e0 x32 and libtool fixes
95eeceb Remove a.out cruft from dist
176aa9d Fix GCC usage test and update README
f3a4f3f Fixes for AIX xlc compiler.
522f8fe Fix man page. Clean out junk.
 delete mode 100755 testsuite/libffi.call/a.out
c4dfa25 Bump soversion
f62bd63 Release candidate 1
f7cd61e Fix pkgconfig install bits
6a79012 Work around LLVM ABI problem on x86-64
3701129 Merge pull request #28 from jralls/master

-- 
Regards,
Markos Chandras
