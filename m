From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 17 Mar 2021 22:31:13 +0100
Subject: [Buildroot] [PATCH v2 2/6] package/gnutls: disable package if
 binutils is affected from bug 21464
In-Reply-To: <20210314224438.3123e1f9@windsurf.home>
References: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
 <20210310091453.23611-3-giulio.benetti@benettiengineering.com>
 <20210314224438.3123e1f9@windsurf.home>
Message-ID: <d78f01ed-3cea-9d03-1d7b-b53ade187dbe@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 3/14/21 10:44 PM, Thomas Petazzoni wrote:
> On Wed, 10 Mar 2021 10:14:49 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> This package is affected from binutils bug 21464, since there is no
>> workaround, let's disable it.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/ce9/ce9050a183a3f1e31cefbc4d4a6d780235466e39/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> FYI, the latest build failure of gnutls on OpenRISC was in July 2020:
> 
>    http://autobuild.buildroot.net/?reason=gnutls%
> 
> Since then, no failure.
> 
> I just tested this configuration:
> 
> BR2_or1k=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_GNUTLS=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> and it builds fine.
> 
> Please double check that the failures and bugs still exist before
> sending patches. Thanks!

Yes, I confirm, this package build correctly now, while others not.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
