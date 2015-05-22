From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 22 May 2015 09:57:12 +0200
Subject: [Buildroot] [PATCH 11/13] board/boundarydevices: update
	6x_bootscript
In-Reply-To: <20150521190509.044f7661@free-electrons.com>
References: <1432116744-25760-1-git-send-email-gary.bisson@boundarydevices.com>
 <1432116744-25760-12-git-send-email-gary.bisson@boundarydevices.com>
 <20150521190509.044f7661@free-electrons.com>
Message-ID: <CAAMH-yt2G4rVszAoWRYQEQZ4rYzs_XC0jG1oEnLU1vjQYhxkng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thu, May 21, 2015 at 7:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Gary,
>
> On Wed, 20 May 2015 12:12:22 +0200, Gary Bisson wrote:
>> This script is executed by u-boot in order to detect the hardware
>> configuration (board, displays etc...) and configure the bootargs and
>> device tree accordingly.
>>
>> This update is necessary due to the kernel bump to version 3.10.53.
>>
>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>
> I know this file is not introduced by your patch, but why do we have
> this binary file in Buildroot? Isn't there a source form of this file?

Yes actually there is, I just removed the Yocto-specific part of this script:
https://github.com/boundarydevices/u-boot-imx6/blob/staging/board/boundary/nitrogen6x/6x_bootscript-yocto-3.10.53.txt

Same goes for the other script/binary:
https://github.com/boundarydevices/u-boot-imx6/blob/staging/board/boundary/nitrogen6x/6x_upgrade.txt

I'll make a V2 that adds BR2_PACKAGE_HOST_UBOOT_TOOLS to the
nitrogen6x_defconfig and modify our post-build.sh to generate the
binaries from the .txt files.

Thanks,
Gary
