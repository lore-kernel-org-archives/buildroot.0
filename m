From: =?UTF-8?Q?Rapha=C3=ABl_Poggi?= <poggi.raph@gmail.com>
Date: Fri, 12 Aug 2016 16:29:52 +0200
Subject: [Buildroot] [PATCH] barebox: fix ARCH value for arm64
In-Reply-To: <20160812141226.GM845@tarshish>
References: <1471000286-50321-1-git-send-email-poggi.raph@gmail.com>
 <20160812123229.GL845@tarshish>
 <CACqcpZBNHJvQQW0+im8m0g+3VvO_A2KMT1cGhvoSE3kzeBTVwA@mail.gmail.com>
 <20160812141226.GM845@tarshish>
Message-ID: <CACqcpZDDEd2yOCEc4V-H6e7_2aH7F0gH15hMuzTsc5PTZPyr=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2016-08-12 16:12 GMT+02:00 Baruch Siach <baruch@tkos.co.il>:
> Hi Rapha?l,
>
> On Fri, Aug 12, 2016 at 02:52:25PM +0200, Rapha?l Poggi wrote:
>> 2016-08-12 14:32 GMT+02:00 Baruch Siach <baruch@tkos.co.il>:
>> > On Fri, Aug 12, 2016 at 01:11:26PM +0200, Raphael Poggi wrote:
>> >> Signed-off-by: Raphael Poggi <poggi.raph@gmail.com>
>
> [...]
>
>> >> +else ifeq ($$(KERNEL_ARCH), arm64)
>> >
>> > Redundant space before "arm64".
>>
>> Oops, will fix it.
>>
>> > Also, this is only applicable to version v2016.08.0 that adds initial
>> > support for aarch64
>> > (http://lists.infradead.org/pipermail/barebox/2016-August/027849.html). A user
>> > may set BR2_TARGET_BAREBOX_CUSTOM_VERSION to v2016.08.0+, so this may be
>> > applicable to Buildroot master.
>>
>> You mean, test ($$(KERNEL_ARCH), arm64) and also the barebox version ?
>
> No. This patch doesn't break older Barebox versions, AFAICS. I was only
> wondering whether it is master stuff, or -next, since we are now post -rc1. I
> tend to think this patch is safe for master.

Ok, I understand. I will send v2 to fix the redundant space.

Rapha?l

>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
