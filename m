From: hartleys <hartleys@visionengravers.com>
Date: Tue, 1 Jul 2008 13:21:56 -0400
Subject: [Buildroot] Ncurses install problem
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19092972E4@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I just did a clean (make package_name-dirclean) on my buildroot setup
and started a make. Everything goes along fine until it gets to the:

$(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION): ...

Section of ncurses.mk. A couple lines down in that section there is a:

	ln -sf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo

On that line I get the following during the make:

ln -sf /usr/share/terminfo
/home/bigguiness/buildroot/project_build_arm/ep9307/root/usr/lib/terminf
o
ln: creating symbolic link
`/home/bigguiness/buildroot/project_build_arm/ep9307/root/usr/lib/termin
fo' to `/usr/share/terminfo': Permission deined
Make: ***
[/home/bigguiness/buildroot/project_build_arm/ep9307/root/lib/libncurses
.so.5.6] Error 1

I'm not sure what changed but everything was working fine before I did
the -dirclean.

Any ideas why the link is failing?

Thanks,
Hartley
