From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 20:56:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: add
 security fix
In-Reply-To: <fbd81a16-35f0-5e1a-73fb-1b9c703a9408@t-online.de>
References: <20200810064109.447089-1-bernd.kuhls@t-online.de>
 <fbd81a16-35f0-5e1a-73fb-1b9c703a9408@t-online.de>
Message-ID: <20200828205640.705b1cb6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Aug 2020 19:03:25 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Due to the fact that personally I have no use for the older X.org server
> versions I would like to raise the question whether we can remove them?
> From my POV these older versions are unmaintained in buildroot because I
> want to concentrate on the current release which is the one I am using.

The problem comes from closed-source X.org drivers, which only work
with a certain X.org driver ABI.

We have amd-catalyst, which depends on ABI 19:

package/amd-catalyst/Config.in: depends on BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19

And nvidia-tegra23, which depends on ABI 14:

package/nvidia-tegra23/Config.in:       depends on BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14

So if we want to remove older X.org versions, we have to see if newer
versions of those drivers are available, and perhaps coordinate with
the maintainers of those drivers.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
