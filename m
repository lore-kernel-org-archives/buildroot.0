From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 16 Jul 2012 06:36:26 -0700
Subject: [Buildroot] X11
In-Reply-To: <1342430946.70457.YahooMailNeo@web160701.mail.bf1.yahoo.com>
References: <1342430946.70457.YahooMailNeo@web160701.mail.bf1.yahoo.com>
Message-ID: <CALo-6+iMu-OWdU2cbK+iw62RBwRwXgSpN3dRgkn+uQde-1JnGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoran:

A few things to keep in mind. When building a linux kernel, there are
usually modules and they need to be added to the root filesystem. So,
one cannot build the linux kernel independently from the root file
system. Said differently, make sure you perform a "modules_install"
step with the kernel's INSTALL_MOD_PATH=<buildroot>/output/target and
then a make in buildroot after that.

Your errors make me think the framebuffer and input device are unknown
to your Xorg setup, so I would suspect a configuration of X more
quickly then a buildroot issue. For what it is worth, I am about to
embark on a similar journey this morning with an ARM and buildroot
only Qt instead of X.

Charles

On 7/16/12, Zoran Djordjevic <djdjdjole@yahoo.com> wrote:
> Hello
>
> I am trying to build XOrg server for ARM based board, using Buildroot .
> When starting it, I received error:
> FBDEV(0): FBIOPUT_VSCREENINFO: Invalid argument;
> Fatal server error:Addscreen/ScreenInit failed for driver 0- ?and later:
> xinit: giving up
> xinit: unable to connect to X server - no such file or directory
> xinit: server error
>
> ?File /usr/bin/X -exists on my device (ie. at?NFS).
> Attached is my Buildroot?.config file and xorg.conf that I created in
> etc/X11 folder.
> Kernel is build independently ie. out of Buildroot.
> Any help ?
>
> Thanks


-- 
Charles Krinke
