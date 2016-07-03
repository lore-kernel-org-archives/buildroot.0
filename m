From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 16:02:16 +0200
Subject: [Buildroot] [PATCH v3] package/quagga: Add systemd.service file
In-Reply-To: <1467533939-26606-1-git-send-email-nroach44@gmail.com> (Nathaniel
 Roach's message of "Sun, 3 Jul 2016 16:18:59 +0800")
References: <1467533939-26606-1-git-send-email-nroach44@gmail.com>
Message-ID: <87shvqx1jr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nathaniel" == Nathaniel Roach <nroach44@gmail.com> writes:

 > Use a template service file as all of the daemons use almost
 > identical arguments and generally appear the same to the init
 > system.

 > We "Wants=" zebra as that's the daemon for interfacing to the
 > kernel, and it's not required for the other daemons to work
 > but it's probably going to be used in nearly all setups.

 > /usr/bin/env is needed as systemd doesn't allow the instance
 > variable (%i) in the executable path.

 > We don't enable these services by default as this would require
 > creating configuration and /etc/default files. (And is easily
 > achieved with an FS overlay)

 > Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
 > ---
 > Changes v2 -> v3:
 >  - Remove invalid references to quagga.service (Arnout)
 >  - Check if the binary is executable before trying to start it
 >    (Arnout)
 >  - Remove PID file arguments and options (Arnout)
 >  - Add reload capability as the daemons do support it

Committed after removing killmode/killsignal/restartsec as suggested by
Maxime, thanks.

-- 
Bye, Peter Korsgaard
