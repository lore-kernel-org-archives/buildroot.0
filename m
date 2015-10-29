From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 29 Oct 2015 10:00:16 +0100
Subject: [Buildroot] [PATCH v3 0/2] Alternative way to wait interfaces on
	bootup
Message-ID: <1446109218-11057-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v3:
  - '&&' in brackets is not supported by busybox sh

v2:
  - Squash patches 2 and 3
  - Remove blank lines
  - Do not print anything if interface already exist
  - Change displayed information

Notice I did not handled case where IFACE=--all. Indeed IF_WAIT_DELAY
is not set in this case won't be set (and none of scripts provided by
ifupdown/ifupdown-extra packages have special handling for '--all'.)

I don't print any explicit error message in case failure. Indeed,
ifupdown/run-parts already print messages and I believe 
"Waiting for interface dummy0 to appear... timeout!" is explicit enough.


J?r?me Pouiller (2):
  Revert "package/initscripts: S40network: wait for network interfaces
    to appear"
  skeleton: optionally wait for network interfaces to appear

 package/initscripts/init.d/S40network              | 29 ----------------------
 package/skeleton/skeleton.mk                       |  1 +
 system/skeleton/etc/network/if-pre-up.d/wait_iface | 21 ++++++++++++++++
 3 files changed, 22 insertions(+), 29 deletions(-)
 create mode 100755 system/skeleton/etc/network/if-pre-up.d/wait_iface

-- 
2.1.4
