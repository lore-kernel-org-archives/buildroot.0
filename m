From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Dec 2012 22:20:52 +0100
Subject: [Buildroot] [pull request v3] Pull request for branch
	yem-root-passwd
Message-ID: <cover.1356728899.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This is iteration #3 for setting the root password from the configuration
menu:
  - first patch adds the basic functionality:
    - plain text password in menuconfig
    - MD5-encrypted in /etc/shadow
  - second patch adds additional encryption methods

There has been previous review of this series by Arnout, who suggested
dropping patch #2, and only use an MD5-encrypted password. Since MD5 is now
considered to be a weak hash, stronger alternatives may be usefull for the
security-conscious lurking among us. That's why I kept (resurrected) that
second patch.

Arnout also objected to having the root password in clear in the .config,
and recommended that the user enters the already-encrypted password. That
has, IMHO, a few drawbacks, in that it requires the user actually _reads_
the help text, switch to an alternate terminal, generates a password, and
copy-pastes it back in the initial terminal with the menuconfig. OTOH, if
the user forgets his/her password, he/she can recover it by looking at the
.config file. That's why I still advocates for entering a clear-text
password in the menuconfig.

Any more comments are welcome!

The following changes since commit 4848386446b937d4d0d9d3e9489932ca3fcb1003:

  libffi: fix mips build failures (2012-12-28 16:55:09 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-root-passwd

Yann E. MORIN (2):
      target: add option to set the root password
      target: add different methods to encode the root password

 support/dependencies/dependencies.sh |    9 +++++
 system/Config.in                     |   67 ++++++++++++++++++++++++++++++++++
 system/system.mk                     |   15 ++++++++
 3 files changed, 91 insertions(+), 0 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
