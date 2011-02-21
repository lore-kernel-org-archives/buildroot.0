From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Mon, 21 Feb 2011 22:27:33 +0100
Subject: [Buildroot] No response after "Freeing init memory"
In-Reply-To: <AANLkTi=MvzvzNPOMm+3xq8Y_H72PmYC5KV7Gb2gQ5=t-@mail.gmail.com>
References: <AANLkTimNjQwt1HtqQLCcnsVWtSp7=3Mb2M_00EMsdOzS@mail.gmail.com>
	<AANLkTi=MvzvzNPOMm+3xq8Y_H72PmYC5KV7Gb2gQ5=t-@mail.gmail.com>
Message-ID: <AANLkTik-Az=UyGxOc05_v1CowLcy-B6twEHzbcDQyQgW@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/2/21 Charles Krinke <charles.krinke@gmail.com>:
> Dear Zdenek:
>
> Usually when the terminal is quiet (no characters) after printing "Freeing
> init memory", it means the init process and its associated /etc/inittab is
> not quite setup completely.
>
> So, in looking at this, I would look at your definitions of ttyS0, the
> "getty" in /etc/inittab and maybe enable generic console support in
> buildroot on ttyS0.

One way to ensure a working console (since the console= paramters in
cmdline seems to work) is to add the following line into your
/etc/inittab:

::respawn:-/bin/sh

That will open up /bin/sh directly on the same console already in use
by the kernel.
