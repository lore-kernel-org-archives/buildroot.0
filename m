From: Microbit_Ubuntu <microbit@virginbroadband.com.au>
Date: Fri, 28 May 2010 04:58:43 +1000
Subject: [Buildroot] Buildroot 2010.05-rc3 released
In-Reply-To: <877hmpv7km.fsf@macbook.be.48ers.dk>
References: <877hmpv7km.fsf@macbook.be.48ers.dk>
Message-ID: <1274986723.7293.8.camel@ubuntu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,


On Thu, 2010-05-27 at 14:43 +0200, Peter Korsgaard wrote:
> Hi,
> 
> Buildroot 2010.05-rc3 is released - Go download it at:
> 
> http://buildroot.net/downloads/buildroot-2010.05-rc3.tar.gz
> 
> or
> 
> http://buildroot.net/downloads/buildroot-2010.05-rc3.tar.bz2
> 
> Or get it from Git:
> 
> git://git.buildroot.net/buildroot
> 
> Please give it a spin and report any problems to the mailing list or bug
> tracker. Many thanks to the people contributing to this release:
> 
> git shortlog -s -n 2010.05_rc2..
>     49  Peter Korsgaard
>     32  Thomas Petazzoni
>      1  Baruch Siach
>      1  Bj?rn Forsman
>      1  H Hartley Sweeten
>      1  Julien Boibessot
>      1  Nick Leverton
>      1  Yann E. MORIN
>      1  cmchao
> 
> Unless any big issues are found, expect the final 2010.05 release by the
> end of the week - So please give it a good test.
> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


While I started a clean install w/ ext toolchain (crosstool-ng -1.6.1),
I noticed that menuconfig still has a snag in it when starting from
scratch with config :

When HAL is not used and ext toolchain selected, udev & hotplug are
*not* displayed nor selected. 
busybox-show-others has to be enabled and they both have to be
explicitly enabled from there.
BR versions < 2009.11 turned 'em on when mdev was selected.

Perhaps it's deemed that HAL should be selected, dunno.

In any case, hotplug & udev should not be suppressed by SHOW_OTHERS,
since even busybox-1.16.1 does NOT offer them...

More feedback when I completely rebuild.

PS : ct-ng only offers "linuxthreads". So are we supposed to use
"stable/old" in BR or "new" (latter, I guess) ????
I seem to have had problems with that - invoking gdbserver prompts :
"can't load libthread_db.so.1".
This worked fine with internal toolchain... Anyone ?

HTH
Best regards,
Kris
