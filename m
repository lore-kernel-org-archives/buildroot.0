From: unixmania at gmail.com <unixmania@gmail.com>
Date: Wed, 30 Oct 2019 10:27:56 -0300
Subject: [Buildroot] [PATCH RFC 0/3] support hooks and tables in virtual
 packages
Message-ID: <20191030132759.8643-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Virtual packages are not built but it's useful to allow them to have
permission/device/user tables and target-finalize/rootfs-pre-cmd hooks.

With this change we don't need to replicate date as currently done in
eudev and systemd user tables or test if the package is selected to add
a target-finalize hook as in luainterpreter.

Carlos Santos (3):
  package/pkg-generic.mk: support hooks and tables in virtual packages
  packages/luainterpreter: remove target-finalize hack
  packages/{eudev,systemd}: move commoun users to package/udev

 package/eudev/eudev.mk                   |  7 -------
 package/luainterpreter/luainterpreter.mk |  7 +------
 package/pkg-generic.mk                   | 17 +++++++++++++++++
 package/systemd/systemd.mk               |  3 ---
 package/udev/udev.mk                     |  7 +++++++
 5 files changed, 25 insertions(+), 16 deletions(-)

-- 
2.18.1
