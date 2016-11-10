From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 10 Nov 2016 18:10:19 +0100
Subject: [Buildroot] [PATCH next 1/2] olimex_imx233_olinuxino: bump
	version
In-Reply-To: <CAOMZO5ATK4Fo8iQ1v3TBZ0MdXQ7rw2eNGGnQ6uP_knfuZHmBSQ@mail.gmail.com>
References: <1478560176-29807-1-git-send-email-francois.perrad@gadz.org>
 <CAOMZO5ATK4Fo8iQ1v3TBZ0MdXQ7rw2eNGGnQ6uP_knfuZHmBSQ@mail.gmail.com>
Message-ID: <CAB0FRssnv-Acvw32ErXifMJ5Hi2WadeE7igvf0e0Bn_uaZqtHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-11-10 15:54 GMT+01:00 Fabio Estevam <festevam@gmail.com>:
> Hi Francois,
>
> On Mon, Nov 7, 2016 at 9:09 PM, Francois Perrad <fperrad@gmail.com> wrote:
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  .../imx233_olinuxino/genimage-imx233_olinuxino.cfg |   1 +
>>  board/olimex/imx233_olinuxino/linux-3.18.config    | 152 ---------------------
>>  board/olimex/imx233_olinuxino/post-image.sh        |   3 -
>>  configs/olimex_imx233_olinuxino_defconfig          |  16 ++-
>>  4 files changed, 10 insertions(+), 162 deletions(-)
>
> Thanks for this patch!
>
>> diff --git a/board/olimex/imx233_olinuxino/linux-3.18.config b/board/olimex/imx233_olinuxino/linux-3.18.config
>> deleted file mode 100644
>> index d46d4d5..0000000
>> --- a/board/olimex/imx233_olinuxino/linux-3.18.config
>> +++ /dev/null
>
>> -CONFIG_NET=y
>> -CONFIG_PACKET=y
>> -CONFIG_UNIX=y
>> -CONFIG_INET=y
>> -CONFIG_IP_PNP=y
>> -CONFIG_IP_PNP_DHCP=y
>> -CONFIG_SYN_COOKIES=y
>> -CONFIG_CFG80211=y
>> -CONFIG_CFG80211_WEXT=y
>
>> -CONFIG_USB_USBNET=y
>> -CONFIG_USB_NET_SMSC95XX=y
>> -CONFIG_RTL8187=m
>> -CONFIG_ATH_CARDS=m
>> -CONFIG_ATH9K_HTC=m
>> -CONFIG_RT2X00=m
>> -CONFIG_RT73USB=m
>> -CONFIG_RT2800USB=m
>> -CONFIG_RT2800USB_RT53XX=y
>> -CONFIG_RT2800USB_RT55XX=y
>> -CONFIG_RT2800USB_UNKNOWN=y
>> -CONFIG_RTL_CARDS=m
>> -CONFIG_RTL8192CU=m
>
> After the removal of this defconfig, wifi is no longer functional by default.
>
> It would be good to submit a follow up patch that adds a linux
> fragment file that enables the Wifi related options.
>

There are many variants of iMX233-OLinuXino board:
  - MAXI with Ethernet 100Mb
  - MINI without Ethernet
  - MINI-WIFI with an additionnal module using a Realtek 8188
  - MICRO (daughter board)
  - NANO (daughter board)

I own only a MAXI, so I cannot do test with Wifi.
With a MAXI, the wired ethernet works fine.
Maybe, it's time to have more than one defconfig ?

Fran?ois

> Thanks,
>
> Fabio Estevam
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
