From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 25 Jul 2014 17:31:39 +0200
Subject: [Buildroot] [PATCH 0/2] systemd: bump to version 215
Message-ID: <1406302301-9382-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This small series contains:

 - a bump of the systemd package to version 215.
 - a patch to disable the ldconfig.service unit, installed by v215 (this unit
   would fail, as /sbin/ldconfig is not installed in a target generated using
   a glibc-based toolchain).

Best regards,
ELB

Eric Le Bihan (2):
  systemd: bump to version 215
  systemd: add hook to disable ldconfig.service

 ...uild-sys-revert-use-of-ln-relative-option.patch |   87 ++++++--------------
 package/systemd/systemd.mk                         |    9 +-
 2 files changed, 33 insertions(+), 63 deletions(-)

-- 
1.7.10.4
