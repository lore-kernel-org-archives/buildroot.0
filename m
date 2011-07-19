From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 19 Jul 2011 16:51:51 +0200
Subject: [Buildroot] [PATCHv4] udev: bump to 172
In-Reply-To: <8762my4k8d.fsf@macbook.be.48ers.dk>
References: <4E25586E.1030509@visionsystems.de>	<87ei1m4llu.fsf@macbook.be.48ers.dk>
 <4E2560AA.20603@visionsystems.de> <8762my4k8d.fsf@macbook.be.48ers.dk>
Message-ID: <4E259A07.7060800@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>  >> >From a quick look, I think the only pending issue is about the
>  >> UDEV_VOLUME_ID dependencies of usbmount/hal. What do we do about those?
>  >> I don't know much about udev/hal/usbmount, but presumably there's a way
>  >> forward here?
>
>  Yegor> It seems to become a lot of work :-)
>
> Yes, I know - Sorry about that. On the other hand, I cannot break the
> build for the existing users of hal/usbmount.

Never mind :-)

> Thanks for the links, will take a look


I looked at the latest usbmount 0.0.21 package hosted by Debian. It uses blkid, which is part of util-linux and busybox. The busybox one is not capable of delivering the needed info about partitions, so we really need util-linux. The present package is rather old and didn't want to get compiled. At first the package needs to be converted to autotarget and bumped to the newer version, which in turn seems to have issues with uclibc: http://permalink.gmane.org/gmane.comp.embedded.ptxdist.devel/7547.

That's my preliminary summary.

Yegor
