From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 17:59:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-vpu: fix
 {EULA, COPYING} file hashes
In-Reply-To: <AM7PR04MB694978D2E0E1E5FC478DCADAA7479@AM7PR04MB6949.eurprd04.prod.outlook.com>
References: <20210420082953.12107-1-sebastien.szymanski@armadeus.com>
 <20210420202840.GF298901@scaer>
 <AM7PR04MB694978D2E0E1E5FC478DCADAA7479@AM7PR04MB6949.eurprd04.prod.outlook.com>
Message-ID: <20210424155953.GT298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

St?phane, S?bastien, All,

On 2021-04-21 07:41 +0000, Stephane Viau (OSS) spake thusly:
> >On 2021-04-20 10:29 +0200, S?bastien Szymanski spake thusly:
> >> make legal-info fails on imx-vpu package:
> >>
> >> >>> imx-vpu 5.4.39.3 Collecting legal info
> >> ERROR: EULA has wrong sha256 hash:
> >> ERROR: expected: a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc
> >> ERROR: got     : 7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0
> >> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> >>
> >> ERROR: COPYING has wrong sha256 hash:
> >> ERROR: expected: 69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2
> >> ERROR: got     : 2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d
> >> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> >
> >This is weird, beause the hashes were indeed updated by Stephane when he
> >send the last bump:
> >
> >    commit a646cd27b112500ef74764979190972aaa73811c
> >    Author: Stephane Viau <stephane.viau@oss.nxp.com>
> >    Date:   Thu Dec 24 07:59:44 2020 +0100
> >
> >        package/freescale-imx/imx-vpu: bump version to 5.4.39.3
> >
> >        This version is aligned with 5.4.47_2.2.0 NXP Linux BSP.
> >
> >        Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> >        Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> >
> >     package/freescale-imx/imx-vpu/imx-vpu.hash | 6 +++---
> >     package/freescale-imx/imx-vpu/imx-vpu.mk   | 2 +-
> >     2 files changed, 4 insertions(+), 4 deletions(-)
> >
> >So why have the hashes changed since? Stephane, any idea?
> 
> I honestly don't remember why I had to update these hash values:
> - either, I had a similar failure at the time ; and I'm guessing this component is somehow
>   linked to the latest EULA.txt provided by NXP (v.19 today).
> - or I changed them without checking 'make legal-info' at the time (why would I do this?)
> 
> I'll try to dig into this if no one has a clear response...

Aha, I got it: those hashes are the same as for imx-vpu-hantro. So you
probably conflated the two variants, or you copy-pasted the wrong line
into the wrong file.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
