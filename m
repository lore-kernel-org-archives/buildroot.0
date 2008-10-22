From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Wed, 22 Oct 2008 14:06:09 +0200
Subject: [Buildroot] [RFC] Avoid make distclean to remove packages from
	rootfs
Message-ID: <e4c675870810220506q31952b43ta544bfbdcec64c4e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/21 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
> 2008/10/21 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
>> Hi to all,
>>
>>  I never used buildroot before 5 days ago but it seems to me that once
>> a package has been activated in menuconfig a way to remove it from
>> rootfs is saving .configs, make distclean; make (i.e.: I compiled Xorg
>> modular and then I move on tinyx but tinyx keyboard was not working
>> because some incompatible craps remained on the rootfs).

 [cut]

>  A solution could be:
>
>  1) make checks for previous .config and un-install all removed packages (*)
>  2) make saves the current .config into
> project_build_$ARCH/$project_name/previous.config
>  3) people who lose some rootfs customization do it because they
> choose to remove packages (their fault)
>
>  (*) supposing all packages have a make uninstall which correctly work
> otherwise N patches would be delivered to achieve this result.
>

 A proof of concept of the proposed general solution is attached as
solution for bug report n.5564

 http://busybox.net/bugs/view.php?id=5564

 as you can see checkconfig.sh could be expanded to work on .config
changes and acts accordingly

 Cheers,
-- 
/roberto
