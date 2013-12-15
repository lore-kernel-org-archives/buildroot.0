From: Ron Eggler <reggler@semios.com>
Date: Sun, 15 Dec 2013 10:16:46 +0000
Subject: [Buildroot] gets() undeclared???
In-Reply-To: <CAAXf6LU8YwQgOYqS4+5qQsrLqMM8Z-vB0vrNWP_J-Hk17ZQGaw@mail.gmail.com>
References: <1729491.ttgRZG5klY@regdesktophome>
 <CAAXf6LU8YwQgOYqS4+5qQsrLqMM8Z-vB0vrNWP_J-Hk17ZQGaw@mail.gmail.com>
Message-ID: <1822487.DtIXaHI20I@regdesktophome>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for your reply!


> Hi Ron,
> 
> On Sat, Dec 14, 2013 at 11:46 PM, Ron Eggler <reggler@semios.com> wrote:
> > Hi,
> > 
> > 
> > 
> > I'm trying to compile for a buildroot assembled package for an arm926t
> > system (Atmel AT91SAM9G20)E10) for the e10 from synapse and what used to
> > work once, now errors out like this:
> > 
> > 
> > 
> > /usr/bin/gcc -std=gnu99 -I. -O2
> > -I/usr/local/src/E10-buildroot/br1202-main/output/host/include
> > -I/usr/local/src/E10-buildroot/br1202-main/output/host/usr/include -MT
> > clean-temp.o -MD -MP -MF .deps/clean-temp.Tpo -c -o clean-temp.o
> > clean-temp.c
> > 
> > In file included from clean-temp.h:22:0,
> > 
> > from clean-temp.c:23:
> > 
> > ./stdio.h:477:1: error: 'gets' undeclared here (not in a function)
> > 
> > _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
> > 
> > ^
> > 
> > mv -f .deps/c-ctype.Tpo .deps/c-ctype.Po
> > 
> > mv -f .deps/c-stack.Tpo .deps/c-stack.Po
> > 
> > make[4]: *** [clean-temp.o] Error 1
> > 
> > make[4]: *** Waiting for unfinished jobs....
> > 
> > mv -f .deps/gl_avltree_oset.Tpo .deps/gl_avltree_oset.Po
> > 
> > make[4]: Leaving directory
> > `/usr/local/src/E10-buildroot/br1202-main/output/build/host-m4-1.4.16/lib'
> > 
> > make[3]: *** [all] Error 2
> > 
> > make[3]: Leaving directory
> > `/usr/local/src/E10-buildroot/br1202-main/output/build/host-m4-1.4.16/lib'
> > 
> > make[2]: *** [all-recursive] Error 1
> > 
> > make[2]: Leaving directory
> > `/usr/local/src/E10-buildroot/br1202-main/output/build/host-m4-1.4.16'
> > 
> > make[1]: *** [all] Error 2
> > 
> > make[1]: Leaving directory
> > `/usr/local/src/E10-buildroot/br1202-main/output/build/host-m4-1.4.16'
> > 
> > make: ***
> > [/usr/local/src/E10-buildroot/br1202-main/output/build/host-m4-1.4.16/.sta
> > mp_built] Error 2
> > 
> > root at regDesktopHome:/usr/local/src/E10-buildroot/br1202-main#
> > 
> > 
> > 
> > I don't get it, why would gets be undeclared? How can I get this fixed
> > please?
> 
> As the error says, gets() shouldn't be used. It has been deprecated a while
> now. Since this error pops up when building a host package (host-m4), it
> uses the host compiler. My guess is that you upgraded either the host
> compiler or the C library to a more recent version, compared to before when
> it used to work for you.

Yes, that is right! The host has been upgraded since...

> Have you tried using a more recent version of buildroot? I'd assume
> that m4 has been fixed in the mean time to stop using gets().

I've now downloaded br 2013.11. Can I somehow copy the configuration from my original 
buildroot directory over to this new one? Hoa do I do this best? Or what else is the 
suggested way to upgrade to a newer version?

> If upgrading buildroot, nor backporting patches that fix this issue is
> possible for you, you could try downgrading your host toolchain, or
> create a separate older installation of it, pointing buildroot to that
> instead of /usr/bin/gcc.
> 
> Best regards,
> Thomas

Thank you,
Ron
-- 
*ron eggler | semios | senior software engineer*
320 - 887 Great Northern Way | Vancouver, BC | V5T 4T5
T | 604 229 2044 ext 105[1]
C | 778 230 9442[2]
E | reggler at semios.com[3]
smart farming[4]
twitter[5] linkedin[6]

--------
[1] tel:604%20229%202044%20ext%20105
[2] tel:778%20230%209442
[3] mailto:reggler at semios.com
[4] http://www.semios.com
[5] https://twitter.com/semios
[6] http://www.linkedin.com/company/semiosbio-technologies-inc?goback=%2Enmp_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1&trk=company_logo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131215/79d1c13e/attachment-0001.html>
