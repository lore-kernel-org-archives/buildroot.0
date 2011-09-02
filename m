From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri,  2 Sep 2011 14:08:58 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/pkg-device
Message-ID: <cover.1314965303.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a minor set of improvement on how the devices are
declared in buildroot. For now, All the devices to be created
were in two files generic to every compilation. This was fine
for most usage, but was a bit problematic when packages needed
to create files or use specific permissions.

This set of patches are addressing this issue by creating a
new $(PKG)_DEVICES variable, containing the package specific
devices, using the makedevs syntax.

The following changes since commit facd602dcad54df769ac759886f48f248b61e692:

  Update for 2011.08 (2011-08-31 13:44:55 +0200)

are available in the git repository at:
  http://free-electrons.com/~maxime/git/buildroot.git for-2011.11/pkg-device

Maxime Ripard (2):
      Add support for package-declared devices
      Convert busybox to the device declaration method

 Makefile                        |    4 ++++
 fs/common.mk                    |    1 +
 package/Makefile.package.in     |    1 +
 package/busybox/busybox.mk      |    5 +++++
 target/generic/device_table.txt |    2 --
 5 files changed, 11 insertions(+), 2 deletions(-)

Thanks,
-- 
Maxime Ripard
