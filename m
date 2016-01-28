From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 28 Jan 2016 17:02:57 +0000
Subject: [Buildroot] crontab: can't change directory to
 '/var/spool/cron/crontabs': No such file or directory
Message-ID: <1454000577.4304.27.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Just noticed this:
------------------>8-------------------
# crontab -e
crontab: can't change directory to '/var/spool/cron/crontabs': No such file or directory
------------------>8-------------------

Obvious solution is:
------------------>8-------------------
# mkdir -p /var/spool/cron/crontabs
------------------>8-------------------

But the question is if we want that to be done automatically and if
we do want how (read "where") to do it properly?

The point is crond is enabled by default in Busybox, see
https://git.busybox.net/buildroot/tree/package/busybox/busybox.config#n664
so users expect crond to just work but that doesn't happen :)

Any thoughts?

-Alexey
