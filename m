From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 20 Dec 2018 09:55:04 -0800
Subject: [Buildroot] [PATCH v3 0/4] Allow customization of system default
 PATH
Message-ID: <20181220175508.2091-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series introduces a common way of configuring the system's default
PATH.

We introduce a Kconfig variable called BR2_SYSTEM_DEFAULT_PATH, which
is being used in /etc/profile of the default skeleton and for dropbear
and openssh sessions.

Changes since v2:
- Reformat the help section in system/Config.in to stay within the line
  length limit
- Swap SED and INSTALL commands in skeleton-init-common.mk
- Add Yann's Reviewed-by

Changes since v1:
- only use a single default (independent of BR2_ROOTFS_MERGED_USR)
- add a guard to system/system.mk checking the default path isn't empty
- replace PATH in etc/profile with place-holder @PATH@ and update regex
- use BR2_SYSTEM_DEFAULT_PATH unconditionally for dropbear
- update commit messages that BR2_SYSTEM_DEFAULT_PATH is a Kconfig variable
  and already quoted (which is what we need)

Markus Mayer (4):
  system cfg: introduce option BR2_SYSTEM_DEFAULT_PATH
  skeleton: use BR2_SYSTEM_DEFAULT_PATH as default PATH
  openssh: use BR2_SYSTEM_DEFAULT_PATH as default PATH
  dropbear: use BR2_SYSTEM_DEFAULT_PATH as default PATH

 package/dropbear/dropbear.mk                         |  6 ++++++
 package/openssh/openssh.mk                           |  1 +
 package/skeleton-init-common/skeleton-init-common.mk |  1 +
 system/Config.in                                     | 10 ++++++++++
 system/skeleton/etc/profile                          |  2 +-
 system/system.mk                                     |  4 ++++
 6 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.17.1
