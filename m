From: Andreas Ehmanns <universeii@gmx.de>
Date: Thu, 10 Dec 2015 20:34:23 +0100
Subject: [Buildroot] Add config to nfsd to set number of threads
Message-ID: <5669D3BF.2070207@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,
actually the nfs-utils package provides an NFS server together with an 
init script. The number of threads the NFS server shall use is 
hard-coded in the init script. The attached patch moves this parameter 
to a config file under /etc which is read by the init script.

Additionally the return value of the init script in case of an not 
existing file has been changed from 0 to 2 to indicate an error condition.

What do you think?

Regards,
Andreas

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Make-number-of-nfsd-threads-configurable.patch
Type: text/x-patch
Size: 2216 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151210/66a34828/attachment.bin>
