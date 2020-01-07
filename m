From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 7 Jan 2020 08:56:04 +0100
Subject: [Buildroot] [PATCH v3 2/4] configs/qemu_arm_vexpress_tz:
 Armv7-A emulation with TrustZone services
In-Reply-To: <20191228123520.5e0c9e81@windsurf>
References: <20190322095818.19914-1-etienne.carriere@linaro.org>
 <20190322095818.19914-2-etienne.carriere@linaro.org>
 <20191228123520.5e0c9e81@windsurf>
Message-ID: <CAN5uoS9DVEj=o1_Okv4UETimmwtB5dkraK4QGGRvR+6p_4zn_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas and all,

My best wishes for this new year to you and your beloved.


On Sat, 28 Dec 2019 at 12:35, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Etienne,
>
> On Fri, 22 Mar 2019 10:58:16 +0100
> Etienne Carriere <etienne.carriere@linaro.org> wrote:
>
> >  board/qemu/arm-vexpress-tz/linux.fragment |   3 +
> >  board/qemu/arm-vexpress-tz/post-build.sh  |  10 ++
> >  board/qemu/arm-vexpress-tz/readme.txt     | 135 ++++++++++++++++++++++
> >  board/qemu/arm-vexpress-tz/u-boot.config  |   7 ++
> >  configs/qemu_arm_vexpress_tz_defconfig    |  47 ++++++++
> >  5 files changed, 202 insertions(+)
>
> This defconfig causes a build failure, reported at
> https://gitlab.com/buildroot.org/buildroot/-/jobs/389451835, like this:
>
> 486 Traceback (most recent call last):
> 487   File "scripts/pem_to_pub_c.py", line 61, in <module>
> 488     main()
> 489   File "scripts/pem_to_pub_c.py", line 24, in main
> 490     from Crypto.PublicKey import RSA
> 491 ImportError: No module named 'Crypto'
>
> Could you have a look ?
>

This issue was reported by Romain [1] when I posted an upgrade from
optee-3.5.0 to 3.7.0 in BR.
Actually, I'm still not sure I really understand the issue since optee-os.mk
already specifies pycrypto as a dependency.

OPTEE_OS_DEPENDENCIES = host-openssl host-python-pycrypto
host-python-pyelftools

Maybe it is an issue related to python versioning (2 vs 3)?
I'll try to have a look in the coming... days, but I quite busy on some
other topics.
Will do my best :|

Regards,
Etienne

[1]
http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-5-boot-optee-os-bump-version-to-3-7-0-tp237817p239519.html



> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200107/1b4a1431/attachment.html>
