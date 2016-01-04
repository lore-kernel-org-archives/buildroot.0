From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2016 00:14:15 +0100
Subject: [Buildroot] [git commit] python3: switch to Git formatted patches
Message-ID: <20160104232302.5AB55826FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c63280caf23ca7438e2fe23586cca9f450fc936
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for the bump to Python 3.5.0, let's switch all the
patches to the Git format. This way, a Git repository of the Python
source code can be used to manage those patches, which makes it easier
to bump to newer Python versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...p.py-do-not-add-invalid-header-locations.patch} | 18 ++++--
 ...he-install-location-of-_sysconfigdata.py.patch} | 30 ++++++---
 ...e-build-of-pyc-and-pyo-files-conditional.patch} | 30 +++++++--
 ...gy_getaddrinfo-configure-test-when-cross-.patch | 27 ++++++++
 ...ucture-to-disable-the-build-of-certain-e.patch} | 38 ++++++-----
 ...06-distutils-sysconfig-use-sysconfigdata.patch} | 22 ++++++-
 ...brary-header-paths-for-cross-compilation.patch} | 50 +++++++++------
 ...-t-look-in-usr-lib-termcap-for-libraries.patch} | 17 +++--
 ....patch => 0009-Don-t-add-multiarch-paths.patch} | 17 +++--
 ...tch => 0010-Abort-on-failed-module-build.patch} | 17 +++--
 ...nd.patch => 0011-Serial-ioctl-workaround.patch} | 15 ++++-
 ...t-the-shebang-of-Python-scripts-for-cros.patch} | 18 ++++--
 ...config.sh.in-ensure-sed-invocations-only.patch} | 13 ++--
 ...harcode-invalid-path-to-ncursesw-headers.patch} | 17 +++--
 ...tem-locale-and-set-to-default-when-addin.patch} | 18 ++++--
 ...016-Add-importlib-fix-for-PEP-3147-issue.patch} | 22 +++++--
 ...n-to-disable-installation-of-test-module.patch} | 29 +++++----
 ...h => 0018-Add-an-option-to-disable-pydoc.patch} | 39 +++++++-----
 ...=> 0019-Add-an-option-to-disable-lib2to3.patch} | 73 ++++++++++++----------
 ...Add-option-to-disable-the-sqlite3-module.patch} | 65 ++++++++++---------
 ...1-Add-an-option-to-disable-the-tk-module.patch} | 31 +++++----
 ...d-an-option-to-disable-the-curses-module.patch} | 27 ++++----
 ...h => 0023-Add-an-option-to-disable-expat.patch} | 35 ++++++-----
 ...0024-Add-an-option-to-disable-CJK-codecs.patch} | 17 +++--
 ...tch => 0025-Add-an-option-to-disable-NIS.patch} | 17 +++--
 ...026-Add-an-option-to-disable-unicodedata.patch} | 17 +++--
 ...ch => 0027-Add-an-option-to-disable-IDLE.patch} | 39 +++++++-----
 ...=> 0028-Add-an-option-to-disable-decimal.patch} | 23 ++++---
 ...option-to-disable-the-ossaudiodev-module.patch} | 17 +++--
 .../python3/006-cross-compile-getaddrinfo.patch    | 21 -------
 30 files changed, 523 insertions(+), 296 deletions(-)

Patch is too large, so refusing to show it
