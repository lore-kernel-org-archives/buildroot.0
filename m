From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 19 Jun 2012 07:56:02 +0100
Subject: [Buildroot] [PATCH RFC 0/2] Add configuration item for custom
	JavaScript install path
Message-ID: <1340088964-10630-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

JavaScript files are installed by convention into /var/www in the target
filesystem. This is inflexible, and not appropriate to all use cases.

This patch series adds a Buildroot-wide configuration item to allow the
JavaScript install path to be customised; the path will be /var/www by default.

Simon Dawson (2):
  Add configuration item for custom JavaScript install path
  Use JavaScript install path from configuration during package
    installation

 package/Config.in                              |    1 +
 package/explorercanvas/explorercanvas.mk       |    4 ++--
 package/flot/flot.mk                           |    4 ++--
 package/javascript/Config.in                   |    5 +++++
 package/jquery-sparkline/jquery-sparkline.mk   |    4 ++--
 package/jquery-validation/jquery-validation.mk |    4 ++--
 package/jquery/jquery.mk                       |    4 ++--
 7 files changed, 16 insertions(+), 10 deletions(-)
 create mode 100644 package/javascript/Config.in

-- 
1.7.9.5
