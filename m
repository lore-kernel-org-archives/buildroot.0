From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 17:10:20 +0200
Subject: [Buildroot] [PATCH 0/5 v5] legal-info: extract packages to get
	license files (branch yem/legal)
Message-ID: <cover.1402758331.git.yann.morin.1998@free.fr>
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


Changes v4 -> v5:
  - don't warn about missing license fioles for packages bundled
    with Buildroot  (Luca)
  - new patch 5/5 to display a proper error message for missing license
    files
  - typoes

Changes v3 -> v4:
  - save licens files for no-redistribute packages  (Luca)
  - download sources before copying to legal-info/sources/
  - rename a legal-info helper

Changes v2 -> v3:
  - fix manifest for no-redistribute, or overriden, or local packages


Regards,
Yann E. MORIN.


The following changes since commit 712414ce2dc6f40ed98a3d8007e7d7ec382f79d4:

  gcc: drop redundant explicit version handling for aarch64 (2014-06-13 23:01:16 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/legal

for you to fetch changes up to 8c742a7155e0b24c14ae90f7be00c1043eceb848:

  legal-info: properly error out on missing license file (2014-06-14 16:59:40 +0200)

----------------------------------------------------------------
Yann E. MORIN (5):
      legal-info: extract even no-redistribute packages
      legal-info: save license files even for local or overriden packages
      legal-info: add a comment about what packages we save the tarballs of
      legal-info: rename legal-warning-pkg-savednothing helper
      legal-info: properly error out on missing license file

 package/pkg-generic.mk | 39 +++++++++++++++++++++++++++------------
 package/pkg-utils.mk   | 22 +++++++++++++++-------
 2 files changed, 42 insertions(+), 19 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
