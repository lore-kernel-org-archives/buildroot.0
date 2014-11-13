From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Nov 2014 23:21:11 +0000 (UTC)
Subject: [Buildroot] [Bug 7628] Python SSL does not get built for Raspberry
	Pi
In-Reply-To: <bug-7628-163@https.bugs.busybox.net/>
References: <bug-7628-163@https.bugs.busybox.net/>
Message-ID: <20141113232111.826F5B0CF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7628

--- Comment #3 from tobias.meggendorfer+buildroot at gmail.com 2014-11-13 23:21:11 UTC ---
I attached my config, highlighting the following:
BR2_arm=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_PACKAGE_PYTHON3_PYC_ONLY=y
BR2_PACKAGE_PYTHON3_SSL=y
BR2_PACKAGE_PYTHON3_UNICODEDATA=y

find output/target/ -name "_ssl*" (in the buildroot main directory) definitely
is empty with the given configuration (at least on my machine)

The getty port apparently differs but I don't think this causes any issues. I'm
currently building with the modified getty port and PYC_ONLY=n, just in case,
will edit results in here.

I don't know how well the env is cleaned when compiling, so here is the output
of env:
TERM=xterm
SHELL=/bin/bash
XDG_SESSION_COOKIE=<cookie>
SSH_CLIENT=<ip & port>
SSH_TTY=/dev/pts/1
USER=<username>
LS_COLORS=<stuff>
MAIL=/var/mail/<username>
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
PWD=/home/<username>
LANG=de_DE.UTF-8
SHLVL=1
HOME=/home/<username>
LOGNAME=<username>
SSH_CONNECTION=<ip & port>
LESSOPEN=| /usr/bin/lesspipe %s
LESSCLOSE=/usr/bin/lesspipe %s %s
_=/usr/bin/env

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
