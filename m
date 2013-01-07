From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2013 22:52:02 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem-misc-fixes
Message-ID: <cover.1357595083.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces exporting a variable, $(BR2_CONFIG_FILE), that
contains the fully-qualified path to out .config.

In some cases, scripts in support/ need to parse our .config (eg. the
dependency-checking script needs to check the conformity of rxternal
toolchain features).

Also, some Makefile fragments (eg. the crosstool-Ng backend) need to
refer to this config file for make-dependency-checking.

This was currently done in different ad-hoc manners, and is not scalable.

I'll also use it later to retrieve the password encoding scheme when
creating users from packages.


The following changes since commit 13a9fc901f637a1534baa4f08322f3b29ba66b0d:

  libnspr: only pass --{enable,disable}-thumb2 on ARM (2013-01-07 09:11:44 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-misc-fixes

Yann E. MORIN (3):
      Makefile: export BR2_CONFIG_FILE, pointing to our .config
      support/dependencies: use globally-exported BR2_CONFIG_FILE
      toolchain/crostool-ng: use globally-exported CONFIG_FILE

 Makefile                                         |    4 ++++
 support/dependencies/dependencies.mk             |    1 -
 support/dependencies/dependencies.sh             |   10 +++++-----
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    4 ++--
 4 files changed, 11 insertions(+), 8 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
