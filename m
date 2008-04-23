From: Li Liang <li.liang@neomeridian.com>
Date: Wed, 23 Apr 2008 13:38:30 +1000
Subject: [Buildroot] Error:"Staging_dir/lib/libc.so.0: could not read
	symbols:file in wrong format" while "make" buildroot with
	xscale, gcc-4.2.3
In-Reply-To: <6311fe0b0804220845q232b2ce3h41713d533eeb40f@mail.gmail.com>
References: <1208876655.480dfe6f0bef5@www.server101.com>
	<6311fe0b0804220845q232b2ce3h41713d533eeb40f@mail.gmail.com>
Message-ID: <1208921910.480eaf36b427a@www.server101.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The same error message appeared again as following while I executed "make" after
"make menuconfig"

/home/user/workspace/MFSP/uCroot/buildroot/build_armeb/staging_dir/lib/libc.so.0:
could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[4]: *** [libgcc_s.so] Error 1
make[4]: Leaving directory
`/home/user/workspace/MFSP/uCroot/buildroot/toolchain_build_armeb/gcc-4.2.3-final/gcc'
make[3]: *** [stmp-multilib] Error 2
make[3]: Leaving directory
`/home/user/workspace/MFSP/uCroot/buildroot/toolchain_build_armeb/gcc-4.2.3-final/gcc'
make[2]: *** [all-gcc] Error 2
make[2]: Leaving directory
`/home/user/workspace/MFSP/uCroot/buildroot/toolchain_build_armeb/gcc-4.2.3-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/user/workspace/MFSP/uCroot/buildroot/toolchain_build_armeb/gcc-4.2.3-final'
make: ***
[/home/user/workspace/MFSP/uCroot/buildroot/toolchain_build_armeb/gcc-4.2.3-final/.compiled]
Error 2

I am using the following packages to build the tool-chain:

kernel 2.6.24
uClibc 0.9.29
binutils 2.18
gcc 4.2.3

~LL



Quoting Rex Ashbaugh <rexa@xeratech.com>:

> Try performing the last failing operation again (move to the correct
> directory and copy the last command from the console window, then execute
> it)
> while also inserting the --verbose flag (or whatever the verbose flag is).
> This may give you a few more clues.
> -Rex
>
>
> On Tue, Apr 22, 2008 at 8:04 AM, Li Liang <li.liang@neomeridian.com> wrote:
>
> > I have struggled with this problem for few days. Actually I found a
> > similar
> > subject in
> >
> > http://busybox.net/lists/buildroot/2007-October/005854.html
> >
> > However, I checked the mentioned patch in that thread, it actually applied
> > to
> > the gcc-4.2.3. Unfortunately, the issue wasn't be solved. Moreover, I
> > couldn't
> > find further useful info regarding to this problem. I really appreciate if
> > anyone could tell me the solution. If any further log or info could help
> > to
> > diagnose this issue,please don't hesitate to ask me. Thank you very much
> > in
> > advance.
> >
> > ~LL
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
>
