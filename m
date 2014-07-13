From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jul 2014 15:03:20 +0200
Subject: [Buildroot] [PATCH 0/4 v3] perl-infra enhancements (branch
	yem/autobuild-perl)
Message-ID: <cover.1405256442.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series enhances the pkg-erl infrastructure:
  - add possibility for packages to pass extra environment variables
    at configure time
  - fix perl-net-ssleay
  - hide perl extensions written in C when doing static build

Changes v2 -> v3:
  - aggregate Fran?ois' previous patches with mines


Regards,
Yann E. MORIN.


The following changes since commit 30252ae893298bf3f190b57d33c545e0e46c40db:

  libgpgme: disable all tests (2014-07-12 20:47:38 +0200)

are available in the git repository at:

  git://ymorin.is-a-geek.org/buildroot yem/autobuild-perl

for you to fetch changes up to fbe14dfcaa71d2c2ada7dc463b80d9898191f14c:

  package/perl-xml-libxml: not available for static link (2014-07-13 14:56:09 +0200)

----------------------------------------------------------------
Francois Perrad (2):
      infra/pkg-perl: add possibility to pass extra env at configure time
      package/perl-net-ssleay: fix buildsystem for cross-compilation

Yann E. MORIN (2):
      package/perl-net-ssleay: not available for static link
      package/perl-xml-libxml: not available for static link

 docs/manual/adding-packages-perl.txt               |  4 +++
 package/perl-net-ssleay/Config.in                  |  4 +++
 .../perl-net-ssleay-0000-fix-build-system.patch    | 36 ++++++++++++++++++++++
 package/perl-net-ssleay/perl-net-ssleay.mk         |  4 +++
 package/perl-xml-libxml/Config.in                  |  4 +++
 package/pkg-perl.mk                                |  4 +++
 6 files changed, 56 insertions(+)
 create mode 100644 package/perl-net-ssleay/perl-net-ssleay-0000-fix-build-system.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
