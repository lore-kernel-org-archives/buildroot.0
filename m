From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  6 Dec 2018 05:34:00 +0100
Subject: [Buildroot] [PATCH v2 3/5] lua*: regeneration of Config.in
In-Reply-To: <20181206043402.31755-1-francois.perrad@gadz.org>
References: <20181206043402.31755-1-francois.perrad@gadz.org>
Message-ID: <20181206043402.31755-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cgilua/Config.in             |  3 +--
 package/copas/Config.in              |  7 +++----
 package/ljlinenoise/Config.in        |  4 +---
 package/ljsyscall/Config.in          |  3 +--
 package/lpeg/Config.in               |  3 +--
 package/lpty/Config.in               |  1 -
 package/lrandom/Config.in            |  1 -
 package/lsqlite3/Config.in           |  3 +--
 package/lua-cjson/Config.in          |  1 -
 package/lua-coat/Config.in           |  2 +-
 package/lua-coatpersistent/Config.in |  5 ++---
 package/lua-compat53/Config.in       |  2 +-
 package/lua-http/Config.in           | 18 +++++++++---------
 package/lua-lpeg-patterns/Config.in  |  3 +--
 package/lua-periphery/Config.in      |  1 -
 package/lua-sailor/Config.in         | 15 +++++++--------
 package/luacrypto/Config.in          |  2 +-
 package/luadbi-sqlite3/Config.in     |  2 +-
 package/luaexpat/Config.in           |  3 +--
 package/luafilesystem/Config.in      |  1 -
 package/luajson/Config.in            |  3 +--
 package/lualogging/Config.in         |  2 +-
 package/luaposix/Config.in           |  2 +-
 package/luasec/Config.in             |  3 +--
 package/luasocket/Config.in          |  1 -
 package/luasql-sqlite3/Config.in     |  1 -
 package/orbit/Config.in              |  7 +++----
 package/rings/Config.in              |  1 -
 package/wsapi-fcgi/Config.in         |  7 ++++---
 package/wsapi-xavante/Config.in      | 11 +++++------
 package/wsapi/Config.in              |  7 ++-----
 package/xavante/Config.in            |  9 ++++-----
 32 files changed, 54 insertions(+), 80 deletions(-)

diff --git a/package/cgilua/Config.in b/package/cgilua/Config.in
index d1e7fbf0e..a6761313e 100644
--- a/package/cgilua/Config.in
+++ b/package/cgilua/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_CGILUA
 	bool "cgilua"
-	# Runtime dependency only
-	select BR2_PACKAGE_LUAFILESYSTEM
+	select BR2_PACKAGE_LUAFILESYSTEM # runtime
 	help
 	  CGILua is a tool for creating dynamic HTML pages
 	  and manipulating input data from Web forms.
diff --git a/package/copas/Config.in b/package/copas/Config.in
index d7800b6dd..f4e05ea21 100644
--- a/package/copas/Config.in
+++ b/package/copas/Config.in
@@ -1,12 +1,11 @@
 config BR2_PACKAGE_COPAS
 	bool "copas"
-	# Runtime dependency only
-	select BR2_PACKAGE_COXPCALL if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
-	select BR2_PACKAGE_LUASOCKET
+	select BR2_PACKAGE_COXPCALL if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT # runtime
+	select BR2_PACKAGE_LUASOCKET # runtime
 	help
 	  Copas is a dispatcher based on coroutines that can be used
 	  for asynchronous networking. For example TCP or UDP based
 	  servers. But it also features timers and client support for
 	  http(s), ftp and smtp requests.
 
-	  http://keplerproject.github.com/copas/
+	  http://www.keplerproject.org/copas/
diff --git a/package/ljlinenoise/Config.in b/package/ljlinenoise/Config.in
index e6b587e65..26e79e23b 100644
--- a/package/ljlinenoise/Config.in
+++ b/package/ljlinenoise/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_LJLINENOISE
 	bool "ljlinenoise"
-	# ljsyscall is specifically for LuaJIT, not Lua.
 	depends on BR2_PACKAGE_LUAJIT
-	# run-time dependency only
-	select BR2_PACKAGE_LJSYSCALL
+	select BR2_PACKAGE_LJSYSCALL # runtime
 	help
 	  ljlinenoise is a pure LuaJIT port of linenoise,
 	  a small alternative to readline and libedit.
