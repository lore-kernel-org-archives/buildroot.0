From: Cameron Hutchison <lists@xdna.net>
Date: Wed, 03 Feb 2010 23:51:05 -0000
Subject: [Buildroot] building buildroot is not successful
References: <4B69F280.9070301@hockings.net>
Message-ID: <64fd.4b6a0be9.6eec0@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"M.A. Hockings" <veeshooter@hockings.net> writes:

>I am trying to build buildroot on a Centos 5.4 box.  The build fails 
>with a permission denied error when accessing package/config/mconf but 
>it is not clear to me why.  

>-g -O2  mconf.o zconf.tab.o lxdialog/checklist.o lxdialog/util.o 
>lxdialog/inputbox.o lxdialog/textbox.o lxdialog/yesno.o 
>lxdialog/menubox.o -lncursesw -o mconf
>make[1]: Leaving directory `/media/disk/buildroot-2009.11/package/config'
>/bin/sh: package/config/mconf: Permission denied

At a guess I would say the /media/disk is mounted noexec. Run mount(8)
to check.
