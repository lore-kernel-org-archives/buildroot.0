From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Dec 2016 10:43:03 +0100
Subject: [Buildroot] [PATCH 0/3 v2] support: better check for a host with an
	UTF8 locale
Message-ID: <cover.1480844552.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

When configured with support for locales, uClibc needs an UTF-8 locale
on the build machine.

This series makes it simpler to require such a locale, by introducing a
blind kconfig option to require an UTF-8 locale.

uClibc is made to select this option when it wants to build locales.

Then, when checking dependencies, we use that option rather than
reconstructign the conditions in the script. This means we no longer
check it for glibc or musl, but tests have shown that this is not
needed.

Changes v1 -> v2;
  - drop the tvheadend patch
  - rework changelogs accordingly

Regards,
Yann E. MORIN.


The following changes since commit 9139822448592b8b388c525f2e7beb0b14fa9bc7

  core: find an UFT8 locale on the host (2016-12-03 16:52:15 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 8b7030696b25d8b072124ac60530bd98eca8f3f6

  support/dependencies: use the new kconfig option to check UTF8 locale (2016-12-04 10:38:29 +0100)


----------------------------------------------------------------
Yann E. MORIN (3):
      core: add a kconfig option to require an UTF8 locale on the host
      package/uclibc: needs a host with an UTF8 locale to build locales
      support/dependencies: use the new kconfig option to check UTF8 locale

 Config.in                            | 5 +++++
 package/uclibc/Config.in             | 1 +
 support/dependencies/dependencies.sh | 3 +--
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
