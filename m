From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2020 08:10:11 +0200
Subject: [Buildroot] [PATCH v3 1/4] package/freescale-imx: Move DDR FW
 choice down to firmware-imx package
In-Reply-To: <20200711224833.339c7f96@windsurf.home>
References: <1594382445-4464-1-git-send-email-stephane.viau@oss.nxp.com>
 <1594382445-4464-2-git-send-email-stephane.viau@oss.nxp.com>
 <20200711224833.339c7f96@windsurf.home>
Message-ID: <20200712061011.GA18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-07-11 22:48 +0200, Thomas Petazzoni spake thusly:
> On Fri, 10 Jul 2020 14:00:42 +0200
> Stephane Viau <stephane.viau@oss.nxp.com> wrote:
[--SNIP--]
> > -config BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4
> > +config BR2_PACKAGE_FIRMWARE_IMX_LPDDR4
> 
> When renaming options, we need to keep the old option name in
> Config.in.legacy so that it doesn't get silently dropped when users
> update to a newer Buildroot version.

That was not necessary, because BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4 was
only introduced after 2020.05, so we have no release with the symbol.

> >  	bool "lpddr4"
> >  	help
> >  	  Use LPDDR4 binaries (i.e.: lpddr4_pmu_train_*.bin)
> >  
> > -config BR2_PACKAGE_FIRMWARE_DDRFW_DDR4
> > +config BR2_PACKAGE_FIRMWARE_IMX_DDR4
> 
> Same here.

Ditto.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
