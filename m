From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 20 Jul 2011 16:44:46 +0200
Subject: [Buildroot] [PATCHv4] udev: bump to 172
In-Reply-To: <8762my4k8d.fsf@macbook.be.48ers.dk>
References: <4E25586E.1030509@visionsystems.de>	<87ei1m4llu.fsf@macbook.be.48ers.dk>
 <4E2560AA.20603@visionsystems.de> <8762my4k8d.fsf@macbook.be.48ers.dk>
Message-ID: <4E26E9DE.6000206@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 19.07.2011 12:50, schrieb Peter Korsgaard:
>>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:
> Hi,
>
>  >> >From a quick look, I think the only pending issue is about the
>  >> UDEV_VOLUME_ID dependencies of usbmount/hal. What do we do about those?
>  >> I don't know much about udev/hal/usbmount, but presumably there's a way
>  >> forward here?
>
>  Yegor> It seems to become a lot of work :-)
>
> Yes, I know - Sorry about that. On the other hand, I cannot break the
> build for the existing users of hal/usbmount

So I looked at usbmount stuff. As far as I understand it is not working. See this thread: http://lists.busybox.net/pipermail/buildroot/2011-April/042454.html

The usbmount.mk file is not installing the usbmount.rules file, so udev knows nothing about this script. I bumped the package to the newest version and instructed the installer to put rules files to /lib/udev/rules.d/ but still it is not working. I'm not the biggest udev expert yet, so if someone could take a look at the patch I will send, it would really help. The package itself should depend on util-linux, so it has nothing to do with volume_id any more.

Because of this and the fact, that hal is deprecated in favor of udev, udev can bumped now. What do you think about it?

Best regards,
Yegor
