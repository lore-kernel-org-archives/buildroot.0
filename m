From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 16:16:09 +0100
Subject: [Buildroot] Init and Supervisor start. Help please.
In-Reply-To: <CAEzGmjDXJ89vvGVfFBk4d3yJ3vbvjLA457yj6Gi_kYZYpct70Q@mail.gmail.com>
References: <CAEzGmjDXJ89vvGVfFBk4d3yJ3vbvjLA457yj6Gi_kYZYpct70Q@mail.gmail.com>
Message-ID: <20141118161609.6057089f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lennart Ramberg,

On Tue, 18 Nov 2014 15:01:38 +0100, Lennart Ramberg wrote:

> How should supervisor be automatically started?
> Is the below way to go (kiosk mode) in principle right?
> 
> /boot/grub/grub.cfg:
> 
> set default="0"
> set timeout="5"
> 
> menuentry "Buildroot" {
>     linux /bzImage root=/dev/sda1 init=/usr/bin/supervisord
> }
> 
> Setting init=/myprogram worked as expected. But but experimenting
> with letting supervisord start myprogram just caused kernel panic,
> so maybe I'm heading the wrong way?

Reading from http://supervisord.org/:

"""
It shares some of the same goals of programs like launchd, daemontools,
and runit. Unlike some of these programs, it is not meant to be run as
a substitute for init as ?process id 1?. Instead it is meant to be used
to control processes related to a project or a customer, and is meant
to start like any other program at boot time.
"""

So using supervisord as init doesn't seem to be the right thing to do.
Instead, use another init (whichever you want), and then use
supervisord to start/monitor your daemons/system services.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
