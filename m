From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 17 Jan 2018 18:44:10 +0100
Subject: [Buildroot] [PATCH v2 0/8] Add /etc/shells handling
Message-ID: <1516211058-466-1-git-send-email-romain.naour@smile.fr>
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

Romain Naour (8):
  package/skeleton-init-common: add /bin/sh to /etc/shells
  package/busybox: add /bin/{a,hu}sh to /etc/shells
  package/dash: add /etc/dash to /etc/shells
  package/screen: add /usr/bin/screen to /etc/shells
  package/tmux: add /usr/bin/tmux to /etc/shells
  package/zsh: add /bin/zsh to /etc/shells
  package/mksh: add /bin/mksh to /etc/shells
  package/bash: add missing double-dollar for /etc/shells

 package/bash/bash.mk                                 |  2 +-
 package/busybox/busybox.mk                           | 14 ++++++++++++++
 package/dash/dash.mk                                 |  4 ++++
 package/mksh/mksh.mk                                 |  8 ++++++++
 package/screen/screen.mk                             |  9 ++++++++-
 package/skeleton-init-common/skeleton-init-common.mk |  7 +++++++
 package/tmux/tmux.mk                                 |  8 ++++++++
 package/zsh/zsh.mk                                   |  8 ++++++++
 8 files changed, 58 insertions(+), 2 deletions(-)

-- 
2.7.4
