From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 Apr 2014 23:50:11 +0200
Subject: [Buildroot] [PATCH 0/2] Misc icu fixes (branch yem/fixes)
Message-ID: <cover.1396993575.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are two patch fixing reverse dependencies of icu: icu needs threads,
so a package that selects icu should depend on threads, too.

There are other packages that select icu, but they already depend on
threads:
  - beecrypt directly depends on threads
  - cppcms depends on glibc, which always has threads
  - qt5 already depends on NPTL (which is threads)

Regards,
Yann E. MORIN.


The following changes since commit d996fe44d32a8382db7ca07636aea8d27366c448:

  gnutls: bump to version 3.2.13 (2014-04-08 14:20:09 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/fixes

for you to fetch changes up to e160bc7dcf441eeda54db0df12a31e7e95337d5b:

  package/webkit: threads are also needed for icu (2014-04-08 23:44:24 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/php: intl support needs icu, which needs threads
      package/webkit: threads are also needed for icu

 package/php/Config.ext   | 5 +++--
 package/webkit/Config.in | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
