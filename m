From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 17 Dec 2014 15:03:12 +0000
Subject: [Buildroot] [PATCH] system: add "askfirst shell" as an option
 for busybox init
In-Reply-To: <20141216081450.6438bdb6@free-electrons.com>
References: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
 <20141216081450.6438bdb6@free-electrons.com>
Message-ID: <1418828592.4132.7.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2014-12-16 at 08:14 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Mon, 15 Dec 2014 11:56:24 +0300, Alexey Brodkin wrote:
> > Consider following cases:
> >  * Buildroot only builds rootfs that could be used on systems with
> >    different default serial ports (ttyS0, ttyS1, ttyAMA3 etc)
> 
> To achieve this, there is no need for a new option, just specify
> "console" as the terminal on which to run getty. The only change needed
> is to add "console" to /etc/securetty.

Well, actually putting "console" in BR2_TARGET_GENERIC_GETTY_PORT
resolves only part of issues - need to specify particular tty.

But still we have serial port settings like baudrate.
BR2_TARGET_GENERIC_GETTY_BAUDRATE_x must match your serial port
settings.

So we're loosing flexibility of my approach here, but what is even more
important imagine if there're 2 serial ports in the system and they have
different baudrates but both properly described in kernel bootargs. With
BR2_TARGET_GENERIC_GETTY only 1 console could be used then but not
either of them.

-Alexey
