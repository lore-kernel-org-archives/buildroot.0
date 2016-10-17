From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 17 Oct 2016 23:05:40 +0200
Subject: [Buildroot] [PATCH v12 0/3] Relocatable SDK: preparatory changes
Message-ID: <20161017210543.21573-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


Here is yet another round of the series aiming improving the relocatability
of the SDK built by Buildroot.

This short series aims to clean things up about the paths used by Buildroot
by making sure the Buildroot source directory and output ones are only refered
using absolute canonical paths.

This is a prerequisite to reliably detect and fix RPATH in the SDK.

Regards,
Samuel

Samuel Martin (3):
  core: split variables definition related to in/out-of-tree build from
    O itself
  core: reorder top-level Makefile and document things
  core: re-enter make if $(CURDIR) or $(O) are not canonical paths

 Makefile | 81 ++++++++++++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 59 insertions(+), 22 deletions(-)

--
2.10.0
