From: hedwin.koning at gmail.com <hedwin.koning@gmail.com>
Date: Mon, 16 Nov 2009 09:51:33 +0100
Subject: [Buildroot] Creating a filesystem for Real Time Linux using QEMU
In-Reply-To: <200911160805.13709.cristeab@gmail.com>
References: <200911160805.13709.cristeab@gmail.com>
Message-ID: <4B011295.8080801@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bogdan Cristea wrote:
> I have been able to use buildroot (buildroot-20091114.tar.bz2) in order to 
> build a filesystem for Real Time Linux. I have been able to boot Linux in QEMU 
> with the following command:
>
> qemu -kernel $LOCATION/bzImage \
>      -hda $LOCATION/rootfs.i686.ext2 \
>      -append "root=/dev/sda"
>
> However, the file system is detected as read only, which could be a problem 
> since I need to make my changes.
>
> Someone else suggested to use a different approach, based on initramfs option 
> (in build root menu) which loads the filesystem into RAM, but in this case the 
> changes are not permanent.
>
> Could you advise please ?
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>   
Hi

Add "rw" to your append command.

So change it to -append "root=/dev/sda rw"

Hedwin Koning
