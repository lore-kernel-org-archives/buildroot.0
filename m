From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Wed, 23 Apr 2008 10:06:00 +0200
Subject: [Buildroot] Failing NFS root mount
References: <067701c8a475$2df6d860$ad289e86@LPSC0173W>
	<20080422133843.GA5733@real.realitydiluted.com>
Message-ID: <06f001c8a518$e16c04d0$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm going to test the others' suggestions right now, but I have a little 
issue with this:

> /dev/log

It's the only device that was missing from my list.
I found several examples where the following line is added to 
device_table.txt:

/dev/log s 666 0 0 - - - - -

But upon making the filesystem, I get the following error on that line:

$ make
[...]
table='target/generic/device_table.txt'
makedevs: line 59: Unsupported file type s

And indeed I don't see 's' (socket) listed among f/d/c/b/p

IIRC, /dev/log should be created by syslogd (but not other loggers) upon its 
start.
I am indeed using syslog and I get a proper log in /tmp/messages. From the 
busybox config:
CONFIG_FEATURE_SYSLOG=y
CONFIG_LOGNAME=y
CONFIG_SETLOGCONS=y
CONFIG_FEATURE_INIT_SYSLOG=y
CONFIG_FEATURE_SU_SYSLOG=y
CONFIG_SYSLOGD=y
CONFIG_FEATURE_ROTATE_LOGFILE=y
CONFIG_FEATURE_REMOTE_LOG=y
CONFIG_FEATURE_SYSLOGD_DUP=y
# CONFIG_FEATURE_IPC_SYSLOG is not set
CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=
# CONFIG_LOGREAD is not set
# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
CONFIG_KLOGD=y
CONFIG_LOGGER=y
# CONFIG_SVLOGD is not set

So is /dev/log important or not ?
-- 
Guillaume Dargaud
http://www.gdargaud.net/Antarctica/
