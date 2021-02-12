From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Feb 2021 09:17:53 +0100
Subject: [Buildroot] Buildroot defconfig issues
In-Reply-To: <20210212091348.75f9cd17@windsurf.home>
References: <6025e87c3e3ce_c6a70d4128370@gitlab-sidekiq-catchall-v1-bb68c6455-8rbvh.mail>
 <20210212091348.75f9cd17@windsurf.home>
Message-ID: <582a548d-b9e3-39dc-f234-10a31e0a355d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/02/2021 09:13, Thomas Petazzoni wrote:
[snip]
>> Job #1023447067 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/1023447067/raw )
>>
>> Stage: test
>> Name: microchip_sam9x60ek_mmc_dev_defconfig
> 
> WARN: defconfig ./configs/microchip_sam9x60ek_mmc_dev_defconfig can't be used:
>       Missing: BR2_PACKAGE_GZIP=y
>       Missing: BR2_PACKAGE_GDB=y
>       Missing: BR2_PACKAGE_DOSFSTOOLS=y
>       Missing: BR2_PACKAGE_DOSFSTOOLS_FATLABEL=y
>       Missing: BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT=y
>       Missing: BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
>       Missing: BR2_PACKAGE_USBUTILS=y
>       Missing: BR2_PACKAGE_BLUEZ5_UTILS=y
>       Missing: BR2_PACKAGE_IPERF=y
>       Missing: BR2_PACKAGE_WGET=y
>       Missing: BR2_PACKAGE_VIM=y
> 
> I guess this is due to BR2_USE_WCHAR=y being missing in the defconfig.

 I propose to just remove this defconfig. We're not really happy with those
non-minimal defconfigs, right. I think it only makes sense to keep something
like that if there really is something board-specific in there, which is not the
case here I think.

 Regards,
 Arnout
