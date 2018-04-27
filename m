From: Scott Fan <fancp2007@gmail.com>
Date: Fri, 27 Apr 2018 10:52:53 +0000
Subject: [Buildroot] [BUG] package host-ncurses cause display incorrect when
 'make linux-menuconfig'
Message-ID: <CAFkzVZYME-faSz7vrbny4Nb9BSexWWJcJ4F8dyT_Uk_sz3-Dww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, all:

I found when the BR2_PACKAGE_NCURSES config selected, AFTER building
completed, if i run 'make linux-menuconfig', screen will show various
unreadable char such as the attached.

If  i remove the following two lines:
NCURSES_DEPENDENCIES = host-ncurses
$(eval $(host-autotools-package))

then the display issue will not again. It is obvious that when building the
host-ncurses, it has incorrect configuration.

Any one can help me?

Thanks very much.

Scott Fan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180427/7bfe2eed/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Screenshot from 2018-04-27 18-45-58.png
Type: image/png
Size: 170112 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180427/7bfe2eed/attachment-0001.png>
