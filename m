From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 14 Nov 2016 09:11:04 +0100
Subject: [Buildroot] [PATCH next] olimex_imx233_olinuxino: split
 defconfig in 2 variants
In-Reply-To: <20161113214244.111d812f@free-electrons.com>
References: <1478941453-1904-1-git-send-email-francois.perrad@gadz.org>
 <CAOMZO5DT0Fjw6tzoW0WJMg-YiH2Ns+3dgrcz0tGxH5YDk+__Fw@mail.gmail.com>
 <CAB0FRsujkKYK5D0FM=PkhUW3-ruE2RtGpavCxP2S+35OG37A2g@mail.gmail.com>
 <20161113214244.111d812f@free-electrons.com>
Message-ID: <CAB0FRsvZRpPPmRtqVka0f+V76-GEFgeZL4wZAuuj89bvR4UPyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-11-13 21:42 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Sat, 12 Nov 2016 15:09:51 +0100, Fran?ois Perrad wrote:
>
>> My rational is:
>> - The Wifi part is annoying for me because I cannot test it.
>
> Why? Isn't the Wifi built-in?
>

No, Wifi is not builtin.

As I said in http://lists.busybox.net/pipermail/buildroot/2016-November/177118.html,
there are many variants of iMX233-OLinuXino: MAXI, MINI, MINI-WIFI, MICRO, NANO.

The only product with Wifi is MINI-WIFI which is in fact a MINI board
with the WIFI RTL8188CU module
see https://www.olimex.com/Products/Components/RF/MOD-RTL8188CU/
see https://www.olimex.com/Products/OLinuXino/iMX233/iMX233-OLinuXino-MINI-WiFi/

>> - olimex_imx233_olinuxino_maxi_defconfig is really as minimal as possible
>> (see policy in https://buildroot.org/downloads/manual/manual.html#adding-board-support)
>> and I could maintain (and test) it.
>
> Using the name "maxi" for a defconfig that is in fact "as minimal as
> possible" is very weird.
>

I could rename them:
 - olimex_imx233_olinuxino_defconfig
 - olimex_imx233_olinuxino_wifi_defconfig

Fran?ois

> We generally try to provide support for the HW that is available on the
> board, so if Wifi is available, it's good to have it supported in our
> defconfig. I don't think two defconfigs are really useful in this
> situation.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
