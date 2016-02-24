From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Wed, 24 Feb 2016 11:26:28 -0300
Subject: [Buildroot] [PATCH v2 0/4] Add file capability/xattr support
Message-ID: <1456323992-27845-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

This series adds file capability & xattr support for target filesystems.

It's done by enabling the latest fakeroot support for it, which requires
a attr-enabled host-libcap, which in turn needs a host-attr package to
match as well.

It wasn't made optional since the time delta for a non-attr versus
attr-enabled host-fakeroot and it's dependencies is just 5 seconds on a
quad-core i5 - hardly worth the additional complexities.

TODO:
This still needs matching makedevs support, or alternatively a separate
option and data file to handle this functionality. It would probably be
It's probably better to use this functionality with a separate tool and
data file(s) to avoid clutternig the device table too much (ostensibly
ACL support could be added as well).

Also not all target filesystems support extended attributes.

Change for v2:
 Use install-dev for host-attr installation.

Gustavo Zacarias (4):
  attr: add host variant
  attr: cleanup pointless indentation
  libcap: enable extended attribute support
  fakeroot: enable capability support

 package/attr/attr.mk         | 20 +++++++++++++-------
 package/fakeroot/fakeroot.mk |  8 +-------
 package/libcap/libcap.mk     | 10 +++++-----
 3 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.4.10
