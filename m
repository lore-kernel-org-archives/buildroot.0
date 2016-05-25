From: Christian Stewart <christian@paral.in>
Date: Tue, 24 May 2016 17:35:00 -0700
Subject: [Buildroot] [PATCH 0/2] batman-adv 2016.1 kernel module
Message-ID: <1464136502-302-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series bumps batctl to 2016.1 from 2015.1 and introduces
batman-adv as a selectable package. This allows users to build the
batman-adv kernel module out-of-tree. While batman-adv exists in the
kernel tree today, adding it as a separate package allows compilation
against kernel trees without batman-adv, as well as the use of newer
batman-adv versions than exist in the current kernel tree.

Christian Stewart (2):
  package/batctl: bump to 2016.1
  batman-adv: new package

 package/Config.in                  |  1 +
 package/batctl/batctl.hash         |  6 +++---
 package/batctl/batctl.mk           |  2 +-
 package/batman-adv/Config.in       | 40 ++++++++++++++++++++++++++++++++++++++
 package/batman-adv/batman-adv.hash |  2 ++
 package/batman-adv/batman-adv.mk   | 36 ++++++++++++++++++++++++++++++++++
 6 files changed, 83 insertions(+), 4 deletions(-)
 create mode 100644 package/batman-adv/Config.in
 create mode 100644 package/batman-adv/batman-adv.hash
 create mode 100644 package/batman-adv/batman-adv.mk

-- 
2.7.3
