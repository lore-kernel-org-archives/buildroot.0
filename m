From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 18:05:34 +0200
Subject: [Buildroot] [PATCH] package/qt5base: add optional dependency on
 udev
In-Reply-To: <1466665515-26237-1-git-send-email-yann.morin@orange.com>
References: <1466665515-26237-1-git-send-email-yann.morin@orange.com>
Message-ID: <20160624180534.7535ffd9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Jun 2016 09:05:15 +0200, Yann E. MORIN wrote:
> Qt5 can optionally enable udev support, especially to enumerate input
> devices dynamically. Without udev, devices are not properly enumerated,
> and any device that is not present at launch time is never seen (there
> is no support for hotplug, that is).
> 
> Currently, Qt5base has no explicit dependency on udev, so it will all
> depend on the build order. Sometimes, a package that requires udev will
> be built before qt5base and Qt5 will have support for udev, sometime no
> such package is built before qt5base and Qt5 will not have support for
> udev.
> 
> Add an explicit dependency on udev, but only if it is enabled.
> 
> Note: this only really requires libudev, but we do not yet have a
> separate libudev; we still only have a udev provider (be it eudev or
> systemd).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> Cc: Cedric Chedaleux <cedric.chedaleux@orange.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 5 +++++
>  1 file changed, 5 insertions(+)

As suggested by Arnout, I've dropped the comment that isn't very
useful, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
