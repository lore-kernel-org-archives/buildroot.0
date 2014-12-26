From: Gary Bisson <bisson.gary@gmail.com>
Date: Fri, 26 Dec 2014 10:39:14 -0800
Subject: [Buildroot] [PATCH v5 00/15] Add Xorg support for iMX6
In-Reply-To: <2664122.16Rl9eEuFN@sagittea>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
 <5494D3C6.6060006@gmail.com> <2664122.16Rl9eEuFN@sagittea>
Message-ID: <20141226183914.GA12806@e6430>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerome, All,

On Sat, Dec 20, 2014 at 03:27:34PM +0100, J?r?me Pouiller wrote:
> Hello Garry,
> 
> On Friday 19 December 2014 17:41:26 Gary Bisson wrote:
> > Jerome, All,
> > 
> > On 12/09/2014 05:46 AM, J?r?me Pouiller wrote:
> > > Hello,
> > >
> > > Main purpose of this serie is to add support of Vivante GPU (found on 
> imx6) to
> > > Xorg. This work is mainly adapted from Yocto.
> > >
> > > v5:
> > >    - Add references in commit log of xdriver_xf86-video-imx-viv
> > >    - Split qmx6_defconfig in two defconfig: a minimal one and a demo one
> [...] 
> > I haven't tested this series of patch as Thomas had some remarks. Let me 
> > know if I should test it anyway or if I should wait for a v6.
> Thomas remarks are only related to Qt5 modifications. I have not yet totally 
> answered these remarks, but apart from Qt5 patch, there is no opened issues on 
> this series. 

I confirm this series works as expected with the following setup:
- SabreLite board (nitrogen6x defconfig)
- https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf
- Xterm test
- Vivante 3D examples for X
- Also rebuilt the iMX6-specific libraries without X support and
  everything is still working in fb mode
- Checked that qmx defconfigs build fine but couldn't try on actual
  hardware as I don't have the board.

Tested-by: Gary Bisson <bisson.gary@gmail.com>

Gary
