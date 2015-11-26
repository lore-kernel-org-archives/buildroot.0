From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Nov 2015 23:13:38 +0100
Subject: [Buildroot] [PATCH 0/2] core: use merged /usr in staging (branch
	merged-usr-staging)
Message-ID: <cover.1448575841.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

As reported by Pieterjan, when doing remote debugging with gdbserver on
a merged /usr setup, the remote gdb would only look for libraries in
staging/lib and never in staging/usr/lib.

This series replicates in staging the same merged /usr handling as we
have for target/.

This is implemented in the skeleton package, as it is the only easy
place that is guaranteed to be before all other packages *and* before
the toolchains.

Regards,
Yann E. MORIN.


The following changes since commit 66fb7028ed2779fcba45221143d6d2c5b9084303:

  strongswan: bump to version 5.3.5 (2015-11-26 21:23:18 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot merged-usr-staging

for you to fetch changes up to 0934812eeec64cb2cdc2b7600879b53695859652:

  package/skeleton: also handle merged /usr in the staging (2015-11-26 23:00:48 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/skeleton: parametrise the symlinks-or-mkdir macro
      package/skeleton: also handle merged /usr in the staging

 Makefile                     |  9 ++------
 package/skeleton/skeleton.mk | 49 ++++++++++++++++++++++++++++++--------------
 2 files changed, 36 insertions(+), 22 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
