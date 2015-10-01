From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  1 Oct 2015 16:32:50 +0000 (UTC)
Subject: [Buildroot] [Bug 8381] make manuconfig problem in opensuse 13.2
In-Reply-To: <bug-8381-163@https.bugs.busybox.net/>
References: <bug-8381-163@https.bugs.busybox.net/>
Message-ID: <20151001163250.AF06581DDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8381

--- Comment #5 from Vicente Olivert Riera <vincent.riera@imgtec.com> 2015-10-01 16:32:50 UTC ---
Hello Zurab,

I just installed OpenSUSE 13.2 on a virtualbox and I ran Buildroot's menuconfig
successfully:

---------------------------------------------
Last login: Thu Oct  1 12:17:26 2015
Have a lot of fun...
vriera at linux-oy96:~> cat /etc/SuSE-release 
openSUSE 13.2 (x86_64)
VERSION = 13.2
CODENAME = Harlequin
# /etc/SuSE-release is deprecated and will be removed in the future, use
/etc/os-release instead
vriera at linux-oy96:~> cd buildroot/
vriera at linux-oy96:~/buildroot> make menuconfig
configuration written to /home/vriera/buildroot/.config

*** End of the configuration.
*** Execute 'make' to start the build or try 'make help'.

vriera at linux-oy96:~/buildroot> grep Libs /usr/lib64/pkgconfig/ncursesw.pc 
Libs:  -lncursesw -ltinfo
Libs.private: 
vriera at linux-oy96:~/buildroot>
---------------------------------------------

These are the ncurses packages I have installed:

vriera at linux-oy96:~> rpm -qa | grep ncurses
ncurses-utils-5.9-52.2.3.x86_64
ncurses-devel-5.9-52.2.3.x86_64
libyui-ncurses-pkg6-2.46.1-2.1.9.x86_64
libncurses6-5.9-52.2.3.x86_64
libyui-ncurses6-2.46.6-2.1.9.x86_64
libncurses5-5.9-52.2.3.x86_64

Regards,

Vincent.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
