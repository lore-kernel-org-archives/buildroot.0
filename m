From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Feb 2019 14:32:07 +0100
Subject: [Buildroot] [PATCH] tar: add Config.in.host
In-Reply-To: <20190215232006.4990-1-mmayer@broadcom.com>
References: <20190215232006.4990-1-mmayer@broadcom.com>
Message-ID: <20190216143207.65930f15@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Markus,

On Fri, 15 Feb 2019 15:20:06 -0800
Markus Mayer <mmayer@broadcom.com> wrote:

> Add a config option to build tar for the host, so the user can choose
> to build it, even if Buildroot wouldn't do so ordinarily.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
> 
> Since Buildroot can only work with three tar version (1.27-1.29), the
> likelihood that system tar is too old or too new is quite high -- and
> increasing. Ubuntu 16.04 and 18.04 ship with an acceptabe version of
> tar. As of Ubuntu 18.10, system tar is already too recent.
> 
> Our main build machines are Ubuntu 16.04, but we need to support other
> platforms. We need build machines of different flavours to be able to
> build buildroot without requiring an Internet connection, using only
> pre-downloaded package tar-balls (downloaded during the master build).
> 
> We can't rely that the tar sources have been downloaded automatically
> based on what was detected on the master build machine, because it may
> not require host-tar while a different build machine might.
> 
> A manual config option will give us the choice to build and bundle
> host-tar regardless of what Buildroot finds on the master.

This use case is already solved by the option BR2_FORCE_HOST_BUILD,
introduced recently in commit 3f1b965bc36c64f83c962e373f7b5fe1245e3355,
with the exception that BR2_FORCE_HOST_BUILD solves the issue for all
host packages, not just for host-tar.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
