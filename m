From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 22:27:19 +0100
Subject: [Buildroot] [git commit] ejabberd: Bump to version 17.11
Message-ID: <20180129212806.56B0886A11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8ed115508daa14b185d48fb7a4af54a23e4c970
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Adapt all patches.
* Use the new configure option enable-system-deps even though there is
  still a patch needed to correct includes.
* Disable graphics to not depends on X libraries. Disable also
  mod_avatar from the default loaded modules, since this module
  requires graphics enabled.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-remove-make-targets-for-deps.patch        |    5 +-
 ...002-remove-dependencies-from-rebar-config.patch |   82 +-
 package/ejabberd/0004-correct-include.patch        |   58 -
 package/ejabberd/0004-correct-includes.patch       | 1919 ++++++++++++++++++++
 package/ejabberd/0007-fix-ejabberdctl.patch        |   34 +-
 .../0008-handle-error-case-from-lib_dir.patch      |   32 +
 .../0008-rebar-uses-host-dependencies.patch        |   33 -
 package/ejabberd/0009-disable-mod_avatar.patch     |   32 +
 package/ejabberd/ejabberd.hash                     |    2 +-
 package/ejabberd/ejabberd.mk                       |   26 +-
 10 files changed, 2074 insertions(+), 149 deletions(-)

Patch is too large, so refusing to show it
