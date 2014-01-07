From: Ed Sutter <ed.sutter@alcatel-lucent.com>
Date: Tue, 07 Jan 2014 16:33:06 -0500
Subject: [Buildroot] command line regular expression substitution fails
Message-ID: <52CC7292.306@alcatel-lucent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm using buildroot for the first time to set up rootfs on an iMX6
based platform.  I've been debugging a startup issue and just realized
that the the line...

 >
 >for i in /etc/init.d/S??* ;do
 >
in /etc/init.d/rcS is failing because "S??*" is not being replaced by
the files that match that expression.  Then I just tried doing something
simple on the command line...

 >
 >#  ls /bin/m*
 >ls: /bin/m*: No such file or directory
 >

and I see that fails as well.  I'm guessing this is some kind of busybox
configuration (regex/readline/etc..) issue, but since I got it all 
through buildroot,
I figured I'd try here first.
Any ideas?
Thanks in advance,
Ed
