From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 7 Mar 2015 11:27:37 +0200
Subject: [Buildroot] SysV init script revamp (proposal)
In-Reply-To: <54FA0173.60504@zacarias.com.ar>
References: <54FA0173.60504@zacarias.com.ar>
Message-ID: <20150307092737.GA28097@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fri, Mar 06, 2015 at 04:35:15PM -0300, Gustavo Zacarias wrote:

> Before going all crazy sending patches and possibly wasting a lot of
> time i'll write up my thoughts on how we could enhance/fix/clean the
> current scenario regarding initscript:

A word of support, it's a mess at present.
And since I was doing something related I'll post it here too.

My goal was to merge initscripts, systemd, scriptless sysv and my own init,
with focus mostly on foreground daemons.
The result, however, seems to be pretty close to your proposal,
with uniform (generated, in fact) initscripts, and possibly also
uniform pid file handling.

https://github.com/arsv/br
long(ish) description of ideas behind this:
https://raw.githubusercontent.com/arsv/br/master/brinits

Sysv-style configuration is missing atm, the plan was
to pick any variables from .run files (see netsnmp/snmpd.run)
and write them to relevant /etc/config.d/*.conf files.

The limiting factor is that any non-trivial variable handling,
basically any conditions, are not going to work well with systemd
(example: package/tvheadend/S99tvheadend).
And I feel better about residing to simple ARGS=... vs dropping
systemd just because of this.
