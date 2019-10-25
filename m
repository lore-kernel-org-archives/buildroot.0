From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Oct 2019 15:42:39 +0200
Subject: [Buildroot] [PATCH 0/2 v2] toolchain: handle toolchains with SSP in
 libssp.so (branch yem/libssp)
Message-ID: <cover.1572010936.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series fixes a build failure of sox with external toolchains
that implement SSP support in libssp.so from gcc, not the C library.

It is a respin from Yann's series, essentially with enhanced commit logs.


Regards,
Yann E. MORIN.


The following changes since commit 900024a2bbf989cdece1e2c41f579f7eac13617a

  package/qemu: Add option to enable USB passthrough support on host variant (2019-10-25 10:39:25 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 0311678e7e917354544483e815ce7112d9fe830c

  packages/sox: unconditionaly disable custom SSP detection (2019-10-25 15:32:33 +0200)


----------------------------------------------------------------
Yann Droneaud (2):
      toolchain/external: copy libssp.so if SSP is enabled
      packages/sox: unconditionaly disable custom SSP detection

 package/sox/sox.mk                                     | 12 +++++-------
 toolchain/toolchain-external/pkg-toolchain-external.mk |  4 ++++
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
