From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:54:01 +0200
Subject: [Buildroot] [PATCH 1/4] package/qt5/qt5base: disable predefined
 -Og optimization
In-Reply-To: <20190618084535.75870-2-giulio.benetti@micronovasrl.com>
References: <20190618084535.75870-1-giulio.benetti@micronovasrl.com>
 <20190618084535.75870-2-giulio.benetti@micronovasrl.com>
Message-ID: <20190622205401.5d2b4c25@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Jun 2019 10:45:32 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Starting from Qt5 5.9.0 -optimize-debug is enabled by default causing
> -Og flag to be appended to CFLAGS and consequently override
> TARGET_CFLAGS. We don't want this so let's pass -no-optimize-debug to
> QT5BASE_CONFIGURE_OPTS if QT5_VERSION_LATEST=y.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

In fact, optimize-debug is only enabled for debug builds, so I adjusted
the commit log and comment and applied. It would be good to check if
optimize-size is automatically enabled (or not) for release builds, and
see if we should -no-optimize-size as well.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
