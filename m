From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 7 Mar 2017 18:16:22 +0100
Subject: [Buildroot] [PATCH v2] configs/telit_evk_pro3: bump barebox to
	2017.01.0
In-Reply-To: <20170306211907.608f3842@free-electrons.com>
References: <20170306164504.10572-1-fabio.porcedda@gmail.com>
 <20170306211907.608f3842@free-electrons.com>
Message-ID: <CAHkwnC-KFk6HYq1pUAMHSyx-i1JMuCmQ8tHUeqzDBGjRFDc+4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-03-06 21:19 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Mon,  6 Mar 2017 17:45:04 +0100, Fabio Porcedda wrote:
>> This bump fix the build failure with gcc5 for barebox.
>>
>> Some changes were made to the first patch to align to the latest
>> barebox api.
>>
>> Also done the following changes:
>> - Use "BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES" instead of patching
>>   the barebox sources.
>> - Use "BR2_GLOBAL_PATCH_DIR" instead of
>>   "BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR".
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> ---
>>  ...13.04.0-0005-watchdog-enable-for-evk-pro3.patch | 26 -----------
>>  board/telit/evk-pro3/barebox.fragment              |  2 +
>>  .../0001-watchdog-add-keep-alive-support.patch}    | 53 +++++++++++++---------
>>  ...2-watchdog-add-at91sam9-watchdog-support.patch} | 39 ++++++++++------
>>  ...003-at91sam9260-9g20-add-wathdog-support.patch} | 30 ++++++------
>>  ...004-at91sam9260-9g20-fix-wathdog-support.patch} | 10 ++--
>>  configs/telit_evk_pro3_defconfig                   |  7 ++-
>>  7 files changed, 81 insertions(+), 86 deletions(-)
>>  delete mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch
>>  create mode 100644 board/telit/evk-pro3/barebox.fragment
>>  rename board/telit/evk-pro3/{barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch => patches/barebox/0001-watchdog-add-keep-alive-support.patch} (60%)
>>  rename board/telit/evk-pro3/{barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch => patches/barebox/0002-watchdog-add-at91sam9-watchdog-support.patch} (89%)
>>  rename board/telit/evk-pro3/{barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch => patches/barebox/0003-at91sam9260-9g20-add-wathdog-support.patch} (62%)
>>  rename board/telit/evk-pro3/{barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch => patches/barebox/0004-at91sam9260-9g20-fix-wathdog-support.patch} (75%)
>
> Applied to master, thanks. However, I am really surprised that we have
> accepted to merge feature patches in Buildroot. Clearly patch 0001
> (adding keepalive support) and 0002 (adding a new driver) are feature
> patches, and should not be part of Buildroot.
>
> Why are they still not merged upstream? 2013.04 is soon going to be
> four years old.

Those patches were already sent years ago to upstream but it seems
that the original author has stopped working on it, I will dig further
into it, maybe i can take care of it.

Regards
-- 
Fabio Porcedda
