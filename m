From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 14 Jan 2018 22:03:28 +0100
Subject: [Buildroot] [PATCH 0/7] Add /etc/shells handling
Message-ID: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Started with commit [1], all package providing a shell interpreter
should  be listed in /etc/shells file to avoid issues with dropbear
or other tools.

Although a macro could be added to pkg-generic.mk to avoid
duplicating the /etc/shells handling, there is less than ten
shell packages in Buildroot. So add /etc/shells handling as
a POST_INSTALL_TARGET_HOOKS or inside INSTALL_TARGET_CMDS.

[1] 4d279697afbf8fb295274784103be2b837113d5e

Romain Naour (7):
  package/skeleton-init-common: add /bin/sh to /etc/shells
  package/busybox: add /bin/ash to /etc/shells
  package/dash: add /etc/dash to /etc/shells
  package/screen: add /usr/bin/screen to /etc/shells
  package/tmux: add /usr/bin/tmux to /etc/shells
  package/zsh: add /bin/zsh to /etc/shells
  package/mksh: add /bin/mksh to /etc/shells

 package/busybox/busybox.mk                           | 10 ++++++++++
 package/dash/dash.mk                                 |  4 ++++
 package/mksh/mksh.mk                                 |  9 +++++++++
 package/screen/screen.mk                             | 12 +++++++++++-
 package/skeleton-init-common/skeleton-init-common.mk |  7 +++++++
 package/tmux/tmux.mk                                 |  9 +++++++++
 package/zsh/zsh.mk                                   | 10 +++++++++-
 system/skeleton/etc/shells                           |  1 +
 8 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 system/skeleton/etc/shells

-- 
2.7.4
