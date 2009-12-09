From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 9 Dec 2009 09:12:47 -0600
Subject: [Buildroot] ARM OABI/EABI problem
In-Reply-To: <87ws0wl0v8.fsf@macbook.be.48ers.dk>
References: <OF3B98716C.764E06F3-ONC1257686.0021143A-C1257687.002A0DD7@mentat.hu>
	<87ws0wl0v8.fsf@macbook.be.48ers.dk>
Message-ID: <200912090912.49202.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed December 9 2009, Peter Korsgaard wrote:
> >>>>> "peter" == peter stosz <peter.stosz@mentat.hu> writes:
> 
> Hi,
> 
>  peter> Please explain me, how to build complete OABI 'style' sytem to
>  peter> ARM (RM9200) target.
> 
>  peter> I try to compile a minimal Linux 2.6.27 with Busybox 1.15
>  peter> system.  I must OABI, because I need Floating Point Emulator,
>  peter> but it depends on !AEABI || OABI_COMPAT
> 
> Really? Softfloat is a lot faster than kernel emulation.
> 
>  peter> As you see (on Build option section) I leave
>  peter> BR2_GNU_TARGET_SUFFIX on the default "linux-uclibcgnueabi" When
>  peter> I change it to "linux-uclibc", I get the following error:
> 
> You should use linux-uclibc for OABI.
> 
>  peter> warning: working around missing syslimits.h
>  peter> cp: stat ?/srv/buildroot/output/staging/lib/gcc-lib/arm-linux-uclibc/4.4.2/
>  peter> include/syslimits.h? sikertelen: Nincs ilyen f?jl vagy k?nyvt?r  <-- No such
>  peter> file or directory
>  peter> make: *** [/srv/buildroot/output/target/usr/bin/gcc] Error 1
> 
> Hmm, could you try with gcc 4.3.4? I've compiled OABI with 4.3.4 without
> problems, but I've never tried 4.4.x.
> 
> Remember to run make clean after any toolchain changes.
> 
>  peter> Build environment:
>  peter> Ubuntu 9.10 x64 (Hungarian)
>  peter> bash, not dash
>  peter> make as root
>

Ah, that may be part of your problem, I did that (by mistake)
several times.

Make sure to change the entire tree back to owned as your own
user name, then *only* work under your own username!
chown -R usrname:usrname *
from the top of the build tree.

If using a GIT clone, you can also get things screwed up if
you do your updates (pull) as root - always do those as
your own user name.

*never* run any build system as "root" - -
All it takes is one typo in the wrong place and your entire
machines software installation might as well be in /dev/null

Mike 
> Don't do that! Buildroot is designed to work without root permissions,
> and I give absolutely NO guarantee that we won't make a mistake and
> accidently overwrite/delete something, especially if you use a git
> snapshot.
> 
>  peter> Buildroot 2009.11
>  peter> 2nd error message on BR daily snapshot (091205)
> 
