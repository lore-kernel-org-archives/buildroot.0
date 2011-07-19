From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 19 Jul 2011 12:47:06 +0200
Subject: [Buildroot] [PATCHv4] udev: bump to 172
In-Reply-To: <87ei1m4llu.fsf@macbook.be.48ers.dk>
References: <4E25586E.1030509@visionsystems.de>
 <87ei1m4llu.fsf@macbook.be.48ers.dk>
Message-ID: <4E2560AA.20603@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 19.07.2011 12:21, schrieb Peter Korsgaard:
>>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:
>  Yegor> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
>  Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> Thanks - It would be good if you in the future could list (after the ---
> line so it doesn't become part of the commit message) what you have
> changed since the previous version.
>
> >From a quick look, I think the only pending issue is about the
> UDEV_VOLUME_ID dependencies of usbmount/hal. What do we do about those?
> I don't know much about udev/hal/usbmount, but presumably there's a way
> forward here?

It seems to become a lot of work :-) At first see here: http://www.mail-archive.com/lfs-dev at linuxfromscratch.org/msg13353.html

AFAIK vol_id stuff is now in util-linux-ng. This package in BR is rather out-of-date. That is the first TODO.

The new version of usbmount is not using vol_id any longer (0.0.19). But it would be tricky to update it. I can see all files in websvn http://anonscm.debian.org/viewvc/usbmount/usbmount/trunk/, but I cannot checkout the repository and this new version is not published, so one could download the archive file. That is the second TODO.

HAL is the third one.

Yegor
