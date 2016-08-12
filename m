From: =?UTF-8?Q?Rapha=C3=ABl_Poggi?= <poggi.raph@gmail.com>
Date: Fri, 12 Aug 2016 14:52:25 +0200
Subject: [Buildroot] [PATCH] barebox: fix ARCH value for arm64
In-Reply-To: <20160812123229.GL845@tarshish>
References: <1471000286-50321-1-git-send-email-poggi.raph@gmail.com>
 <20160812123229.GL845@tarshish>
Message-ID: <CACqcpZBNHJvQQW0+im8m0g+3VvO_A2KMT1cGhvoSE3kzeBTVwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2016-08-12 14:32 GMT+02:00 Baruch Siach <baruch@tkos.co.il>:
> Hi Raphael,
>
> On Fri, Aug 12, 2016 at 01:11:26PM +0200, Raphael Poggi wrote:
>> Signed-off-by: Raphael Poggi <poggi.raph@gmail.com>
>> ---
>>  boot/barebox/barebox.mk | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
>> index 832297e..b02751d 100644
>> --- a/boot/barebox/barebox.mk
>> +++ b/boot/barebox/barebox.mk
>> @@ -61,6 +61,8 @@ else ifeq ($$(KERNEL_ARCH),x86_64)
>>  $(1)_ARCH = x86
>>  else ifeq ($$(KERNEL_ARCH),powerpc)
>>  $(1)_ARCH = ppc
>> +else ifeq ($$(KERNEL_ARCH), arm64)
>
> Redundant space before "arm64".

Oops, will fix it.

>
> Also, this is only applicable to version v2016.08.0 that adds initial support
> for aarch64
> (http://lists.infradead.org/pipermail/barebox/2016-August/027849.html). A user
> may set BR2_TARGET_BAREBOX_CUSTOM_VERSION to v2016.08.0+, so this may be
> applicable to Buildroot master.

You mean, test ($$(KERNEL_ARCH), arm64) and also the barebox version ?

Rapha?l

>
> baruch
>
>> +$(1)_ARCH = arm
>>  else
>>  $(1)_ARCH = $$(KERNEL_ARCH)
>>  endif
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
