From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Apr 2014 22:31:50 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-02
In-Reply-To: <nki01bxvlk.ln2@ID-313208.user.individual.net>
References: <20140403063009.526E4101924@stock.ovh.net>
 <nki01bxvlk.ln2@ID-313208.user.individual.net>
Message-ID: <20140406203150.GC26684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Andy, All,

On 2014-04-03 19:33 +0200, Bernd Kuhls spake thusly:
> Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote
> in news:20140403063009.526E4101924 at stock.ovh.net: 
> 
> > i686 |     xserver_xorg-server-1.15.0 | NOK |
> >       http://autobuild.buildroot.net/results/b19eb6f08b4841a3a74c53a61394
> >       78f4b7a6922d/
> > i686 |     xserver_xorg-server-1.15.0 | NOK |
> >       http://autobuild.buildroot.net/results/34db6b6072c7c94c32ffab1e8a0c
> >       8b2f6ed56ad3/
> 
>   CCLD     Xfbdev
> /home/peko/scratch/host/usr/i686-buildroot-linux-
> uclibc/sysroot/usr/lib/libunwind.so: undefined reference to `setcontext'
> /home/peko/scratch/host/usr/i686-buildroot-linux-
> uclibc/sysroot/usr/lib/libunwind.so: undefined reference to `sigreturn'
> collect2: error: ld returned 1 exit status
> make[4]: *** [Xfbdev] Error 1
> 
> During testing I did not see such an error here, but in the past this error 
> was already discussed:
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/61929
> 
> But it seems that the discussion did not continue, libunwind landed one day 
> later in buildroot, quoting Andy: "Pending the outcome of that question, I'll 
> put in the config a dependency of !BR2_TOOLCHAIN_*_<uclibc>."
> 
> Maybe this is still necessary?

Yes, setcontext et al. were only added to uClibc master in early 2013:
    http://git.uclibc.org/uClibc/commit/?id=a8dc90eaaa5e6474beac828558d969b1aafee4af

So it is not yet in any release of uClibc.

Either we backport this (Hirk!) or we disable X.org on uClibc.
Count me in for disabling on uClibc.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
