From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 9 Jun 2011 13:23:22 +0200
Subject: [Buildroot] [Feature Request] script to run after build
	completion
In-Reply-To: <4DEFF7EA.6080701@gmail.com>
References: <BANLkTinE6NPRM67GbdAXutwxOfeHGS_P_g@mail.gmail.com>
	<4DEFF7EA.6080701@gmail.com>
Message-ID: <BANLkTinzono1kmGg_pL2bVMfHg1qyN6sMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/6/9 Steve Calfee <stevecalfee@gmail.com>:
> On 06/08/11 13:40, Alper Y?ld?r?m wrote:
>> Hello,
>>
>> A feature i want to see in buildroot is to have a post build script to
>> run after image creation process, in other words just before "make"
>> returns to console. This way i can put my post build commands inside
>> this script. It will definitely ease my buildroot usage.
>>
>
> Hi Alper,
>
> Yes a post build script is useful. enter your script path in menuconfig
> target_filesystem_options -->
>
> It becomes in your .config something like:
> BR2_ROOTFS_POST_BUILD_SCRIPT=
> "$(TOPDIR)/target/device/beagleboard/patchrootfs.sh"

BR2_ROOTFS_POST_BUILD_SCRIPT is run before image creation, not after
(so you can change the rootfs before it is packaged). So I don't think
it is the right solution.

Best regards,
Bj?rn Forsman
