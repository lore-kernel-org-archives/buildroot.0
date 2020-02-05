From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Feb 2020 15:48:39 +0100
Subject: [Buildroot] [PATCH 0/6 v2] legal-info: license files are only known
 for latest versions (branch yem/legal-info-latest-only)
Message-ID: <cover.1580914115.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series restricts the check for license files hashes to the
latest known versions of packages that have user-supplied arbitrary
versions.

Changes v1 -> v2:  (Yann)
  - only check license for latest kernel version


Regards,
Yann E. MORIN.


The following changes since commit 14ff0c73899df6db0c83c5ecb8c85429df9513e8

  package/elixir: new package (2020-02-05 15:37:51 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 76db34fbca7b956090aaf4557510cf89a3d2d72c

  boot/optee-os: license files hashes only valid for latest version (2020-02-05 15:47:14 +0100)


----------------------------------------------------------------
Markus Mayer (1):
      linux: license files hashes are only valid for latest known version

Yann E. MORIN (5):
      package/linux-headers: license files hashes only valid for latest version
      boot/uboot: license files hashes only valid for latest version
      boot/barebox: license files hashes only valid for latest version
      boot/at91bootstrap3: license files hashes only valid for latest version
      boot/optee-os: license files hashes only valid for latest version

 boot/at91bootstrap3/at91bootstrap3.mk  |  2 ++
 boot/barebox/barebox.hash              |  7 +++++--
 boot/barebox/barebox.mk                |  2 ++
 boot/optee-os/optee-os.mk              |  2 ++
 boot/uboot/uboot.mk                    |  2 ++
 linux/linux.hash                       | 20 ++++++++++++--------
 linux/linux.mk                         |  7 ++++++-
 package/linux-headers/Config.in.host   |  6 ++++++
 package/linux-headers/linux-headers.mk |  7 ++++++-
 9 files changed, 43 insertions(+), 12 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
