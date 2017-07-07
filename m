From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu,  6 Jul 2017 23:22:35 -0300
Subject: [Buildroot] [PATCH 0/7] introduce
	BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
Message-ID: <20170707022242.20128-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Several packages that depend on linux-pam need to repeat the same
dependency list in their Config.in files. This series introduces a
hidden boolean option, BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS, which
help us to avoid such repetition.

Carlos Santos (7):
  linux-pam: introduce BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
  nodm: use BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
  openvmtools: use BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
  python-pam: use BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
  rsh-redone: use BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
  sudo: use BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
  util-linux: use BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS

 package/linux-pam/Config.in   | 18 ++++++++++++++----
 package/nodm/Config.in        |  8 ++------
 package/openvmtools/Config.in |  7 ++-----
 package/python-pam/Config.in  |  9 ++-------
 package/rsh-redone/Config.in  | 16 ++++------------
 package/sudo/Config.in        |  7 +++++--
 package/util-linux/Config.in  | 16 ++++------------
 7 files changed, 33 insertions(+), 48 deletions(-)

-- 
2.9.4
