From: Nigel Kukard <nkukard@lbsd.net>
Date: Mon, 21 Dec 2009 07:21:04 +0000
Subject: [Buildroot] [pull request] Pull request for branch rpm-update
Message-ID: <cover.1261380062.git.nkukard@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 14aa5ee54f33d05a0bd01f21635e095ba07f83ec:
  Peter Korsgaard (1):
        mtd-utils: move phony dependencies to toplevel mtd-host target

are available in the git repository at:

  git://git.busybox.net/~nkukard/git/buildroot rpm-update

Nigel Kukard (1):
      Update rpm

 package/rpm/Config.in                             |   26 ++-
 package/rpm/rpm-5.1.6_exclude-some-tools.patch    |   12 -
 package/rpm/rpm-5.1.6_magic-file-fix.patch        |   40 ----
 package/rpm/rpm-5.2.0_depends-fix.patch           |   19 ++
 package/rpm/rpm-5.2.0_exclude-some-tools.patch    |   30 +++
 package/rpm/rpm-5.2.0_no-parentdirs.patch         |   14 ++
 package/rpm/rpm-5.2.0_ordering-fix.patch          |   45 ++++
 package/rpm/rpm-5.2.0_parentdir-vs-requires.patch |   37 ++++
 package/rpm/rpm-5.2.0_short-circuit-c99.patch     |  235 +++++++++++++++++++++
 package/rpm/rpm.mk                                |   21 ++-
 10 files changed, 416 insertions(+), 63 deletions(-)
 delete mode 100755 package/rpm/rpm-5.1.6_exclude-some-tools.patch
 delete mode 100755 package/rpm/rpm-5.1.6_magic-file-fix.patch
 create mode 100644 package/rpm/rpm-5.2.0_depends-fix.patch
 create mode 100644 package/rpm/rpm-5.2.0_exclude-some-tools.patch
 create mode 100644 package/rpm/rpm-5.2.0_no-parentdirs.patch
 create mode 100644 package/rpm/rpm-5.2.0_ordering-fix.patch
 create mode 100644 package/rpm/rpm-5.2.0_parentdir-vs-requires.patch
 create mode 100644 package/rpm/rpm-5.2.0_short-circuit-c99.patch

Thanks,
-- 
Nigel Kukard
