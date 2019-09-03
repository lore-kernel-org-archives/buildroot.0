From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:03:33 +0200
Subject: [Buildroot] [PATCH 00/18] Improve alphabetical order checking of
 Config.in files
Message-ID: <20190903210351.9997-1-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The main purpose of this patch series is to improve alphabetical order
checking of comments, menus and packages in Config.in files.
Patches 1-11 are preliminary ones and add small improvements.
Patches 12, 14, 15 do the main work.
Patches 13, 16-18 fix issues in  Config.in files.

Jerzy Grzegorek (18):
  checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: rename
    variable 'm'
  checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: change the
    type of variable 'level'
  checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: get value
    of variable 'level'
  checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: add
    functions to initialize arrays elements
  checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: change the
    type of variable 'new_package'
  checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: remove
    '-comment' state before the '-menu' one
  checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: separate
    the lines support
  checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: use '-' to
    describe state
  checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: drop
    function get_line
  checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: initialize
    'menu_of_packages' array
  checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: add more
    Config.in files to check
  checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: check
    package ordering just before 'if ' statement
  package/Config.in: fix packages ordering
  checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: check the
    order of comments menu
  checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: check the
    order of menu of menus
  package/Config.in: fix menus ordering
  package/kodi/Config.in: fix menus ordering
  package/kodi/Config.in: fix menus ordering

 package/Config.in                   |  72 +++++------
 package/kodi/Config.in              |  16 +--
 utils/checkpackagelib/lib_config.py | 184 ++++++++++++++++++++++------
 3 files changed, 190 insertions(+), 82 deletions(-)

-- 
2.17.1
