From: John Schimandle <john_schimandle@hotmail.com>
Date: Wed, 22 Oct 2008 05:20:52 -0700
Subject: [Buildroot] [RFC] Avoid make distclean to remove packages
	fromrootfs
In-Reply-To: <e4c675870810220506q31952b43ta544bfbdcec64c4e@mail.gmail.com>
References: <e4c675870810220506q31952b43ta544bfbdcec64c4e@mail.gmail.com>
Message-ID: <COL0-DAV311F354B4DDD6CF6B394418D290@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I perform the following steps to rebuild the rootfs. It's fast and easy.

rm project_build_ARCH/PROJECT/.root
rm -rf project_build_ARCH/PROJECT/root

Once these steps are done then the next make will copy in a clean skeleton
template and all the other Makefiles will notice the install targets are
missing and they will install all the targets. This is the cleanest and
fastest method I have found because this only copies files.

Maybe this should be added to the top level Makefile.

John


-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On
Behalf Of Roberto A. Foglietta
Sent: Wednesday, October 22, 2008 5:06 AM
To: buildroot at uclibc.org
Subject: [Buildroot] [RFC] Avoid make distclean to remove packages
fromrootfs

2008/10/21 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
> 2008/10/21 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
>> Hi to all,
>>
>>  I never used buildroot before 5 days ago but it seems to me that 
>> once a package has been activated in menuconfig a way to remove it 
>> from rootfs is saving .configs, make distclean; make (i.e.: I 
>> compiled Xorg modular and then I move on tinyx but tinyx keyboard was 
>> not working because some incompatible craps remained on the rootfs).

 [cut]

>  A solution could be:
>
>  1) make checks for previous .config and un-install all removed 
> packages (*)
>  2) make saves the current .config into 
> project_build_$ARCH/$project_name/previous.config
>  3) people who lose some rootfs customization do it because they 
> choose to remove packages (their fault)
>
>  (*) supposing all packages have a make uninstall which correctly work 
> otherwise N patches would be delivered to achieve this result.
>

 A proof of concept of the proposed general solution is attached as solution
for bug report n.5564

 http://busybox.net/bugs/view.php?id=5564

 as you can see checkconfig.sh could be expanded to work on .config changes
and acts accordingly

 Cheers,
--
/roberto
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
