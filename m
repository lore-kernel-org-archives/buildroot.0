From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Apr 2018 17:39:03 +0200
Subject: [Buildroot] [PATCH v2 0/2] Switch coreutils to symlink method
Message-ID: <20180401153905.14483-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a new iteration of Carlos Santos patch [1] for coreutils, with
the following changes:

 - Add a patch to use a foreach make loop instead of a for shell loop.

 - Use the symlink method instead of shell wrappers in all cases, not
   only in the merged /usr situation, by tweaking how some programs
   are moved from /usr/bin to /bin.

[1] https://patchwork.ozlabs.org/patch/819273/

Thanks,

Thomas

Carlos Santos (1):
  coreutils: use single binary in symlink method

Thomas Petazzoni (1):
  coreutils: rewrite for loop with foreach

 package/coreutils/coreutils.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.14.3
