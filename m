From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 16 Jan 2019 14:00:00 -0200 (BRST)
Subject: [Buildroot] /etc/init.d init script question
In-Reply-To: <SN6PR01MB50378585F4037C76C9DD6376CC870@SN6PR01MB5037.prod.exchangelabs.com>
References: <SN6PR01MB50378585F4037C76C9DD6376CC870@SN6PR01MB5037.prod.exchangelabs.com>
Message-ID: <1169191239.2324717.1547654399994.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Enoch W." <ixew@hotmail.com>
> To: "buildroot" <buildroot@busybox.net>
> Sent: Domingo, 13 de janeiro de 2019 20:57:48
> Subject: [Buildroot] /etc/init.d init script question

> Hi,

> I'm using a recent buildroot tag 2018.11 (651).

> Can anyone suggest how to debug a python script that starts well from a command
> line:

> # /etc/init.d/S53myscript start
> Starting myscript: OK

> but fails to start on boot via /etc/init.d/rcS

> It's a python script that is launched as follows:

> printf "Starting $DAEMON: "
> start-stop-daemon -S -b -m -q -p "$PIDFILE" -x "/usr/bin/python" --
> "/root/myscript.py"

> Since the $PIDFILE is well created rcS must have ended well and it's my python
> script to blame, but how can I see what exception it throws...

I suspect that your script fails because it needs something that is
initialized later.

> PS1. I've tried adding a long sleep in case "something" isn't ready.

> PS2. How can one simulate /etc/init.d/rcS environment ...

Init scripts run with stdin redirected to /dev/null so run it with

    # /etc/init.d/S53myscript start < /dev/null

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
