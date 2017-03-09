From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:35:21 +0100
Subject: [Buildroot] [git commit] python: move to Git formatted patches
Message-ID: <20170309213619.7BE7B816C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=652076293235276e2f978fe377322a6cbd615455
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the cpython project has a nice Github repository, with tags,
it's much nicer to handle the stack of Python patches with Git. The
python3 package patches had already been converted, but not the python
package patches. Therefore, this commit does the move.

There is no functional change, only reformatting of the patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...p.py-do-not-add-invalid-header-locations.patch} |  18 ++-
 ...Fix-get_python_inc-for-cross-compilation.patch} |  18 ++-
 ...he-install-location-of-_sysconfigdata.py.patch} |  38 ++++---
 ...compilation-of-.pyc-and-.pyo-conditional.patch} |  29 ++++-
 ...st-getaddrinfo-test-for-cross-compilation.patch |  29 +++++
 ...infrastructure-to-be-able-to-disable-ext.patch} |  41 +++++--
 ...brary-header-paths-for-cross-compilation.patch} |  50 +++++----
 ...-t-look-in-usr-lib-termcap-for-libraries.patch} |  18 ++-
 ... 0009-Fix-python-config-for-cross-builds.patch} | 121 ++++++++++++---------
 ...-Remove-the-python-symlink-install-rules.patch} |  25 +++--
 ....patch => 0011-Don-t-add-multiarch-paths.patch} |  17 ++-
 ...tch => 0012-Abort-on-failed-module-build.patch} |  17 ++-
 ...build-when-threads-are-not-used-availabl.patch} |  17 ++-
 ...nd.patch => 0014-Serial-ioctl-workaround.patch} |  15 ++-
 ...t-the-shebang-of-Python-scripts-for-cros.patch} |  18 ++-
 ...n-to-disable-installation-of-test-module.patch} |  27 +++--
 ...h => 0017-Add-an-option-to-disable-pydoc.patch} |  37 ++++---
 ...=> 0018-Add-an-option-to-disable-lib2to3.patch} |  39 ++++---
 ...Add-option-to-disable-the-sqlite3-module.patch} |  65 ++++++-----
 ...0-Add-an-option-to-disable-the-tk-module.patch} |  31 +++---
 ...d-an-option-to-disable-the-curses-module.patch} |  27 +++--
 ...h => 0022-Add-an-option-to-disable-expat.patch} |  35 +++---
 ...0023-Add-an-option-to-disable-CJK-codecs.patch} |  17 ++-
 ...tch => 0024-Add-an-option-to-disable-NIS.patch} |  17 ++-
 ...025-Add-an-option-to-disable-unicodedata.patch} |  17 ++-
 ...h => 0026-Add-an-option-to-disable-bsddb.patch} |  31 +++---
 ...-Add-an-option-to-disable-the-ssl-module.patch} |  17 ++-
 ...-Add-an-option-to-disable-the-bz2-module.patch} |  16 ++-
 ...Add-an-option-to-disable-the-zlib-module.patch} |  16 ++-
 ...h => 0030-Do-not-install-the-idle-editor.patch} |  26 +++--
 ...option-to-disable-the-ossaudiodev-module.patch} |  15 ++-
 package/python/006-cross-compile-getaddrinfo.patch |  13 ---
 package/python/018-fix-add-gcc-paths-logic.patch   |  27 -----
 33 files changed, 587 insertions(+), 357 deletions(-)

Patch is too large, so refusing to show it
