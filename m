From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  2 Jan 2018 21:04:06 +0100
Subject: [Buildroot] [PATCH 0/2] fs/iso9660: fix transparent (de)compression
Message-ID: <cover.1514923441.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

We need mkzftree, from zisofs_tools, bundled in cdrkit. This was missing
so far, so here we add it as a new package, and make iso9660 depend on
it when needed.

The kernel also needs support for compressed isofs, so we update the
test kernel config.

Finally, the kernel images must be stored uncompressed in the iso9660
filesystem, because grub does not decompresses the files it reads from
the filesystem.


Regards,
Yann E. MORIN.


The following changes since commit 55d79ed93e44e1876334f795c6313ea6f406d229

  eeprog: remove package (2018-01-02 10:10:25 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to e793abe185c20ebd853db927552156e203813613

  fs/iso9660: fix transparent (de)compression (2018-01-02 20:57:10 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/zisofs_tools: new package
      fs/iso9660: fix transparent (de)compression

 fs/iso9660/iso9660.mk                               | 12 ++++++++----
 package/zisofs_tools/zisofs_tools.hash              |  5 +++++
 package/zisofs_tools/zisofs_tools.mk                | 15 +++++++++++++++
 support/testing/conf/minimal-x86-qemu-kernel.config |  1 +
 4 files changed, 29 insertions(+), 4 deletions(-)
 create mode 100644 package/zisofs_tools/zisofs_tools.hash
 create mode 100644 package/zisofs_tools/zisofs_tools.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
