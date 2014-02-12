From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Feb 2014 00:46:36 +0100
Subject: [Buildroot] [PATCH V4 2/2] i.MX: Update versions to match
 latest Freescale release
In-Reply-To: <52FC02E7.9060607@boundarydevices.com>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>
 <20140212190351.GD17804@free.fr>
 <52FBC72D.3090706@boundarydevices.com>
 <52FC02E7.9060607@boundarydevices.com>
Message-ID: <20140212234636.GF17804@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-02-12 16:25 -0700, Eric Nelson spake thusly:
> >On 02/12/2014 12:03 PM, Yann E. MORIN wrote:
> >>I think we should make the source conditional on BR2_ARM_EABIHF, not the
> >>version:
> >>
> >>     GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)
> >>     ifeq ($(BR2_ARM_EABIHF),y)
> >>     GPU_VIV_BIN_MX6Q_SOURCE  =
> >>gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION)-hfp.bin
> >>     else
> >>     GPU_VIV_BIN_MX6Q_SOURCE  =
> >>gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION)-sfp.bin
> >>     endif
> >>
> >
> >Agreed. This is nicer.
> >
> 
> And also not very workable.
> 
> Much seems to depend on GPU_VIV_BIN_MX6Q_VERSION having the right
> version.

You meant: -sfp or -hp are actually part of the version string, since
the archives self-extracts in a directory ending in -sfp or -hfp, right?

So, OK, leave -sfp/-hfp in the version string.

> If you switch your build from EABI to ARMHF, it also makes
> sense that the stamp information shouldn't follow you.

Well, if you switch ABI, you're toast anyway. Changing a toolchain option
will require a complete rebuild of all the packages, and you'll have to
restart afresh.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
