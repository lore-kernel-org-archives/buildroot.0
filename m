From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Apr 2017 21:59:58 +0200
Subject: [Buildroot] [PATCH 0/9] xenomai 3.x fixups and extra config options
Message-ID: <20170419200007.12590-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Between Xenomai 2.x and 3.x a number of changes happened in the Xenomai sources,
which were not taken into account in Buildroot. This would e.g. result in extra
unwanted files on the target root filesystem, or missing license files.

The first part of this series, patches 1 to 7 deals with this problem.
Patches 8 and 9 cover additional config options for Xenomai.


Thomas De Schampheleire (9):
  xenomai: update LICENSE_FILES
  xenomai: native skin is now called alchemy
  xenomai: group skin selection in separate menu and cleanup
  xenomai: add option for Smokey skin
  xenomai: update list of Analogy installed files
  xenomai: update list of testsuite files
  xenomai: restrict installed files further
  xenomai: add support for registry
  xenomai: add string option for additional configure options

 package/xenomai/Config.in  | 64 ++++++++++++++++++++++++++++++++++++----------
 package/xenomai/xenomai.mk | 52 +++++++++++++++++++++++++++----------
 2 files changed, 88 insertions(+), 28 deletions(-)

-- 
2.10.2
