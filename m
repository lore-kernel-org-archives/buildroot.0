From: y at mail.free-electrons.com <y@mail.free-electrons.com>
Date: Tue,  3 Jan 2012 11:13:55 +0100
Subject: [Buildroot] [pull request v3] Pull request for branch
	for-2012.02/pkg-device
In-Reply-To: <y>
References: <y>
Message-ID: <cover.1325583983.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Ripard <maxime.ripard@free-electrons.com>

Hi List,

Here is a new version of the patchset adding a bit of infrastructure to handle
per package device creation and permission modifications. Since v2, I dropped
the renaming of the device table, and splitted the $(PKG)_FILES into
$(PKG)_DEVICES for device files creation and $(PKG)_PERMISSIONS for permissions
modifications. The only difference between the two are while $(PKG)_PERMISSIONS
is always used, $(PKG)_DEVICES is only used when using a static /dev.


The following changes since commit 68902f743729b3482bb6bc2ae9d0306aa9c00f65:

  ti-utils: unbreak build after libnl version bump (2011-12-26 19:33:43 +0100)

are available in the git repository at:
  http://free-electrons.com/~maxime/git/buildroot.git for-2012.02/pkg-device

Maxime Ripard (3):
      Add support for package-declared devices
      Convert busybox to the device declaration method
      Migrate Xenomai to the new infrastructure

 fs/common.mk                        |    4 ++++
 package/Makefile.package.in         |    2 ++
 package/busybox/busybox.mk          |    5 +++++
 package/xenomai/xenomai.mk          |    8 ++++++--
 target/generic/device_table.txt     |    2 --
 target/generic/device_table_dev.txt |    5 -----
 6 files changed, 17 insertions(+), 9 deletions(-)

Thanks,
-- 
Maxime Ripard
