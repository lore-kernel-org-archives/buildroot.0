From: gregory hermant <gregory.hermant@calao-systems.com>
Date: Thu, 16 Aug 2012 14:31:38 +0200
Subject: [Buildroot] [PATCH 1/1] calao: use zImage on usb-a9263 and
 usb-a9g20 lpw
In-Reply-To: <20120811231618.7fa6380c@skate>
References: <1344003028-9452-1-git-send-email-plagnioj@jcrosoft.com>
 <20120811231618.7fa6380c@skate>
Message-ID: <502CE82A.9060901@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi thomas,
I'm ok.
gregory

Thomas Petazzoni wrote:
> Gr?gory,
> 
> Since you are the person who added support for Calao USB-A9263 and
> Calao USB-A9G20-LPW, can you ACK the following patch if you're OK with
> it?
> 
> Thanks!
> 
> Thomas
> 
> Le Fri,  3 Aug 2012 16:10:28 +0200,
> Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> a ?crit :
> 
>> The board boot more fast with a zImage than a uImage
>> as the kernel will not have to be relocated during the decompression.
>>
>> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
>> ---
>>  configs/calao_usb_a9263_defconfig     |    1 +
>>  configs/calao_usb_a9g20_lpw_defconfig |    1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/configs/calao_usb_a9263_defconfig b/configs/calao_usb_a9263_defconfig
>> index 6612d2c..8094ea2 100644
>> --- a/configs/calao_usb_a9263_defconfig
>> +++ b/configs/calao_usb_a9263_defconfig
>> @@ -12,3 +12,4 @@ BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="usb_a9263"
>>  BR2_LINUX_KERNEL=y
>>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/usb-a9263/linux-3.4.4.config"
>> +BR2_LINUX_KERNEL_ZIMAGE=y
>> diff --git a/configs/calao_usb_a9g20_lpw_defconfig b/configs/calao_usb_a9g20_lpw_defconfig
>> index 580972a..36b6c9b 100644
>> --- a/configs/calao_usb_a9g20_lpw_defconfig
>> +++ b/configs/calao_usb_a9g20_lpw_defconfig
>> @@ -13,3 +13,4 @@ BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="usb_a9g20"
>>  BR2_LINUX_KERNEL=y
>>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/usb-a9g20-lpw/linux-3.4.4.config"
>> +BR2_LINUX_KERNEL_ZIMAGE=y
> 
> 
> 
