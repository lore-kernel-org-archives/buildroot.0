From: Massimo Callegari <massimocallegari@yahoo.it>
Date: Wed, 3 Oct 2012 09:27:44 +0100 (BST)
Subject: [Buildroot] read-only NFS devtmpfs mount fails
In-Reply-To: <20121002172931.297a7cd7@skate>
References: <1349189984.20063.YahooMailNeo@web171606.mail.ir2.yahoo.com>
 <20121002172931.297a7cd7@skate>
Message-ID: <1349252864.57368.YahooMailNeo@web171605.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My bad ! I was using a kernel built before enabling devtmpfs on Buildroot.
I should have checked /proc/filesystems before !

All sorted. Thank you very much


________________________________
 Da: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
A: Massimo Callegari <massimocallegari@yahoo.it> 
Cc: "buildroot at busybox.net" <buildroot@busybox.net> 
Inviato: Marted? 2 Ottobre 2012 17:29
Oggetto: Re: [Buildroot] read-only NFS devtmpfs mount fails
 
Dear Massimo Callegari,

On Tue, 2 Oct 2012 15:59:44 +0100 (BST), Massimo Callegari wrote:

> 
> 
> I've read a lot of forums and docs and checked everything I could.?
> On my kernel folder: "grep TMPFS .config"?says:
> CONFIG_DEVTMPFS=y
> CONFIG_DEVTMPFS_MOUNT=y

This option normally mounts automatically devtmpfs at boot time, even
before your init application starts. So normally, you have nothing to
do in userspace to get devtmpfs ready.

Are you sure you are running a kernel that has this configuration?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121003/93359112/attachment.html>
