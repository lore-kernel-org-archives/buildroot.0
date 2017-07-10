From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Jul 2017 00:14:49 +0200
Subject: [Buildroot] [PATCH 0/3 v2] fs/squashfs: tweaks and cleanups
Message-ID: <cover.1499724881.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

The Linux kernel refuses to ount a squashfs image tha is not padded to
a 256KiB boundary. Fix that when generating the image, and drop the
workaround we had in our testing infra.

Clean up squashfs.mk at the same time.

Changes v1 -> v2:
  - padding to 256KiB (not 1MiB) looks like it is enough


Regards,
Yann E. MORIN.


The following changes since commit 704db1586c1408106e1337bc7a2ab3cfec593899

  support/testing: unbreak run-tests -l (2017-07-10 23:51:33 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to d93a18bd0729d35c7b7e3ce7e810d8fbf69af522

  support/test: don't workaround squashfs padding (2017-07-11 00:08:17 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      fs/squashfs: cleanup if-else cascade
      fs/squashfs: align size to 256KiB
      support/test: don't workaround squashfs padding

 DEVELOPERS                                |  1 +
 fs/squashfs/squashfs.mk                   | 15 ++++++---------
 support/testing/tests/fs/test_squashfs.py |  1 -
 3 files changed, 7 insertions(+), 10 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
