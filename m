From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 23:11:24 +0200
Subject: [Buildroot] [PATCH] package/gpsd: Fix systemd service
 installation and paths
In-Reply-To: <1559170961-14091-1-git-send-email-hancock@sedsystems.ca>
References: <1559170961-14091-1-git-send-email-hancock@sedsystems.ca>
Message-ID: <20190531231124.54d5a076@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Robert,

Thanks for this patch!

On Wed, 29 May 2019 17:02:41 -0600
Robert Hancock <hancock@sedsystems.ca> wrote:

> Fix several issues with systemd service file installation for gpsd:
> 
> -systemd support in the gpsd build was defaulting to enabled or not
> based on whether the host system had systemd directories present. Set
> this explicitly based on whether BR2_INIT_SYSTEMD is set.
> 
> -The installed systemd service files referenced paths in /usr/local when
> the actual binaries are installed in /usr. Replace /usr/local with /usr
> in the installed service files.

I have not looked into the gpsd build system, but I was wondering if
there was a way to convince gpsd to produce those files with the right
prefix (i.e /usr instead or /usr/local).

> -When BR2_PACKAGE_HAS_UDEV was enabled, all of the binaries were
> re-installed again, along with the udev rules, as part of the
> post-install hooks. Just choose between using install and udev-install
> based on whether udev is enabled to avoid redundant re-installations.

This should be part of a separate patch, because it's not a fix, just
an unrelated optimization.

But in fact, the systemd fixes could also be two separate patches.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
