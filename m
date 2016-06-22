From: Jordan Yelloz <jordan@yelloz.me>
Date: Wed, 22 Jun 2016 14:01:23 -0700
Subject: [Buildroot] [PATCH 0/2] swupdate: customization of default website
	path
Message-ID: <20160622210125.18930-1-jordan@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows for customization of the destination directory of the
swupdate default webserver static files. Some configurations use a read-only
rootfs and have a tmpfs mounted on /var so /var/www/swupdate is not an option
for those systems. The newly added option allows users to install the website
files in somewhere more stable like a subdirectory of /usr/share/swupdate or
/usr/share/factory in the case of a volatile /var.

The previous fixed value of /var/www/swupdate is preserved as the default so
this change shouldn't disturb any existing configurations.

Jordan Yelloz (2):
  swupdate: allowed website install path
  swupdate: updated help of INSTALL_WEBSITE config

 package/swupdate/Config.in   | 22 ++++++++++++++++++----
 package/swupdate/swupdate.mk | 11 ++++++++---
 2 files changed, 26 insertions(+), 7 deletions(-)

-- 
2.9.0
