From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Mar 2015 12:40:17 +0100
Subject: [Buildroot] [PATCH 0/5] Fix libnl static linking
Message-ID: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches was triggered by the batctl static linking patch
sent by Jens Zettelmeyer.

It turns out that batctl properly uses pkg-config to know how to link
with libnl, so it's ctually libnl pkg-config that aren't correct. This
is what the first two patches are fixing. This fixes batctl static
linking.

As a follow-up, I reviewed some of the packages that link against
libnl and have special handling for static linking, and did some
related cleanups.

Thomas

Thomas Petazzoni (5):
  libnl: use the backported patch for poll.h issue
  libnl: add patch to add Libs.private in libnl-3.0.pc
  crda: remove static library handling
  ti-utils: simplify static linking case by using pkg-config
  iw: simplify static linking handling

 package/crda/crda.mk                               | 13 ----------
 package/iw/iw.mk                                   |  6 -----
 ...etlink-h-use-poll-h-instead-of-sys-poll-h.patch | 18 -------------
 ...link.h-fix-build-including-poll.h-with-th.patch | 30 ++++++++++++++++++++++
 ...ibs.private-field-in-libnl-pkg-config-fil.patch | 30 ++++++++++++++++++++++
 package/ti-utils/ti-utils.mk                       |  9 ++++---
 6 files changed, 66 insertions(+), 40 deletions(-)
 delete mode 100644 package/libnl/0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch
 create mode 100644 package/libnl/0001-netlink-netlink.h-fix-build-including-poll.h-with-th.patch
 create mode 100644 package/libnl/0002-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch

-- 
2.1.0
