From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 28 Feb 2015 00:46:11 +0100
Subject: [Buildroot] error in skeleton  ?
In-Reply-To: <87zj7zyqij.fsf@dell.be.48ers.dk>
References: <F7D7D32518D04BB5BEB5B0B4D484022D@JohanW7>
 <87zj7zyqij.fsf@dell.be.48ers.dk>
Message-ID: <33C946992B0B426D816DA8DF2CC39BD1@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
-----Oorspronkelijk bericht-----
Van: buildroot [mailto:buildroot-bounces at busybox.net] Namens Peter Korsgaard
Verzonden: vrijdag 27 februari 2015 22:49
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] error in skeleton ?

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 > Hi

 > In system/skeleton : the /dev/log is a symlink to /tmp/log  > I think this should be a symlink to /var/log 

Well, /dev/log is normally a unix socket to syslog, and /var/log is a symlink to /tmp/, so making it point to /var/log (E.G. /tmp)
doesn't make much sense.

With that said, unless you are using a static /dev instead of devtmpfs (which you really shouldn't be doing), it doesn't matter as
devtmpfs puts a ramdisk on top of /dev.

--
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot


Dear Peter;

Agreed, does not make sense to create directories in a mountpoint with devtmpfs.

Just wondering if the device_table.txt needs an entry for the /run directory introduced in 2015-02-rc1

Best regards ,Johan
