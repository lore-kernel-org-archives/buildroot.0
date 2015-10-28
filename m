From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 28 Oct 2015 16:59:00 +0100
Subject: [Buildroot] [PATCH 0/3] Alternative way to wait interfaces on bootup
Message-ID: <1446047943-24641-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed here:

   http://lists.busybox.net/pipermail/buildroot/2015-October/142329.html

J?r?me Pouiller (3):
  Revert "package/initscripts: S40network: wait for network interfaces
    to appear"
  skeleton: optionally wait for network interfaces to appear
  skeleton: wait interface to appear if dhcp is enabled

 package/initscripts/init.d/S40network              | 29 ----------------------
 package/skeleton/skeleton.mk                       |  1 +
 system/skeleton/etc/network/if-pre-up.d/wait_iface | 28 +++++++++++++++++++++
 3 files changed, 29 insertions(+), 29 deletions(-)
 create mode 100755 system/skeleton/etc/network/if-pre-up.d/wait_iface

-- 
2.1.4
