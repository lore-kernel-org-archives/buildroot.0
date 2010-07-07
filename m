From: Ossy <ossy1980@gmx.net>
Date: Wed, 07 Jul 2010 22:41:55 +0200
Subject: [Buildroot] init: I won't write compressed data to a terminal.
In-Reply-To: <87aaq358x1.fsf@macbook.be.48ers.dk>
References: <4C33AB4E.9050604@gmx.net>	<AANLkTimdJ34gAH-YTjfOkW_iEsKZyRvBVnbLIS55oMdd@mail.gmail.com>	<4C34E18F.4080109@gmx.net>
	<87aaq358x1.fsf@macbook.be.48ers.dk>
Message-ID: <4C34E693.9040307@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 07.07.2010 22:33, schrieb Peter Korsgaard:
>>>>>> "Ossy" == Ossy<ossy1980@gmx.net>  writes:
>   Ossy>  After passing init=/bin/sh to the kernel, I ran into a similar error:
>   Ossy>  [    4.387550] eth0: link up, 100 Mb/s, full duplex, flow control disabled
>   Ossy>  [    4.716652] Looking up port of RPC 100003/2 on 192.168.1.106
>   Ossy>  [    4.727962] Looking up port of RPC 100005/1 on 192.168.1.106
>   Ossy>  [    4.739261] VFS: Mounted root (nfs filesystem) on device 0:12.
>   Ossy>  [    4.745153] Freeing init memory: 112K
>   Ossy>  sh: I won't write compressed data to a terminal.
>   Ossy>  sh: For help, type: `sh --help'.
>
> Hmm, Did something overwrite your busybox binary? It should be around
> ~500KB big.
>
> What does strings -n 25 bin/busybox|head give?
ossy at debian-virtual:/exports/rootfs/rfs1$ strings -n 25 bin/busybox|head
bzip2: I'm not configured correctly for this platform!
         I require Int32, Int16 and Char to have sizes
         of 4, 2 and 1 bytes to run properly, and they don't.
         Probably you can fix this by defining them correctly,
is suspiciously (more than %d chars) long.
Try using a reasonable file name instead.  Sorry! :-)
%s: Deleting output file %s, if it exists.
%s: WARNING: deletion of output file (apparently) failed.
%s: WARNING: deletion of output file suppressed
%s:    since input file no longer exists.  Output file
ossy at debian-virtual:/exports/rootfs/rfs1$

I'm compiling for target arm926 on an amd64 debian squeeze.

My busybox is not 500kb big ... (shared vs. static?):
ossy at debian-virtual:/exports/rootfs/rfs1/bin$ ls -la busybox
-rwsr-xr-x 1 root root 78480 28. Jun 15:40 busybox
