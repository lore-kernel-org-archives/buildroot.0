From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Nov 2016 12:02:03 -0200
Subject: [Buildroot] [PATCH next] olimex_imx233_olinuxino: split
 defconfig in 2 variants
In-Reply-To: <CAB0FRsvZRpPPmRtqVka0f+V76-GEFgeZL4wZAuuj89bvR4UPyQ@mail.gmail.com>
References: <1478941453-1904-1-git-send-email-francois.perrad@gadz.org>
 <CAOMZO5DT0Fjw6tzoW0WJMg-YiH2Ns+3dgrcz0tGxH5YDk+__Fw@mail.gmail.com>
 <CAB0FRsujkKYK5D0FM=PkhUW3-ruE2RtGpavCxP2S+35OG37A2g@mail.gmail.com>
 <20161113214244.111d812f@free-electrons.com>
 <CAB0FRsvZRpPPmRtqVka0f+V76-GEFgeZL4wZAuuj89bvR4UPyQ@mail.gmail.com>
Message-ID: <CAOMZO5CkRaz_oUMpcFA51==5qr3PiPWtznx9FDrb+1pNcNNbVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fran?ois,

On Mon, Nov 14, 2016 at 6:11 AM, Fran?ois Perrad
<francois.perrad@gadz.org> wrote:

> I could rename them:
>  - olimex_imx233_olinuxino_defconfig
>  - olimex_imx233_olinuxino_wifi_defconfig

I am still not convinced we should have two defconfigs for this board.

The only difference between them would be to enable some extra kernel
config options related to Wifi. They would not cause any harm on a
board without wifi.

Also, what if in the future mxs_defconfig is updated to include such
Wifi related options?

So I would say, just don't worry about the extra Wifi related modules
in your roots and we should be good.
