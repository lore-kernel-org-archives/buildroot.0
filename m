From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Mar 2014 00:04:07 +0100
Subject: [Buildroot] [PATCH 0/4 v4] legal-info: extract packages to get
	license files (branch yem/legal)
Message-ID: <cover.1395097170.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a series that fixes the legal-info infra:
  - extracts sources before copying license files
  - saves license files even for no-redistribute packages
  - cleans up to account for the changes (comment and helper rename)


Changes v3 -> v4:
  - save licens files for no-redistribute packages  (Luca)
  - download sources before copying to legal-info/sources/
  - rename a legal-info helper

Changes v2 -> v3:
  - fix manifest for no-redistribute, or overriden, or local packages


Regards,
Yann E. MORIN.


The following changes since commit 3749143418a2a735ceaed63667a8b3ef66bba9e5:

  package: drop <PKG>_VERSION_MINOR variable (2014-03-17 23:50:08 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/legal

for you to fetch changes up to ff3371fa4250df5d073cbcb772d9e5563cec4348:

  legal-info: rename legal-warning-pkg-savednothing helper (2014-03-17 23:51:27 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      legal-info: extract even no-redistribute packages
      legal-info: save license files even for no-redistribute packages
      legal-info: add a comment about what packages we save the tarballs of
      legal-info: rename legal-warning-pkg-savednothing helper

 package/pkg-generic.mk | 45 ++++++++++++++++++++++++++++++---------------
 package/pkg-utils.mk   |  4 ++--
 2 files changed, 32 insertions(+), 17 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
