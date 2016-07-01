From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 23:34:16 +0200
Subject: [Buildroot] [PATCH 0/2] swupdate: customization of default
 website path
In-Reply-To: <20160622210125.18930-1-jordan@yelloz.me>
References: <20160622210125.18930-1-jordan@yelloz.me>
Message-ID: <20160701233416.7156f824@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 14:01:23 -0700, Jordan Yelloz wrote:
> This patch allows for customization of the destination directory of the
> swupdate default webserver static files. Some configurations use a read-only
> rootfs and have a tmpfs mounted on /var so /var/www/swupdate is not an option
> for those systems. The newly added option allows users to install the website
> files in somewhere more stable like a subdirectory of /usr/share/swupdate or
> /usr/share/factory in the case of a volatile /var.
> 
> The previous fixed value of /var/www/swupdate is preserved as the default so
> this change shouldn't disturb any existing configurations.

Thanks for your proposal. However, it's Buildroot's policy to install
all the web-related stuff in /var/www. Nothing prevents you from moving
things around in a post-build script, and I think that's what we would
recommend in your situation.

Look at all the jquery* packages, the bootstrap package, and many more
packages. We can't add an option for all of them, so we prefer to
install in a default location that is somewhat sane, and leave it to
post-build scripts to move things around if needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
