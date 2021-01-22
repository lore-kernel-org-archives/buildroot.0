From: Joachim Wiberg <troglobit@gmail.com>
Date: Fri, 22 Jan 2021 16:43:30 +0100
Subject: [Buildroot] [PATCH 0/3] package/sysklogd: version bump, some fixes,
 and more menuconfig
Message-ID: <20210122154333.1927190-1-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This series bumps sysklogd to the latest version, fixes an issue with
fetching from GitHub (release tarballs exist), and finally adds some
menuconfig options enabling the native logger tool and controlling
the back-off time for unreachable remote syslog servers.

Cheers
 /Joachim

Joachim Wiberg (3):
  package/sysklogd: bump to verson 2.2.0
  package/sysklogd: add menuconfig support for enabling native logger
  package/sysklogd: menuconfig support for remote syslog retry delay

 ...RCE_required_for_O_CLOEXEC_on_uClibc.patch | 44 -------------------
 package/sysklogd/Config.in                    | 30 +++++++++++++
 package/sysklogd/sysklogd.hash                |  2 +-
 package/sysklogd/sysklogd.mk                  | 12 ++---
 package/sysklogd/syslogd.service              |  3 +-
 5 files changed, 40 insertions(+), 51 deletions(-)
 delete mode 100644 package/sysklogd/0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch

-- 
2.25.1
