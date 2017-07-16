From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Jul 2017 19:22:34 +0200
Subject: [Buildroot] [PATCH 0/2 v2] core/legal: support multi-version
	packages
Message-ID: <cover.1500225742.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series fixes our legal-info license check for packages that
have different versions and for which the licensing information has
changed between the versions, but the license files are named the same.

This is the case for Qt5 for example, where some license files for 5.6
are different than for 5.8, but are named the same.

Also fix checking the hashes of license files for host packages.

Changes v1 -> v2:
  - fallback to the main hash file is the per-version file does not
    exist,
  - fix checking hashes of host license files


Regards,
Yann E. MORIN.


The following changes since commit 9a0a0a976bc1094719556065ab5e982c6ca27563

  arch/mips: add support for MIPS32 FP mode (2017-07-16 16:45:22 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 868f6cd4d02b61525edf78c8a11afd2655be3425

  core/legal-info: use hash file from version sub-dir (2017-07-16 19:20:47 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      core/legal-info: properly check hashes of license files for host packages
      core/legal-info: use hash file from version sub-dir

 docs/manual/adding-packages-directory.txt | 4 +++-
 package/pkg-generic.mk                    | 2 +-
 package/pkg-utils.mk                      | 9 ++++++---
 3 files changed, 10 insertions(+), 5 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