diff --git a/package/ljsyscall/Config.in b/package/ljsyscall/Config.in
index 3af9dabe9..601d0b122 100644
--- a/package/ljsyscall/Config.in
+++ b/package/ljsyscall/Config.in
@@ -1,12 +1,11 @@
 config BR2_PACKAGE_LJSYSCALL
 	bool "ljsyscall"
-	# ljsyscall is specifically for LuaJIT, not Lua.
 	depends on BR2_PACKAGE_LUAJIT
 	help
 	  An FFI implementation of the Linux and NetBSD kernel ABIs for
 	  LuaJIT.
 
-	  http://github.com/justincormack/ljsyscall
+	  http://www.myriabit.com/ljsyscall/
 
 comment "ljsyscall needs LuaJIT"
 	depends on !BR2_PACKAGE_LUAJIT
diff --git a/package/lpeg/Config.in b/package/lpeg/Config.in
index 957991d41..0a7ea47df 100644
--- a/package/lpeg/Config.in
+++ b/package/lpeg/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_LPEG
 	bool "lpeg"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LPeg is a new pattern-matching library for Lua,
 	  based on Parsing Expression Grammars (PEGs).
 
-	  http://www.inf.puc-rio.br/~roberto/lpeg/lpeg.html
+	  http://www.inf.puc-rio.br/~roberto/lpeg.html
diff --git a/package/lpty/Config.in b/package/lpty/Config.in
index 50cbd2548..ee2d4c20b 100644
--- a/package/lpty/Config.in
+++ b/package/lpty/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LPTY
 	bool "lpty"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  A simple facility for lua to control other programs via
 	  PTYs.
diff --git a/package/lrandom/Config.in b/package/lrandom/Config.in
index 64bcf0ce0..a8a0a837a 100644
--- a/package/lrandom/Config.in
+++ b/package/lrandom/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LRANDOM
 	bool "lrandom"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  A library for generating random numbers
 	  based on the Mersenne Twister
diff --git a/package/lsqlite3/Config.in b/package/lsqlite3/Config.in
index 223fb59c9..932657e58 100644
--- a/package/lsqlite3/Config.in
+++ b/package/lsqlite3/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_LSQLITE3
 	bool "lsqlite3"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_SQLITE
 	help
-	  a thin Lua wrapper for the SQLite3 library.
+	  A binding for Lua to the SQLite3 database library.
 
 	  http://lua.sqlite.org/
diff --git a/package/lua-cjson/Config.in b/package/lua-cjson/Config.in
index 262452a82..9474b3176 100644
--- a/package/lua-cjson/Config.in
+++ b/package/lua-cjson/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUA_CJSON
 	bool "lua-cjson"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  The Lua CJSON module provides JSON support for Lua.
 	  It features:
diff --git a/package/lua-coat/Config.in b/package/lua-coat/Config.in
index fa7aed90a..f34f6b97e 100644
--- a/package/lua-coat/Config.in
+++ b/package/lua-coat/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUA_COAT
 	bool "lua-coat"
 	help
-	  Yet Another Lua Object-Oriented Model
+	  Yet Another Lua Object-Oriented Model.
 
 	  https://fperrad.frama.io/lua-Coat/
diff --git a/package/lua-coatpersistent/Config.in b/package/lua-coatpersistent/Config.in
index 049a0bc2a..4e8e64329 100644
--- a/package/lua-coatpersistent/Config.in
+++ b/package/lua-coatpersistent/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_LUA_COATPERSISTENT
 	bool "lua-coatpersistent"
 	depends on BR2_PACKAGE_LSQLITE3 || BR2_PACKAGE_LUASQL_SQLITE3
-	# run-time dependencies
-	select BR2_PACKAGE_DADO
-	select BR2_PACKAGE_LUA_COAT
+	select BR2_PACKAGE_DADO # runtime
+	select BR2_PACKAGE_LUA_COAT # runtime
 	help
 	  An ORM for lua-Coat.
 
diff --git a/package/lua-compat53/Config.in b/package/lua-compat53/Config.in
index 7ab3d740f..76c5b3fd7 100644
--- a/package/lua-compat53/Config.in
+++ b/package/lua-compat53/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_LUA_COMPAT53
 	depends on !BR2_PACKAGE_LUA_5_3
 	help
 	  Compatibility module providing Lua-5.3-style APIs for Lua 5.2
-	  and 5.1
+	  and 5.1.
 
 	  https://github.com/keplerproject/lua-compat-5.3
