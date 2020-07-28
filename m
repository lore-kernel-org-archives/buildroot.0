From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 28 Jul 2020 14:56:02 +0200
Subject: [Buildroot] [PATCH v2 00/10] Lua 5.4
Message-ID: <20200728125613.3153975-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This pacthset introduces Lua 5.4 serie.
Lua 5.4.0 is the first release of this new serie.

Packages which don't support Lua 5.3, don't support Lua 5.4 too.

Packages which need big change, are temporarily disabled (waiting for upstream).

v1 -> v2:
- refactor after the merge of James serie
- update after Thomas review

Francois Perrad (10):
  lua: add 5.4.0 version
  package/luabitop: unsupport of Lua 5.4, as 5.3
  package/lua-compat53: unsupport of Lua 5.4, as 5.3
  package/lua-messagepack: add support of Lua 5.4
  package/easybus: temporarily disabled with Lua 5.4
  package/lua-cqueues: temporarily disabled with Lua 5.4
  package/lua-flu: temporarily disabled with Lua 5.4
  package/lua-sdl2: temporarily disabled with Lua 5.4
  package/luv: temporarily disabled with Lua 5.4
  package/prosody: temporarily disabled with Lua 5.4

 package/easydbus/Config.in                    |  5 +-
 package/lua-compat53/Config.in                |  2 +-
 package/lua-cqueues/Config.in                 |  5 +-
 package/lua-flu/Config.in                     |  5 +-
 package/lua-http/Config.in                    |  7 +-
 package/lua-messagepack/lua-messagepack.mk    |  2 +-
 package/lua-sdl2/Config.in                    |  5 +-
 package/lua/5.4.0/0001-root-path.patch        | 17 ++++
 .../lua/5.4.0/0002-shared-libs-for-lua.patch  | 78 +++++++++++++++++++
 package/lua/5.4.0/0011-linenoise.patch        | 25 ++++++
 package/lua/Config.in                         |  6 +-
 package/lua/lua.hash                          |  3 +
 package/lua/lua.mk                            | 10 ++-
 package/luabitop/Config.in                    |  4 +-
 package/luainterpreter/Config.in              |  4 +
 package/luv/Config.in                         |  5 +-
 package/pkg-luarocks.mk                       |  3 +
 package/prosody/Config.in                     |  4 +
 18 files changed, 169 insertions(+), 21 deletions(-)
 create mode 100644 package/lua/5.4.0/0001-root-path.patch
 create mode 100644 package/lua/5.4.0/0002-shared-libs-for-lua.patch
 create mode 100644 package/lua/5.4.0/0011-linenoise.patch

-- 
2.25.1
