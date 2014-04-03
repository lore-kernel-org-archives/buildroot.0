From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Thu, 03 Apr 2014 19:33:43 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-04-02
References: <20140403063009.526E4101924@stock.ovh.net>
Message-ID: <nki01bxvlk.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed to Andy]

Hi,

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140403063009.526E4101924 at stock.ovh.net: 

> i686 |     xserver_xorg-server-1.15.0 | NOK |
>       http://autobuild.buildroot.net/results/b19eb6f08b4841a3a74c53a61394
>       78f4b7a6922d/
> i686 |     xserver_xorg-server-1.15.0 | NOK |
>       http://autobuild.buildroot.net/results/34db6b6072c7c94c32ffab1e8a0c
>       8b2f6ed56ad3/

  CCLD     Xfbdev
/home/peko/scratch/host/usr/i686-buildroot-linux-
uclibc/sysroot/usr/lib/libunwind.so: undefined reference to `setcontext'
/home/peko/scratch/host/usr/i686-buildroot-linux-
uclibc/sysroot/usr/lib/libunwind.so: undefined reference to `sigreturn'
collect2: error: ld returned 1 exit status
make[4]: *** [Xfbdev] Error 1

During testing I did not see such an error here, but in the past this error 
was already discussed:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/61929

But it seems that the discussion did not continue, libunwind landed one day 
later in buildroot, quoting Andy: "Pending the outcome of that question, I'll 
put in the config a dependency of !BR2_TOOLCHAIN_*_<uclibc>."

Maybe this is still necessary?

Regards, Bernd
