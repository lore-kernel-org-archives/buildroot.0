From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  2 Mar 2017 22:03:13 +0100
Subject: [Buildroot] [PATCH 0/2] core/cmake: better impersonate a Linux
	system
Message-ID: <cover.1488488581.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Some packages rely on the system name to decide whether to
enable/disable features and/or link/not link with some libraries, rather
than using detection... :-(

However, the system name is now Buildroot, because we provide our own
platform description, as was suggested by upstream cmake.

So, we tweak our platform description to change the system name back to
"Linux", so that those packages believe they are on Linux (which is
inherently true!)

Secondly, some packages completely overwrite the module path, like
fastd, rather than appending to it. For now, only fastd is handled;
other offenders will be dealt with as they are detected.


Regards,
Yann E. MORIN.


The following changes since commit 8d1128e8a898e32348618721473b82b09f4a6975

  fontconfig: needs host-gperf (2017-03-02 09:24:35 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to dd2c4dbd9c75ecc8838363ff3b21651b6aa55373

  package/fastd: do not overwrite the cmake module path (2017-03-02 22:01:02 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      support/cmake: impersonate a Linux system even more
      package/fastd: do not overwrite the cmake module path

 ...02-CMakeList-do-not-overwrite-module-path.patch | 56 ++++++++++++++++++++++
 support/misc/Buildroot.cmake                       |  4 ++
 2 files changed, 60 insertions(+)
 create mode 100644 package/fastd/0002-CMakeList-do-not-overwrite-module-path.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