diff --git a/package/lua-http/Config.in b/package/lua-http/Config.in
index 247cc4031..8aaec69ef 100644
--- a/package/lua-http/Config.in
+++ b/package/lua-http/Config.in
@@ -1,16 +1,16 @@
 config BR2_PACKAGE_LUA_HTTP
 	bool "lua-http"
 	depends on BR2_TOOLCHAIN_HAS_THREADS    # luaossl & lua-cqueues
-	# These are runtime dependencies
-	select BR2_PACKAGE_LUA_BASEXX
-	select BR2_PACKAGE_LUA_COMPAT53 if !BR2_PACKAGE_LUA_5_3
-	select BR2_PACKAGE_LUA_CQUEUES
-	select BR2_PACKAGE_LUA_FIFO
-	select BR2_PACKAGE_LUA_LPEG_PATTERNS
-	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA_5_1
-	select BR2_PACKAGE_LUAOSSL
+	select BR2_PACKAGE_LPEG # runtime
+	select BR2_PACKAGE_LUA_BASEXX # runtime
+	select BR2_PACKAGE_LUA_COMPAT53 if !BR2_PACKAGE_LUA_5_3 # runtime
+	select BR2_PACKAGE_LUA_CQUEUES # runtime
+	select BR2_PACKAGE_LUA_FIFO # runtime
+	select BR2_PACKAGE_LUA_LPEG_PATTERNS # runtime
+	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA_5_1 # runtime
+	select BR2_PACKAGE_LUAOSSL # runtime
 	help
-	  HTTP library for Lua
+	  HTTP library for Lua.
 
 	  https://daurnimator.github.io/lua-http/
 
diff --git a/package/lua-lpeg-patterns/Config.in b/package/lua-lpeg-patterns/Config.in
index 9c701d3de..08c063a0c 100644
--- a/package/lua-lpeg-patterns/Config.in
+++ b/package/lua-lpeg-patterns/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LUA_LPEG_PATTERNS
 	bool "lua-lpeg-patterns"
-	# These are runtime dependencies
-	select BR2_PACKAGE_LPEG
+	select BR2_PACKAGE_LPEG # runtime
 	help
 	  a collection of LPEG patterns.
 
diff --git a/package/lua-periphery/Config.in b/package/lua-periphery/Config.in
index de5a71633..e40abd712 100644
--- a/package/lua-periphery/Config.in
+++ b/package/lua-periphery/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUA_PERIPHERY
 	bool "lua-periphery"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  A library for GPIO, SPI, I2C, MMIO, and Serial peripheral I/O
 	  interface access in userspace Linux with Lua.
diff --git a/package/lua-sailor/Config.in b/package/lua-sailor/Config.in
index 2600d4600..c973c8767 100644
--- a/package/lua-sailor/Config.in
+++ b/package/lua-sailor/Config.in
@@ -1,13 +1,12 @@
 config BR2_PACKAGE_LUA_SAILOR
 	bool "lua-sailor"
-	# These are runtime dependencies
-	select BR2_PACKAGE_CGILUA
-	select BR2_PACKAGE_LBASE64
-	select BR2_PACKAGE_LUAFILESYSTEM
-	select BR2_PACKAGE_LUA_DATAFILE
-	select BR2_PACKAGE_LUA_VALUA
-	select BR2_PACKAGE_XAVANTE
-	select BR2_PACKAGE_WSAPI_XAVANTE
+	select BR2_PACKAGE_CGILUA # runtime
+	select BR2_PACKAGE_LBASE64 # runtime
+	select BR2_PACKAGE_LUA_DATAFILE # runtime
+	select BR2_PACKAGE_LUA_VALUA # runtime
+	select BR2_PACKAGE_LUAFILESYSTEM # runtime
+	select BR2_PACKAGE_WSAPI_XAVANTE # runtime
+	select BR2_PACKAGE_XAVANTE # runtime
 	help
 	  Sailor is a web framework written in Lua that follows the MVC
 	  design pattern.
diff --git a/package/luacrypto/Config.in b/package/luacrypto/Config.in
index e9d43cd80..cc5a8803a 100644
--- a/package/luacrypto/Config.in
+++ b/package/luacrypto/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LUACRYPTO
 	  (MD5, SHA-1, HMAC, and more) and crypto-grade random number
 	  generators communication.
 
