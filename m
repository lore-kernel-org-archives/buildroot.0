From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 14:41:10 +0200
Subject: [Buildroot] [PATCH 0/4 v6] legal-info: extract packages to get
	license files (branch yem/legal)
Message-ID: <cover.1403439879.git.yann.morin.1998@free.fr>
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


Changes v5 -> v6:
  - fix commit log about what is actually fixed  (Luca)
  - use a proper name for the renamed macro  (Luca)
  - fix rebasing after the $$ mess ;-)
  - drop patch 5, it's no longer needed

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


The following changes since commit 8d24201f4b943b7a1edd9a16c97155f1a2efda59:

  imagemagick: bump to version 6.8.9-3 (2014-06-21 19:38:07 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/legal

for you to fetch changes up to 1b7669d8f5b489b6c8b2b3394ba1207c903a9e68:

  legal-info: rename legal-warning-pkg-savednothing helper (2014-06-22 11:19:31 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      legal-info: extract even no-redistribute packages
      legal-info: save license files even for local or overridden packages
      legal-info: add a comment about what packages we save the tarballs of
      legal-info: rename legal-warning-pkg-savednothing helper

 package/pkg-generic.mk | 39 +++++++++++++++++++++++++++------------
 package/pkg-utils.mk   |  4 ++--
 2 files changed, 29 insertions(+), 14 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
