From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 9 Oct 2017 17:42:17 -0300
Subject: [Buildroot] [PATCH v2] configs/imx6-sabresd: Add VPU decoding
	support
In-Reply-To: <20171009202523.ntymaz2dpdfy3atu@tarshish>
References: <1507579948-22128-1-git-send-email-festevam@gmail.com>
 <20171009202523.ntymaz2dpdfy3atu@tarshish>
Message-ID: <CAOMZO5AzkUhc=y75Mw1igVckkB4LvTJL0dEpscVRxQf-fGH6EQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Mon, Oct 9, 2017 at 5:25 PM, Baruch Siach <baruch@tkos.co.il> wrote:

>> +# For automatic firmware loading
>> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>
> Are you sure this is necessary for the kernel to load the firmware? As far as

Copy and paste error :-) Will fix in v3.

This is necessary for loading the coda driver as module.

In the imx_v6_v7_defconfig we changed the coda driver from built-in to module
in this commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm/configs/imx_v6_v7_defconfig?h=v4.14-rc4&id=a5a56f07c2726cc801efccd23f8df29af04d6d19

This is necessary to avoid issues when the coda driver is probed prior
to the rootfs getting mounted.

Thanks