-	  http://luacrypto.luaforge.net
+	  http://mkottman.github.com/luacrypto/
diff --git a/package/luadbi-sqlite3/Config.in b/package/luadbi-sqlite3/Config.in
index 6ed32a29a..600c5526f 100644
--- a/package/luadbi-sqlite3/Config.in
+++ b/package/luadbi-sqlite3/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LUADBI_SQLITE3
 	bool "luadbi-sqlite3"
-	select BR2_PACKAGE_LUADBI # runtime dependency
 	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_LUADBI # runtime
 	help
 	  LuaDBI is a database interface library for Lua.
 	  And this is the SQLite3 backend.
diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
index 7139e8c6d..2322dc430 100644
--- a/package/luaexpat/Config.in
+++ b/package/luaexpat/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_LUAEXPAT
 	bool "luaexpat"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_EXPAT
 	help
 	  LuaExpat is a SAX XML parser based on the Expat library.
 
-	  http://matthewwild.co.uk/projects/luaexpat/
+	  http://www.keplerproject.org/luaexpat/
diff --git a/package/luafilesystem/Config.in b/package/luafilesystem/Config.in
index 50e7975b9..7c130f8d3 100644
--- a/package/luafilesystem/Config.in
+++ b/package/luafilesystem/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUAFILESYSTEM
 	bool "luafilesystem"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LuaFileSystem offers a portable way to access
 	  the underlying directory structure and file attributes.
diff --git a/package/luajson/Config.in b/package/luajson/Config.in
index c04aa7f00..c9321bb70 100644
--- a/package/luajson/Config.in
+++ b/package/luajson/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LUAJSON
 	bool "luajson"
-	# run-time dependency
-	select BR2_PACKAGE_LPEG
+	select BR2_PACKAGE_LPEG # runtime
 	help
 	  LuaJSON is a customizable JSON decoder/encoder
 	  using LPEG for parsing.
diff --git a/package/lualogging/Config.in b/package/lualogging/Config.in
index bb87f57f0..a1ed775fb 100644
--- a/package/lualogging/Config.in
+++ b/package/lualogging/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LUALOGGING
 	  supports, through the use of appenders, console, file, rolling
 	  file, email, socket and SQL outputs.
 
-	  http://www.keplerproject.org/lualogging/
+	  https://github.com/Neopallium/lualogging
diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 91abcb9e3..9523b385b 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LUAPOSIX
 	# "bit32" is included in Lua 5.2+. luajit has an equivalent
 	# "bit" module, but since it has a different name, luaposix
 	# doesn't find it.
-	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT # runtime
 	help
 	  This is a POSIX binding for LuaJIT, Lua 5.1, 5.2 and 5.3;
 	  like most libraries it simply binds to C APIs on the
diff --git a/package/luasec/Config.in b/package/luasec/Config.in
index d7900a081..43527ab09 100644
--- a/package/luasec/Config.in
+++ b/package/luasec/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_LUASEC
 	bool "luasec"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LUASOCKET
+	select BR2_PACKAGE_LUASOCKET # runtime
 	help
 	  LuaSec is a binding for OpenSSL library to provide TLS/SSL
 	  communication.
diff --git a/package/luasocket/Config.in b/package/luasocket/Config.in
index 45f959e8d..45263030f 100644
--- a/package/luasocket/Config.in
+++ b/package/luasocket/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUASOCKET
 	bool "luasocket"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LuaSocket is the most comprehensive networking support library
 	  for the Lua language.
diff --git a/package/luasql-sqlite3/Config.in b/package/luasql-sqlite3/Config.in
index 483d6a0f3..cc4d3d545 100644
--- a/package/luasql-sqlite3/Config.in
+++ b/package/luasql-sqlite3/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUASQL_SQLITE3
 	bool "luasql-sqlite3"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_SQLITE
 	help
 	  LuaSQL is a simple interface from Lua to a DBMS.
diff --git a/package/orbit/Config.in b/package/orbit/Config.in
index 8df42a838..7b6e9a43f 100644
--- a/package/orbit/Config.in
+++ b/package/orbit/Config.in
@@ -1,10 +1,9 @@
 config BR2_PACKAGE_ORBIT
 	bool "orbit"
 	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
