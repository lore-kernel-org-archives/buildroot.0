From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 22:32:57 +0200
Subject: [Buildroot] [PATCH 0/9 v2] pacakge/lua: introduce ABI versions
 (branch yem/lua-abi)
Message-ID: <cover.1595881971.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This is a respin of the initial series by James, slighlty massaged by me
to account for the various feedbacks in the initial iteration.

Regards,
Yann E. MORIN.


Regards,
Yann E. MORIN.


The following changes since commit b2f79735f6d64911853d0defe970660fadb4e257

  package/systemd: bump version to 245.7 (2020-07-27 21:17:54 +0200)


are available in the git repository at:

  https://git.busybox.net/~ymorin/git/buildroot

for you to fetch changes up to 38bcaecb671e2bb943336715c1fd92c8cb3cff23

  package/luaposix: select bit32 based on lua ABI version 5.1 (2020-07-27 22:30:59 +0200)


----------------------------------------------------------------
James Hilliard (8):
      package/efl: depend on LuaJIT
      package/minetest: depend on LuaJIT
      package/prosody: don't depend on !lua 5.3
      package/luainterpreter: add abi version options
      package/sysdig: depend on lua ABI version 5.1
      package/collectd: depend on luainterpreter for lua support
      package/solarus: depend on lua ABI version 5.1
      package/luaposix: select bit32 based on lua ABI version 5.1

Yann E. MORIN (1):
      package/luainterpreter: gather the ABI version string defaults

 package/collectd/Config.in       |  5 ++++-
 package/collectd/collectd.mk     |  2 +-
 package/efl/Config.in            |  6 ++----
 package/lua/Config.in            |  6 ++----
 package/luainterpreter/Config.in |  8 ++++++++
 package/luajit/Config.in         |  4 +---
 package/luaposix/Config.in       |  2 +-
 package/minetest/Config.in       |  4 +---
 package/prosody/Config.in        |  4 ----
 package/solarus/Config.in        |  7 +++----
 package/sysdig/Config.in         | 11 +++++------
 package/sysdig/sysdig.mk         | 13 ++++++++++++-
 12 files changed, 40 insertions(+), 32 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
