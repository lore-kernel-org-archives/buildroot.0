From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 16 Feb 2017 12:08:07 +0100
Subject: [Buildroot] [PATCH] perl-gd: fix build of native part
In-Reply-To: <20170215223950.3432ecaf@free-electrons.com>
References: <1487144532-1818-1-git-send-email-francois.perrad@gadz.org>
 <20170215223950.3432ecaf@free-electrons.com>
Message-ID: <CAB0FRstSJeVLxQzAoa55Yk9y=fO=U0HVj5jzTw2TtrHe9YfX2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-02-15 22:39 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Wed, 15 Feb 2017 08:42:12 +0100, Francois Perrad wrote:
>> EUMM don't find .xs file in subdirectory (only .pm files are handled)
>> So, let move lib/GD.xs in the root directory.
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> What is this fixing?
>
> Here, the following defconfig builds just fine:
>
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_PERL=y
> BR2_PACKAGE_PERL_GD=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> Is it just that the build succeeds, but it fails at runtime because the
> native part has been built/installed ?

Yes.

>
> Isn't moving GD.xs a dirty hack ? How was it working before ?
>

Previously, GD.xs was in the root directory, see
http://search.cpan.org/~lds/GD-2.53/MANIFEST

Fran?ois

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
