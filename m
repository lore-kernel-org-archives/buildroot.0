From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Fri, 6 Apr 2018 13:58:35 -0700
Subject: [Buildroot] [PATCH 1/2] configs/at91sam9g20dfc: add ubifs
 target filesystem
In-Reply-To: <20180406213643.4ed8180b@windsurf.home>
References: <1522963284-32258-1-git-send-email-joshua.henderson@microchip.com>
 <20180406213643.4ed8180b@windsurf.home>
Message-ID: <c3774a6d-081c-8bf0-1107-a7ea97ce783a@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/06/2018 12:36 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 5 Apr 2018 14:21:23 -0700, Joshua Henderson wrote:
> 
>>  # Filesystem
>>  BR2_TARGET_ROOTFS_TAR=y
>> +BR2_TARGET_ROOTFS_UBI=y
>> +BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2047
> 
> I guess these are the two options left after doing a "make
> savedefconfig". However, I would be more comfortable if you made
> explicit the other important options about UBI, like it is the case in
> other Atmel defconfigs:

Yes, that's what's left after a savedefconfig.  v2 patch sent with options
added.  Supports a good, known working defconfig after all.  Hard to find
consensus on this as the defconfigs are all over the place on whether or
not to include these options.

Josh

> 
> BR2_TARGET_ROOTFS_UBIFS=y
> BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x3e000
> BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x1000
> BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2082
> BR2_TARGET_ROOTFS_UBI=y
> BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
> BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
> 
> Thanks a lot!
> 
> Thomas
> 
