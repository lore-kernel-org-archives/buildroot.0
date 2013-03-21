From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Mar 2013 23:36:12 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	yem-latest-headers-bridge
Message-ID: <cover.1363905191.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes two breakages with toolchain using headers from
Linux 3.8+, due to the headers shuffling done for the UAPI stuff.

The series fixes two packages:
  - connman, already caught by the autobuilders
  - bridge-utils, as0yet un-caught to my knowledge

There are other packages imopacted by this UAPI shuffling:
  - iptables, already fixed in the version we use (yeah!)
  - maybe other yet unidentified packages (not-so-yeah...)


The following changes since commit 1f721a2f009393c29c6554f643f15f80a8dc5443:

  xinetd: follow the convention for patch location (2013-03-20 23:28:27 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-latest-headers-bridge

Yann E. MORIN (2):
      package/bridge-utils: fix build with newer kernels
      package/connman: version bump to 1.12, and fix build with newer kernels headers

 ...s.patch => bridge-utils-000-build-system.patch} |    0
 ...dge-utils-001-fix-for-kernel-headers-3.8+.patch |   30 ++++++++++++++++++++
 ...ce.patch => connman-000-uclibc-backtrace.patch} |    0
 .../connman-001-fix-for-latest-headers-3.8+.patch  |   19 ++++++++++++
 package/connman/connman.mk                         |    2 +-
 5 files changed, 50 insertions(+), 1 deletions(-)
 rename package/bridge-utils/{bridge-utils.patch => bridge-utils-000-build-system.patch} (100%)
 create mode 100644 package/bridge-utils/bridge-utils-001-fix-for-kernel-headers-3.8+.patch
 rename package/connman/{connman-uclibc-backtrace.patch => connman-000-uclibc-backtrace.patch} (100%)
 create mode 100644 package/connman/connman-001-fix-for-latest-headers-3.8+.patch

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
