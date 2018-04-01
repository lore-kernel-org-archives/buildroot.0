From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 10:50:42 +0200
Subject: [Buildroot] Patch for opencv3: python module was built for the
 host instead of target.
In-Reply-To: <MW2PR02MB3724CAF4A9F9EF9FEBF4C35E95D90@MW2PR02MB3724.namprd02.prod.outlook.com>
References: <MW2PR02MB3724CAF4A9F9EF9FEBF4C35E95D90@MW2PR02MB3724.namprd02.prod.outlook.com>
Message-ID: <20180401105042.577fa559@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 6 Mar 2018 17:19:18 +0000, Shyrokov, Sasha wrote:
> From 9b211fb5ec49879d10d32d22ed3608ffca944e2d Mon Sep 17 00:00:00 2001
> From: Sasha Shyrokov <alexander-shyrokov@idexx.com>
> Date: Tue, 6 Mar 2018 10:58:10 -0500
> Subject: [PATCH 1/1] opencv3: python module was built for the host instead of target.
> 
> distutils environment variables must be set.
> OPENCV3_CONF_ENV = $(PKG_PYTHON_DISTUTILS_ENV) All credit goes to Arnout:
> https://stackoverflow.com/questions/49059035/buildroot-opencv3-python-package-builds-for-the-wrong-target
> 
> Signed-off-by: Sasha Shyrokov <alexander-shyrokov@idexx.com>
> ---
>  package/opencv3/opencv3.mk | 1 +
>  1 file changed, 1 insertion(+)

Thanks, I've applied after extending the commit log to explain the
problem in more details, and apply the solution also to Python 2.x fo
consistency, even if it's only strictly needed for Python 3.x.

See
https://git.buildroot.org/buildroot/commit/?id=8ba80282c3bb580c6a45ea114e70acac98fe1690

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
