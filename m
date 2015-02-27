From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 22:48:52 +0100
Subject: [Buildroot] error in skeleton  ?
In-Reply-To: <F7D7D32518D04BB5BEB5B0B4D484022D@JohanW7> (Sagaert Johan's
 message of "Fri, 27 Feb 2015 19:45:35 +0100")
References: <F7D7D32518D04BB5BEB5B0B4D484022D@JohanW7>
Message-ID: <87zj7zyqij.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 > Hi

 > In system/skeleton : the /dev/log is a symlink to /tmp/log  
 > I think this should be a symlink to /var/log 

Well, /dev/log is normally a unix socket to syslog, and /var/log is a
symlink to /tmp/, so making it point to /var/log (E.G. /tmp) doesn't
make much sense.

With that said, unless you are using a static /dev instead of devtmpfs
(which you really shouldn't be doing), it doesn't matter as devtmpfs
puts a ramdisk on top of /dev.

-- 
Bye, Peter Korsgaard