-	# These are runtime dependencies
-	select BR2_PACKAGE_LPEG
-	select BR2_PACKAGE_LUAFILESYSTEM
-	select BR2_PACKAGE_WSAPI_XAVANTE
+	select BR2_PACKAGE_LPEG # runtime
+	select BR2_PACKAGE_LUAFILESYSTEM # runtime
+	select BR2_PACKAGE_WSAPI_XAVANTE # runtime
 	help
 	  An MVC web framework for Lua. The design is inspired by
 	  lightweight Ruby frameworks such as Camping
diff --git a/package/rings/Config.in b/package/rings/Config.in
index 87ade07cb..d1f1efe55 100644
--- a/package/rings/Config.in
+++ b/package/rings/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_RINGS
 	bool "rings"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  Provides a way to create new Lua states from within Lua.
 
diff --git a/package/wsapi-fcgi/Config.in b/package/wsapi-fcgi/Config.in
index b4304a065..51f554524 100644
--- a/package/wsapi-fcgi/Config.in
+++ b/package/wsapi-fcgi/Config.in
@@ -2,11 +2,12 @@ config BR2_PACKAGE_WSAPI_FCGI
 	bool "wsapi-fcgi"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBFCGI
-	# Runtime dependency only
-	select BR2_PACKAGE_WSAPI
+	select BR2_PACKAGE_COXPCALL # runtime
+	select BR2_PACKAGE_RINGS # runtime
+	select BR2_PACKAGE_WSAPI # runtime
 	help
 	  WSAPI is an API that abstracts the web server from Lua web
 	  applications. This is the rock that contains the FCGI module
 	  lfcgi.
 
-	  http://keplerproject.github.com/wsapi/
+	  http://www.keplerproject.org/wsapi
diff --git a/package/wsapi-xavante/Config.in b/package/wsapi-xavante/Config.in
index 3e494bba8..ae2935d55 100644
--- a/package/wsapi-xavante/Config.in
+++ b/package/wsapi-xavante/Config.in
@@ -1,13 +1,12 @@
 config BR2_PACKAGE_WSAPI_XAVANTE
 	bool "wsapi-xavante"
-	# Runtime dependencies
-	select BR2_PACKAGE_COXPCALL
-	select BR2_PACKAGE_RINGS
-	select BR2_PACKAGE_WSAPI
-	select BR2_PACKAGE_XAVANTE
+	select BR2_PACKAGE_COXPCALL # runtime
+	select BR2_PACKAGE_RINGS # runtime
+	select BR2_PACKAGE_WSAPI # runtime
+	select BR2_PACKAGE_XAVANTE # runtime
 	help
 	  WSAPI is an API that abstracts the web server from Lua web
 	  applications. This is the rock that contains the Xavante
 	  adapter and launcher.
 
-	  http://keplerproject.github.com/wsapi/
+	  http://www.keplerproject.org/wsapi
diff --git a/package/wsapi/Config.in b/package/wsapi/Config.in
index 348a0404b..96f04ec91 100644
--- a/package/wsapi/Config.in
+++ b/package/wsapi/Config.in
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_WSAPI
 	bool "wsapi"
-	# Runtime dependency only
-	select BR2_PACKAGE_COXPCALL
-	select BR2_PACKAGE_LUAFILESYSTEM
-	select BR2_PACKAGE_RINGS
+	select BR2_PACKAGE_LUAFILESYSTEM # runtime
 	help
 	  API that abstracts the web server from Lua web applications.
 
-	  http://keplerproject.github.com/wsapi/
+	  http://www.keplerproject.org/wsapi
diff --git a/package/xavante/Config.in b/package/xavante/Config.in
index d66ca1f0a..209ec2d2c 100644
--- a/package/xavante/Config.in
+++ b/package/xavante/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_XAVANTE
 	bool "xavante"
-	# Runtime dependency only
-	select BR2_PACKAGE_COPAS
-	select BR2_PACKAGE_LUAFILESYSTEM
-	select BR2_PACKAGE_LUASOCKET
+	select BR2_PACKAGE_COPAS # runtime
+	select BR2_PACKAGE_LUAFILESYSTEM # runtime
+	select BR2_PACKAGE_LUASOCKET # runtime
 	help
 	  Xavante is a Lua HTTP 1.1 Web server that uses a modular
 	  architecture based on URI mapped handlers. Xavante currently
@@ -11,4 +10,4 @@ config BR2_PACKAGE_XAVANTE
 	  Those are used for general files, URI remapping and WSAPI
 	  applications respectively.
 
-	  http://keplerproject.github.com/xavante/
+	  http://keplerproject.github.io/xavante
-- 
2.17.1
