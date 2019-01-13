From: Enoch W. <ixew@hotmail.com>
Date: Sun, 13 Jan 2019 22:57:48 +0000
Subject: [Buildroot] /etc/init.d init script question
Message-ID: <SN6PR01MB50378585F4037C76C9DD6376CC870@SN6PR01MB5037.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


I'm using a recent buildroot tag 2018.11 (651).


Can anyone suggest how to debug a python script that starts well from a command line:


# /etc/init.d/S53myscript start
Starting myscript: OK


but fails to start on boot via /etc/init.d/rcS


It's a python script that is launched as follows:


printf "Starting $DAEMON: "
start-stop-daemon -S -b -m -q -p "$PIDFILE" -x "/usr/bin/python" -- "/root/myscript.py"


Since the $PIDFILE is well created rcS must have ended well and it's my python script to blame, but how can I see what exception it throws...


Thanks!


Enoch.


PS1. I've tried adding a long sleep in case "something" isn't ready.

PS2. How can one simulate /etc/init.d/rcS environment ...
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190113/c65af677/attachment.html>
