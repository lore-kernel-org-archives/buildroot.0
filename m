From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Mar 2013 23:37:05 +0100
Subject: [Buildroot] [pull request v3] Pull request for branch yem-ext234
Message-ID: <cover.1363559530.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This patch series enhances the ext2 fs backend to also build ext3 and ext4
filesystems, and differentiate between ext2 rev0 and ext2 rev1 filesystems.

This patch series is based on the previously-sent 'yem-host-image-tools'
pull-request, and requires changes from that series to be applied first.


Changes v2 -> v3:
  - cleanup ext2 dependencies  (Thomas)
  - explain UUID removal  (Thomas)
  - use post-hook to create "ext# -> ext2" symlink  (Thomas, Arnout)
  - drop patch to let fs name the image file extension  (Thomas, Arnout)

Changes v1 -> v2:
  - enhance the ext2/3/4 generation  (Arnout, Peter)
  - allow fs generators to specify the image extension  (Arnout)
  - remove ext2 count- and time-based fsck  (Arnout)


The following changes since commit 60358f8062133496eeebfb9670ed1b8e13b45b10:

  package/mtools: new host-package (2013-03-17 23:27:56 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-ext234

Yann E. MORIN (5):
      fs/ext2: enclose the ext2 options in if...endif
      fs/ext2: add ability to build ext3/4 too
      fs/ext2: add a symlink 'rootfs.ext#' -> 'rootfs.ext2'
      fs/ext2: add support for ext2 rev0 and rev1
      fs/ext2: remove count- and time-based fsck

 fs/ext2/Config.in                |   57 +++++++++++++++++++++-----
 fs/ext2/ext2.mk                  |   14 ++++++-
 fs/ext2/genext2fs.sh             |   82 +++++++++++++++++++++++++++++++++++++-
 package/e2fsprogs/Config.in.host |    2 +-
 4 files changed, 140 insertions(+), 15 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
