From: Markus Mayer <mmayer@broadcom.com>
Date: Mon, 17 Dec 2018 16:51:12 -0800
Subject: [Buildroot] [PATCH 0/4] Allow customization of system default PATH
Message-ID: <20181218005116.17435-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following an earlier patch submission[1] and a subsequent discussion[2],
here is the resulting patch series to handle the default PATH on the system
in a more generic manner.

What do you think of this initial round of patches?

Thanks,
-Markus

[1] http://lists.busybox.net/pipermail/buildroot/2018-March/215466.html
[2] http://lists.busybox.net/pipermail/buildroot/2018-December/238879.html

Markus Mayer (4):
  system cfg: introduce option BR2_SYSTEM_DEFAULT_PATH
  skeleton: use BR2_SYSTEM_DEFAULT_PATH as default PATH
  openssh: use BR2_SYSTEM_DEFAULT_PATH as default PATH
  dropbear: use BR2_SYSTEM_DEFAULT_PATH as default PATH

 package/dropbear/dropbear.mk                         |  8 ++++++++
 package/openssh/openssh.mk                           |  1 +
 package/skeleton-init-common/skeleton-init-common.mk |  3 +++
 system/Config.in                                     | 10 ++++++++++
 system/skeleton/etc/profile                          |  1 +
 5 files changed, 23 insertions(+)

-- 
2.17.1
