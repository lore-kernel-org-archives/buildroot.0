From: Lee Essen <lee.essen@nowonline.co.uk>
Date: Mon, 26 Jan 2015 10:49:57 +0400
Subject: [Buildroot] pppd makefile moves /etc/PPP/resolv.conf
Message-ID: <38D70EB2-AE5E-475D-865B-7225F7CD5E26@nowonline.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The current pppd package makefile has a post extract hook that changes the ppp generated resolv.conf from /etc/ppp/resolv.conf to /etc/resolv.conf with a comment suggesting that this is done because /etc/ppp might not be writable (and this location isn't useful because of where the c library looks.)

My assumption is that the original location provided you with flexibility to do clever things in the ppp-up script (and that's certainly what I want to do)

If you don't set usepeerdns then it looks like the server names don't get requested, so the creation of this file seems to be all or nothing - there is no way to work with just the env vars.

With the current buildroot setup your resolv.conf is overwritten with no option to do anything clever.

Wouldn't it be better to use /var/run/ppp.resolv.conf (or something similar) or even leave it as it was and include a symlink in /etc/ppp ??

Thanks,

Lee.
