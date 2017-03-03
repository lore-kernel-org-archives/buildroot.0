From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 3 Mar 2017 18:08:32 +0100
Subject: [Buildroot] [PATCH] configs/telit_evk_pro3: bump barebox to
	2017.01.0
In-Reply-To: <96704fd2-3a09-5149-96cd-665e7523291e@mind.be>
References: <20170301162345.22300-1-fabio.porcedda@gmail.com>
 <96704fd2-3a09-5149-96cd-665e7523291e@mind.be>
Message-ID: <CAHkwnC8bYHCSv9BPpQVdGZD-uhRFrxVS5aFk_ksOd1ntq0j2tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-03-01 20:04 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>  Hi Fabio,
>
>  Thanks for the update.
>
> On 01-03-17 17:23, Fabio Porcedda wrote:
>> This fix the build failure with gcc5 for barebox.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> ---
>>  ...13.04.0-0005-watchdog-enable-for-evk-pro3.patch | 26 ---------
>>  ...1.0-0001-watchdog-add-keep-alive-support.patch} | 36 +++++++------
>>  ...2-watchdog-add-at91sam9-watchdog-support.patch} | 36 ++++++++-----
>>  ...003-at91sam9260-9g20-add-wathdog-support.patch} | 27 ++++------
>>  ...004-at91sam9260-9g20-fix-wathdog-support.patch} |  8 +--
>>  ...17.01.0-0005-watchdog-enable-for-evk-pro3.patch | 61 ++++++++++++++++++++++
>>  configs/telit_evk_pro3_defconfig                   |  2 +-
>>  7 files changed, 120 insertions(+), 76 deletions(-)
>>  delete mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch
>>  rename board/telit/evk-pro3/{barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch => barebox-2017.01.0-0001-watchdog-add-keep-alive-support.patch} (73%)
>>  rename board/telit/evk-pro3/{barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch => barebox-2017.01.0-0002-watchdog-add-at91sam9-watchdog-support.patch} (90%)
>>  rename board/telit/evk-pro3/{barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch => barebox-2017.01.0-0003-at91sam9260-9g20-add-wathdog-support.patch} (67%)
>>  rename board/telit/evk-pro3/{barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch => barebox-2017.01.0-0004-at91sam9260-9g20-fix-wathdog-support.patch} (81%)
>
>  Since you anyway have to rename the patches, could you move them to
> board/telit/evk-pro3/patches/barebox (and remove the barebox and version part)?
> Basically you can regenerate them directly with 'git format-patch -o ...'
> without need to rename.

Done.

>  And also use BR2_GLOBAL_PATCH_DIR instead of
> BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR, of course. We're phasing out the
> package-specific PATCH_DIR configs.

Done.

>
>>  create mode 100644 board/telit/evk-pro3/barebox-2017.01.0-0005-watchdog-enable-for-evk-pro3.patch
>>
> [snip]
>> diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch b/board/telit/evk-pro3/barebox-2017.01.0-0001-watchdog-add-keep-alive-support.patch
>> similarity index 73%
>> rename from board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch
>> rename to board/telit/evk-pro3/barebox-2017.01.0-0001-watchdog-add-keep-alive-support.patch
>> index 155154603..4465298f5 100644
>> --- a/board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch
>> +++ b/board/telit/evk-pro3/barebox-2017.01.0-0001-watchdog-add-keep-alive-support.patch
>> @@ -1,4 +1,4 @@
>> -From b5e57a9f158a293b1151638336478af8a5aad0f0 Mon Sep 17 00:00:00 2001
>> +From 1ae2a27187d1123ff9daca60f86810d6b3a25943 Mon Sep 17 00:00:00 2001
>>  From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
>>  Date: Wed, 14 Nov 2012 19:16:35 +0800
>>  Subject: [PATCH 1/5] watchdog: add keep alive support
>> @@ -13,7 +13,7 @@ Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
>
>  Since you refresh this patch, it makes sense to add your Sob. By the way, is

Done.

> there any chance of upstreaming those patches?
The original creator of this patch set said that it will do that,
maybe i can ask him another time if is still interested in doing it.

> [snip]
>> diff --git a/board/telit/evk-pro3/barebox-2017.01.0-0005-watchdog-enable-for-evk-pro3.patch b/board/telit/evk-pro3/barebox-2017.01.0-0005-watchdog-enable-for-evk-pro3.patch
>> new file mode 100644
>> index 000000000..6735e3887
>> --- /dev/null
>> +++ b/board/telit/evk-pro3/barebox-2017.01.0-0005-watchdog-enable-for-evk-pro3.patch
>> @@ -0,0 +1,61 @@
>> +From 705a6b6add1dd60a862c3a677eac4efeefb3bd0b Mon Sep 17 00:00:00 2001
>> +From: Fabio Porcedda <fabio.porcedda@gmail.com>
>> +Date: Thu, 17 Jan 2013 11:32:59 +0100
>> +Subject: [PATCH 5/5] watchdog: enable for evk-pro3
>> +
>> +Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> +---
>> + arch/arm/configs/telit_evk_pro3_defconfig |  2 ++
>> + drivers/watchdog/wd_core.c                | 10 +++++++---
>> + 2 files changed, 9 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/arch/arm/configs/telit_evk_pro3_defconfig b/arch/arm/configs/telit_evk_pro3_defconfig
>> +index 3bf5968bf..7a47fb951 100644
>> +--- a/arch/arm/configs/telit_evk_pro3_defconfig
>> ++++ b/arch/arm/configs/telit_evk_pro3_defconfig
>> +@@ -64,6 +64,8 @@ CONFIG_MCI_ATMEL=y
>> + CONFIG_LED=y
>> + CONFIG_LED_GPIO=y
>> + CONFIG_LED_TRIGGERS=y
>> ++CONFIG_WATCHDOG=y
>> ++CONFIG_WATCHDOG_AT91SAM9X=y
>
>  Instead of this, it would make sense to use
> BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES

Done.

>> + CONFIG_FS_TFTP=y
>> + CONFIG_FS_FAT=y
>> + CONFIG_FS_FAT_LFN=y
>> +diff --git a/drivers/watchdog/wd_core.c b/drivers/watchdog/wd_core.c
>> +index 38251ee96..52537afef 100644
>> +--- a/drivers/watchdog/wd_core.c
>> ++++ b/drivers/watchdog/wd_core.c
>> +@@ -32,9 +32,14 @@ static const char *watchdog_name(struct watchdog *wd)
>> +     return "unknown";
>> + }
>> +
>> ++static struct watchdog *watchdog_get_default(void);
>> ++
>> + static void watchdog_poller_func(struct poller_struct *poller)
>> + {
>> +-    watchdog->keep_alive(watchdog);
>> ++    struct watchdog *wd = watchdog_get_default();
>> ++
>> ++    if (wd)
>> ++                wd->keep_alive(wd);
>
>  I think you should update the log message of this patch, this change is not
> explained. Actually, this change should be part of patch 0001, no?

Done, merged with the first patch.

Thanks for reviewing
-- 
Fabio Porcedda
