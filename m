From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 21:40:20 +0100
Subject: [Buildroot] [PATCH 0/4] audit: fix broken startup and make some
 improvements
In-Reply-To: <20181103164244.10607-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Sat, 3 Nov 2018 13:42:40 -0300")
References: <20181103164244.10607-1-casantos@datacom.com.br>
Message-ID: <87zhtw51sb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > I stomped on these problems while working on the logging init scripts,
 > so let's fix them right now, since this does not depend on other
 > changes.

 > Patch 1: Fixes broken auditd package. audispd is installed at /usr/sbin
 > but the configuration file pointed to /sbin, causing auditd to fail on
 > startup. Add a patch fixing auditd.conf.

 > Patch 2: Rename S01auditd to S02auditd to ensure that auditd is starded
 > after the syslog daemon, otherwise the initial log messages will be sent
 > to the console (and probably lost, since almost nobody watches the
 > system console on embedded systems).

 > Patch 3: Enable AUDIT in the kernel if the audit package is selected,
 > since auditd is useless and fails to load otherwise.

 > Patch 4: Since we are here, bump audit to version 2.8.4.

 > Carlos Santos (4):
 >   audit: fix audispd path in auditd.conf
 >   audit: ensure that it starts after the logging daemon
 >   linux: enble AUDIT if the audit package is selected
 >   audit: bump to version 2.8.4

Committed series to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
