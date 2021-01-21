From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 21 Jan 2021 22:22:26 +0100
Subject: [Buildroot] Buildroot Touchscreen goes to coordinates 0 0
In-Reply-To: <CAONQdNmac47XOqi2kec20PbdohXW4jYov-sM3hDvDTsKZZmXTw@mail.gmail.com>
References: <CAONQdNmac47XOqi2kec20PbdohXW4jYov-sM3hDvDTsKZZmXTw@mail.gmail.com>
Message-ID: <20210121222226.279be2e9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sebasti?n,

On Tue, 19 Jan 2021 23:56:12 -0300, Sebasti?n Conti <sebaconti19@gmail.com> wrote:

> I think is a usb touchscreen that is plug and play and have speakers, but
> when I am trying to run a example from qt that you can draw, it draws a
> line from coordinates 0 0 to where my finger is.
> After installing evtest and building buildroot, the final coordinates of
> every touch are 0x 0y.
> 
> If I test evest on other linux distro it works perfectly.
> 
> Thanks
> 
> Init screen: https://i.stack.imgur.com/1NqWY.jpg
> 
> 
> Qt example: https://i.stack.imgur.com/xcnq4.jpg

Looks strange...

> 
> 
> Evtest: https://i.stack.imgur.com/Hqzce.jpg

As evtest (more or less) only shows the decoded events coming from
the kernel/driver, I would suspect some hardware/driver defect
(maybe kernel version dependent)..., did you test the exact same
touchscreen hardware on the same board with an different distro
(which kernel versions)?

As a second check your can try out as an alternative the libinput
debug events feature (see [1])...

Regards,
Peter

[1] https://wayland.freedesktop.org/libinput/doc/latest/tools.html#libinput-debug-events
