From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 22:38:22 +0100
Subject: [Buildroot] [git commit] package/ejabberd: bump to version 18.09
Message-ID: <20181202071600.B686F803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1a43490e9ab24a3a249ab1224e236db47c53145
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version requires much less patches than the previous one packaged
in Buildroot. It is compatible with Erlang OTP 21.
There are two remainning patches to:
- change the Makefile rules so dependencies are not downloaded/compiled;
- fix ejabberd user and load a default file in ejabberdctl script.

The patch 0006-fix-install-permissions has been replaced by setting
permissions on /etc/ejabberd directory via EJABBERD_PERMISSIONS.

The patch 0009-disable-mod_avatar has been removed because eimp is
a mandatory dependency since 0f86559d.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...n-do-not-download-or-compile-dependencies.patch |   35 +
 .../0001-remove-make-targets-for-deps.patch        |   43 -
 ...jabberdctl.patch => 0002-fix-ejabberdctl.patch} |    0
 .../0003-remove-checking-erlang-version.patch      |   32 -
 package/ejabberd/0004-correct-includes.patch       | 1919 --------------------
 .../0005-disable-ERLANG_DEPRECATED_CHECK.patch     |   29 -
 .../ejabberd/0006-fix-install-permissions.patch    |   84 -
 .../0008-handle-error-case-from-lib_dir.patch      |   32 -
 package/ejabberd/0009-disable-mod_avatar.patch     |   32 -
 package/ejabberd/Config.in                         |    1 +
 package/ejabberd/ejabberd.hash                     |    2 +-
 package/ejabberd/ejabberd.mk                       |   12 +-
 12 files changed, 45 insertions(+), 2176 deletions(-)

Patch is too large, so refusing to show it
