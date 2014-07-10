From: lee choon gay <choongay@yahoo.com>
Date: Thu, 10 Jul 2014 05:05:57 -0700
Subject: [Buildroot] About Buildroot+Qt+Qemu
In-Reply-To: <1404915107.70432.YahooMailBasic@web141706.mail.bf1.yahoo.com>
Message-ID: <1404993957.81297.YahooMailBasic@web141702.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.
I finally found a solution.
It is Qemu issue (my mistake in fact).
To execute Qemu to run Qt example, the command below is needed - add the "-usbdevice tablet".

qemu-system-i386 -kernel /path/to/kernel/bzImage -initrd /path/to/filesystem/rootfs.cpio -usbdevice tablet

Thanks.

--------------------------------------------
On Wed, 7/9/14, lee choon gay <choongay@yahoo.com> wrote:

 Subject: About Buildroot+Qt+Qemu
 To: buildroot at busybox.net
 Date: Wednesday, July 9, 2014, 10:11 AM
 
 Hi.
 I am beginner for the tools stated above.
 I am currently using Buildroot 2014.05, Released May 31st,
 2014 to build kernel linux-3.14.4 with qt-4.8.6 for arch
 i386/variant i686.
 Then execute the bzImage using Qemu.
 Inside Qemu, I execute ./sliders -qws, I can see the GUI
 perfectly and able to type using keyboard.
 The problem is I cannot control the mouse (even the mouse
 pointer seems moving - pointer appear at coordinate 0,0 and
 disappear at other coordinates).
 I can't do anything with the mouse, can't click widget.
 
 I am running out of idea. I tried with vnc, directfb and
 etc, but still can't solve the problem, other problems show
 up. 
 Any body can help me on this?
 
 Thank you very much.
 
