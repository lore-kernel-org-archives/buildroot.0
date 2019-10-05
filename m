From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 Oct 2019 14:22:14 +0200
Subject: [Buildroot] [PATCH v2 00/13] Improve alphabetical order checking of
 Config.in files
Message-ID: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The main purpose of this patch series is to improve alphabetical order
checking of comments, menus and packages in Config.in files.
Patches 1-6 are preliminary ones and add small improvements.
Patches 7, 9, 10 do the main work.
Patches 8, 11-13 fix issues in Config.in files.

Changes v1 -> v2:
  - change the subject prefix checkpackagelib/lib_config.py to utils/checkpackagelib
    in all patches (Ricardo)
  - drop patch: 
    utils/checkpackagelib: CommentsMenusPackagesOrder: drop function get_line (Ricardo) 
  - use package arrays initialize in before() (Ricardo)
  - improve the commit message of patch 5 (Ricardo)

Regards,
Jerzy

Jerzy Grzegorek (13):
  utils/checkpackagelib: CommentsMenusPackagesOrder: remove '-comment'
    state before the '-menu' one
  utils/checkpackagelib: CommentsMenusPackagesOrder: separate the lines
    support
  utils/checkpackagelib: CommentsMenusPackagesOrder: use '-' to describe
    state
  utils/checkpackagelib: CommentsMenusPackagesOrder: use package arrays
    initialize in before()
  utils/checkpackagelib: CommentsMenusPackagesOrder: initialize
    'menu_of_packages' array
  utils/checkpackagelib: CommentsMenusPackagesOrder: add more Config.in
    files to check
  utils/checkpackagelib: CommentsMenusPackagesOrder: check package
    ordering just before 'if ' statement
  package/Config.in: fix packages ordering
  utils/checkpackagelib: CommentsMenusPackagesOrder: check the order of
    comments menu
  utils/checkpackagelib: CommentsMenusPackagesOrder: check the order of
    menu of menus
  package/Config.in: fix menus ordering
  package/kodi/Config.in: fix menus ordering
  package/kodi/Config.in: fix menus ordering

 package/Config.in                   |  58 ++++++------
 package/kodi/Config.in              |  12 +--
 utils/checkpackagelib/lib_config.py | 133 ++++++++++++++++++++++++----
 3 files changed, 150 insertions(+), 53 deletions(-)

-- 
2.17.1
