From: Charles Duffy <Charles_Duffy@messageone.com>
Date: Mon, 08 Dec 2008 13:01:22 -0600
Subject: [Buildroot] [PATCH] kpartx package
Message-ID: <ghjqu3$7qk$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kpartx (from the multipath-tools package) scans for partition tables in 
userland and uses the device-mapper subsystem to register them with the 
kernel. It is necessary for some device types, such as NBD, for which 
the kernel won't recognize partition tables on its own. (This also means 
that partition-table recognition can be removed from the kernel and done 
entirely in userland, if one so chooses).

The rest of multipath-tools is less useful in embedded systems, and so 
is not included here.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-kpartx.patch
Type: text/x-patch
Size: 2141 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081208/1aa98dde/attachment.bin 
