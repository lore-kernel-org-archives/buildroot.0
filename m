From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Mar 2017 18:14:40 +0100
Subject: [Buildroot] [PATCH] Enable UART on raspberry pi zero
In-Reply-To: <DB5PR03MB13340AA1B7DB55B8854CF981E73A0@DB5PR03MB1334.eurprd03.prod.outlook.com>
References: <DB5PR03MB13342317D9FB07E001D16231E7380@DB5PR03MB1334.eurprd03.prod.outlook.com>
 <20170319132745.GB3734@free.fr>
 <DB5PR03MB13340AA1B7DB55B8854CF981E73A0@DB5PR03MB1334.eurprd03.prod.outlook.com>
Message-ID: <20170320171440.GB3619@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luke, All,

On 2017-03-20 12:36 +0000, luke spake thusly:
> Maybe my message wasn't clear.
> This is for the raspberry PI Zero W.
> 
> The UART is taken over by the wifi chip, so the software UART is now
> used for the TX/RX GPIO pin.

Then please look at how we're already doing it for the rpi3:

    https://git.buildroot.org/buildroot/tree/configs/raspberrypi3_defconfig

See the following option:

    BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"

Since the thread you pointed to is about rpi3, not rpi0-w, I gues the
workiaround we have will also work for rip0-w.

Can you please check that?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
