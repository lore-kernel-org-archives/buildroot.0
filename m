From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 21 May 2014 21:29:28 +0200
Subject: [Buildroot] psplash and systemd
In-Reply-To: <537C657F.4090106@ebo-enterprises.com>
References: <537C657F.4090106@ebo-enterprises.com>
Message-ID: <20140521192928.GA3672@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Wed, May 21, 2014 at 10:36:15AM +0200, Tom Deblauwe wrote:
> Hello,
>
> I am using psplash in my initramfs and it shows up a graphical
> bootscreen, but then the regular bootprocess starts and there I would
> like to continue showing the splash screen. I am using the 6d3336a
> commit of master buildroot. So I would like to use systemd. What is the
> best solution for this?

Please find attached a patch that installs two new services for using psplash
with systemd. These are inspired by the ones from Plymouth
(http://cgit.freedesktop.org/plymouth/tree/systemd-units/):

- psplash-start.service for starting psplash.
- psplash-quit.service for killing psplash when reaching multi-user.target.

I tested them on QEMU machines:

- on QEMU/x86, the boot is very quick, so the boot screen is not displayed for
  a long time.
- on QEMU/ARM, the boot takes longer, so the screen can be seen.

Besides, no progress messages are printed when booting (I have not found how
to do it yet).

Thought these configurations do not use an initramfs followed by a
switch-root, these service files should provide you a good start.

Best regards,
ELB
-------------- next part --------------
