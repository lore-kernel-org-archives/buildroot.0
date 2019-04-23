From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 23 Apr 2019 09:44:33 +0200
Subject: [Buildroot] TestPerlDBDmysql continues to fail
In-Reply-To: <20190422221208.3b4349c8@windsurf>
References: <20190422221208.3b4349c8@windsurf>
Message-ID: <CAB0FRsvE=G_FOFMsj8awHrCBK3fDJLqD1AZdCLaafsMJ90cQeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 22 avr. 2019 ? 22:12, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello Fran?ois,
>
> The test TestPerlDBDmysql continues to fail in Gitlab CI:
>
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/199339668
>
> Could you have a look and propose a fix for this issue ? I think it has
> been failing like this for quite some time, if I remember correctly.
>
>
I could reproduce the issue.
It is weird:
- the build step seems good, the image  rootfs.cpio is created
- but the system does not boot, there is a kernel panic, see
https://gitlab.com/buildroot.org/buildroot/-/jobs/199339668/artifacts/file/test-output/TestPerlDBDmysql-run.log

Outside the testing infrastructure, I could build an image with the module
perl-dbd-mysql and run successfully:
$ perl -v
$ perl -MDBI -e 1
$ perl -MDBD::mysql -e 1

Fran?ois



> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190423/dc1adb46/attachment.html>
