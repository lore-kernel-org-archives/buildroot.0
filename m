From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 15 Mar 2012 21:54:10 +0100
Subject: [Buildroot] [PATCH v3 0/2] Add omap-u-boot-utils and build .ift
	OMAP image
Message-ID: <1331844852-4609-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this is v3 of a small patch series that I sent back in September
(http://lists.busybox.net/pipermail/buildroot/2011-September/045813.html).

It was not accepted at that time because it introduced a user-visible host
package, which was not supported in Buildroot.
This fired up a brief discussion, and the decision was made to allow these
packages within a suitable infrastructure.

This infrastructure is now in place (since about commit 6b04b2dda6bf87dc12),
so here are again my two patches updated to the new scheme and refreshed in
general.

Luca

Luca Ceresoli (2):
  omap-u-boot-utils: add new host package
  u-boot: build signed image for OMAP processors

 boot/uboot/Config.in                           |   16 ++++++++++++++++
 boot/uboot/uboot.mk                            |   24 ++++++++++++++++++++++++
 package/Config.in.host                         |    1 +
 package/omap-u-boot-utils/Config.in.host       |    8 ++++++++
 package/omap-u-boot-utils/omap-u-boot-utils.mk |   22 ++++++++++++++++++++++
 5 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 package/omap-u-boot-utils/Config.in.host
 create mode 100644 package/omap-u-boot-utils/omap-u-boot-utils.mk

-- 
1.7.5.4
