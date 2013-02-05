From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  5 Feb 2013 18:15:58 +0100
Subject: [Buildroot] [pull request v4] Pull request for branch
	arnout-update-config
Message-ID: <cover.1360084128.git.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

 Hello,

 This is a refresh of the patches that describe in the manual how
to save the configuration in the board directory, that add the
post-build overlay option, and that does 'make savedefconfig' save
to a configured file rather than "defconfig".

 The patches that add a xxx-update-config for each package with a
configuration possibility and that add an update-all-configs goal
have been left out, because at the BR developer days it was decided
to always update the config after you do a xxx-menuconfig. So
those patches will become superfluous anyway. They will come in a
separate series.

 These patches come as a series rather than individually because the
later ones all update the documentation that is added in the first
one.

 Regards,
 Arnout
--

The following changes since commit ddd69b5609cc9bd954afcfc2f91831d64b9cfff7:

  libffi: switch to using a Git version, brings Microblaze and Xtensa support (2013-02-05 15:57:02 +0100)

are available in the git repository at:

  https://git.gitorious.org/buildroot/buildroot.git arnout-update-config

for you to fetch changes up to 41e27bc2d2881606d1da299f6056d24bc9d34e78:

  Make savedefconfig save to a configured file. (2013-02-05 17:59:37 +0100)

----------------------------------------------------------------
Arnout Vandecappelle (Essensium/Mind) (4):
      manual: add section about storing the configuration.
      target/generic: add filesystem overlay option
      busybox: busybox-update-config should depend on busybox-configure
      Make savedefconfig save to a configured file.

 Config.in                                 |   12 +++
 Makefile                                  |   26 ++++-
 docs/manual/adding-packages-directory.txt |    1 +
 docs/manual/board-support.txt             |   38 -------
 docs/manual/customize-rootfs.txt          |   17 +--
 docs/manual/customize-store.txt           |  159 +++++++++++++++++++++++++++++
 docs/manual/customize.txt                 |    2 +
 package/busybox/busybox.mk                |    2 +-
 system/Config.in                          |   11 ++
 9 files changed, 219 insertions(+), 49 deletions(-)
 delete mode 100644 docs/manual/board-support.txt
 create mode 100644 docs/manual/customize-store.txt
--
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
