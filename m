From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Tue, 21 Oct 2008 13:10:04 +0200
Subject: [Buildroot] [DOCUMENTATION] newbie user feedback
In-Reply-To: <e4c675870810210328i3431dae1la15dfc1eaff09400@mail.gmail.com>
References: <e4c675870810210328i3431dae1la15dfc1eaff09400@mail.gmail.com>
Message-ID: <e4c675870810210410x78080561q796e78a4698a97cb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/21 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
> Hi to all,
>
>  I never used buildroot before 5 days ago but it seems to me that once
> a package has been activated in menuconfig a way to remove it from
> rootfs is saving .configs, make distclean; make (i.e.: I compiled Xorg
> modular and then I move on tinyx but tinyx keyboard was not working
> because some incompatible craps remained on the rootfs).
>
>  I know that would be not an easy solution because changing root
> should destroy user's personalization (1). However user's rootfs
> personalization could live in a different place and merged with
> buildroot rootfs. Skilled users could bypass this creating their own
> target's rootfs (2). Instead of "make distclean" they could be change
> the project name. So it is probably a just newbie issue but
> documentation:
>
>  1) says user's rootfs customization could go into
> project_build_$ARCH/root (where in real is
> project_build_$ARCH/$project_name/root)
>  2) says user's rootfs customization could go into
> target/generic/target_skeleton but the full hierarchy is not here
> present and there are some limitations
>  3) DOES NOT SAY: some changes in buildroot config needs to properly
> clean build_$ARCH and root to be correctly applied (probably it would
> be said in Backgroud section).
>  4) DOES NOT SAY: what is the best way to live with this limitation
> (probably it would be said in Backgroud section)..
>
>  Everything from a newbie users point of view, as subject reported, so
> it is possible that my critic could be completely wrong.
>

 I was referring to http://buildroot.uclibc.org/buildroot.html as documentation

 A solution could be:

 1) make checks for previous .config and un-install all removed packages (*)
 2) make saves the current .config into
project_build_$ARCH/$project_name/previous.config
 3) people who lose some rootfs customization do it because they
choose to remove packages (their fault)

 (*) supposing all packages have a make uninstall which correctly work
otherwise N patches would be delivered to achieve this result.

 Cheers,
-- 
/roberto
