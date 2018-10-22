From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 22 Oct 2018 17:25:25 -0300
Subject: [Buildroot] Linux driver load failure with BR 2018.05
In-Reply-To: <AM4PR0802MB2210297D6D99BC3630A51C1BEAF40@AM4PR0802MB2210.eurprd08.prod.outlook.com>
References: <AM4PR0802MB2210297D6D99BC3630A51C1BEAF40@AM4PR0802MB2210.eurprd08.prod.outlook.com>
Message-ID: <CAOMZO5A6mEfxx63qwzQwkGiGUfcog+Qq_-iM+ocJkTwq+n0Bfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Mon, Oct 22, 2018 at 5:19 PM Fabrice Mousset | GEOCEPT GmbH
<fabrice.mousset@geocept.com> wrote:
>
> Hi all,
>
>
>
> I have build a custom Linux BS for a i.MX6SX base board (Linux 4.1.15 with Freescale/NXP patches).

In the latest Buildroot version we have:

configs/imx6sx-sdb_defconfig: which uses kernel mainline 4.14
configs/freescale_imx6sxsabresd_defconfig: which uses NXP 4.9 kernel

None of them use 4.1.15, so it seems you have selected an old kernel
for your target.

I would suggest you to use mainline kernel if you can.
