From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2011 22:25:24 +0200
Subject: [Buildroot] Switching to /dev/ttyX
In-Reply-To: <BANLkTi=_zF-UOK2PQPxewXb7bPO00mzuAQ@mail.gmail.com>
References: <BANLkTi=_zF-UOK2PQPxewXb7bPO00mzuAQ@mail.gmail.com>
Message-ID: <20110419222524.554c543d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 14 Apr 2011 09:50:17 +0200
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:

> tty1::respawn:/sbin/getty 38400 tty1
> tty2::respawn:/sbin/getty 38400 tty2
> tty3::respawn:/usr/bin/tail -f /var/log/messages
> 
> By default I'm connected to the board on a serial line, e.g. /dev/ttyS0
> 
> My question is: how can I access the other /dev/tty's?

I don't think you easily can. I'm not really a fan of those default
settings. Maybe we should just get rid of them, and keep a single getty
on the terminal port configured through menuconfig ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
