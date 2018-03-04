From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Mar 2018 11:29:02 +0100
Subject: [Buildroot] [PATCH 0/4] package/systemd: further fix for
 locale-related issues
Message-ID: <cover.1520159327.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

As reported by Christian, not all distros have a way to provide C.UTF-8.
For example, Gentoo does not have it, and it is noteven possible to
generate it (damn...).

So we go another route: find any UTF-8 locale from the user's system,
still preferring the one they expect to see messages in.

Also, unbreak the check for an UTF-8 locale.


Regards,
Yann E. MORIN.


The following changes since commit 63497e02607543c6b27c8b59c026e78b0337dbaf

  package/tor: security bump to version 0.3.1.10 (2018-03-04 11:01:45 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 27e66e08ce8a1493c52a43e2a34aa1ed75a043f9

  core: drop no-longer used C.UTF-8 locale option (2018-03-04 11:28:29 +0100)


----------------------------------------------------------------
Yann E. MORIN (4):
      support/dependencies: unbreak check for UTF-8 locale
      core: find a host UTF-8 locale
      package/systemd: needs any UTF-8 locale
      core: drop no-longer used C.UTF-8 locale option

 Config.in                            |  5 -----
 Makefile                             | 16 ++++++++++++++++
 package/systemd/Config.in            |  2 +-
 package/systemd/systemd.mk           |  2 +-
 support/dependencies/dependencies.sh | 15 +--------------
 5 files changed, 19 insertions(+), 21 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
