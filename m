From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed,  8 Jul 2015 11:54:13 +0200
Subject: [Buildroot] [PATCH 00/11] Bump ejabberd version to 15.06
Message-ID: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ejabberdctl in this new version makes use of getent, so add it to
ejabberd dependencies. We also provide two optionnal commits to
simplify the init script and to show the correct version in ejabberd
logs.
Since ejabberd upstream build system clones the master branch of its
dependencies, this patch serie also upgrades every ejabberd dependency.
Thus, it corresponds to an upstream ejabberd build from July 8th, 2015.

Johan Oudinet (11):
  ejabberd: bump to version 15.06
  ejabberd: simplify init script by patching ejabberdctl
  ejabberd: fix package version
  erlang-p1-utils: bump to version 1bf99f9
  erlang-p1-cache-tab: bump to version f7ea12b
  erlang-p1-tls: bump to version b070004
  erlang-p1-stringprep: bump to version 3c64023
  erlang-p1-xml: bump to version 2c61083
  erlang-p1-stun: bump to version a3dce07
  erlang-p1-sip: bump to version fd3e461
  erlang-p1-yaml: bump to version e1f081e

 package/ejabberd/0001-remove-deps.patch            | 20 ++++---
 package/ejabberd/0002-disable-rebar-deps.patch     | 28 ++++++----
 package/ejabberd/0003-disable-test.patch           | 14 +++--
 ...006-disable-erlang-deprecated-types-check.patch | 20 +++++++
 package/ejabberd/0006-remove-doc.patch             | 26 ---------
 .../ejabberd/0007-fix-install-permissions.patch    | 64 ++++++++++++----------
 .../ejabberd/0008-add-ac_config_macro_dir.patch    | 30 ++++++++++
 package/ejabberd/0009-fix-ejabberdctl.patch        | 21 +++++++
 package/ejabberd/0010-fix-package-version.patch    | 19 +++++++
 package/ejabberd/Config.in                         |  1 +
 package/ejabberd/S50ejabberd                       | 32 +++++------
 package/ejabberd/ejabberd.mk                       |  4 +-
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk |  2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk             |  2 +-
 .../erlang-p1-stringprep/erlang-p1-stringprep.mk   |  2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk           |  2 +-
 package/erlang-p1-tls/erlang-p1-tls.mk             |  2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk         |  2 +-
 package/erlang-p1-xml/erlang-p1-xml.mk             |  2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk           |  2 +-
 20 files changed, 188 insertions(+), 107 deletions(-)
 create mode 100644 package/ejabberd/0006-disable-erlang-deprecated-types-check.patch
 delete mode 100644 package/ejabberd/0006-remove-doc.patch
 create mode 100644 package/ejabberd/0008-add-ac_config_macro_dir.patch
 create mode 100644 package/ejabberd/0009-fix-ejabberdctl.patch
 create mode 100644 package/ejabberd/0010-fix-package-version.patch

-- 
2.1.4
