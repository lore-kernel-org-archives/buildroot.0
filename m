From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Wed, 28 Nov 2012 03:36:44 -0800 (PST)
Subject: [Buildroot] Qt mouse, keyboard, touchscreen
In-Reply-To: <20121127163037.3f619184@skate>
References: <1353748764.40553.YahooMailNeo@web164602.mail.gq1.yahoo.com>
 <50B09888.9000907@relinux.de>
 <1353916198.97471.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <50B3210E.2010806@relinux.de>
 <1353917395.39625.YahooMailNeo@web164603.mail.gq1.yahoo.com>
 <50B32588.7010800@relinux.de>
 <1354002375.96935.YahooMailNeo@web164604.mail.gq1.yahoo.com>
 <20121127163037.3f619184@skate>
Message-ID: <1354102604.50307.YahooMailNeo@web164602.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've tried patch, you submitted, and then make qt-reconfigure and
receive strange error about include folders. Same error I had 
earlier when trying with deleting stamp files (when added some
options regarding Qt in Buildroot's menuconfig), and in that case 
I had to do make clean all. But if I do so, now, I think I will loose my 
patched files (am I right ?)
What to do then ? 
?

________________________________
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Zoran Djordjevic <djdjdjole@yahoo.com> 
Cc: Stephan Hoffmann <sho@relinux.de>; "buildroot at busybox.net" <buildroot@busybox.net> 
Sent: Tuesday, November 27, 2012 4:30 PM
Subject: Re: [Buildroot] Qt mouse, keyboard, touchscreen
  
Dear Zoran Djordjevic,

On Mon, 26 Nov 2012 23:46:15 -0800 (PST), Zoran Djordjevic wrote:

> My /dev/input node has event0, event1, mouse0 and mice.
> When I give: export QWS_MOUSE_PROTO=tslib:/dev/input/event0, 
> touch screen works fine. However, tried different options for
> USB?mouse, and neither one works (cat /dev/input/mouse0 or mice gives
> terminal "garbage"). Regarding keyboard, I gave: export
> QWS_KEYBOARD=linuxinput:/dev/input/event1 Keyboard (USB)?does work,
> but from that moment my terminal connected keyboard (via COM port) -
> doesn't work (Ctrl-C). When exiting application, I can't give
> commands via terminal. Any help ? 

Apply the attached patch to Qt.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121128/99be9bad/attachment.html>
