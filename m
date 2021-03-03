From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 3 Mar 2021 17:31:00 +0100
Subject: [Buildroot] Problems with generating an x86 Image
In-Reply-To: <8311428a-3ee1-6e00-78e5-064df934dbc5@gmx.de>
References: <98397e30-a396-803a-ddc4-ed31719eae51@gmx.de>
 <CAAXf6LVehreRKpkNMg2bY2KTsy2BL56dSOCVNUMUu5c7vNPzPw@mail.gmail.com>
 <8311428a-3ee1-6e00-78e5-064df934dbc5@gmx.de>
Message-ID: <CAAXf6LX1UsTwxLtbXNr+EHG6XQZS=Ra0F2=g2_KeppwTzvsBvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lukas,

On Wed, Mar 3, 2021, 17:16 Lukas Hecht <mixolydisch@gmx.de> wrote:

> Hi Thomas,
>
> maybe this idea could lead in the right direction. The process takes
> about 12 seconds from leaving grub till stopping to boot, which sounds
> about right to me for such a basic system.
>
> I did not change anything on the getty, etc/inittab shows:
> tty1::respawn:/sbin/getty -L tty1 0 vt100 # GENERIC_SERIAL
>
> My hardware has three serial ports but i don't know any more details
> about these at the moment.
>

Is it really a serial port? In that case I would expect ttyS0, ttyS1, ...
instead of tty0, tty1, ...

Also the baud rate will normally need to be specified.

Have a look at the corresponding option under the System menu in menuconfig.



> Is there an easy way (like with booting a live ubuntu) to find out if
> tty1 is the right one?
>

A basic approach is to open a getty on all tty's, by adding multiple getty
lines in /etc/inittab, each time for a different tty.

Best regards
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210303/85ea6fc0/attachment.html>
