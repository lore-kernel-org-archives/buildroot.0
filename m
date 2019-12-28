From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Dec 2019 12:35:20 +0100
Subject: [Buildroot] [PATCH v3 2/4] configs/qemu_arm_vexpress_tz:
 Armv7-A emulation with TrustZone services
In-Reply-To: <20190322095818.19914-2-etienne.carriere@linaro.org>
References: <20190322095818.19914-1-etienne.carriere@linaro.org>
 <20190322095818.19914-2-etienne.carriere@linaro.org>
Message-ID: <20191228123520.5e0c9e81@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Etienne,

On Fri, 22 Mar 2019 10:58:16 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

>  board/qemu/arm-vexpress-tz/linux.fragment |   3 +
>  board/qemu/arm-vexpress-tz/post-build.sh  |  10 ++
>  board/qemu/arm-vexpress-tz/readme.txt     | 135 ++++++++++++++++++++++
>  board/qemu/arm-vexpress-tz/u-boot.config  |   7 ++
>  configs/qemu_arm_vexpress_tz_defconfig    |  47 ++++++++
>  5 files changed, 202 insertions(+)

This defconfig causes a build failure, reported at
https://gitlab.com/buildroot.org/buildroot/-/jobs/389451835, like this:

486 Traceback (most recent call last):
487   File "scripts/pem_to_pub_c.py", line 61, in <module>
488     main()
489   File "scripts/pem_to_pub_c.py", line 24, in main
490     from Crypto.PublicKey import RSA
491 ImportError: No module named 'Crypto'

Could you have a look ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
