From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Oct 2018 18:32:58 +0200
Subject: [Buildroot] [scanrock 4/5] lua*: regeneration of Config.in
In-Reply-To: <20181021163259.28335-1-francois.perrad@gadz.org>
References: <20181021163259.28335-1-francois.perrad@gadz.org>
Message-ID: <20181021163259.28335-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/argparse/Config.in           |  6 +-----
 package/cgilua/Config.in             |  7 +++----
 package/copas/Config.in              | 12 ++++--------
 package/coxpcall/Config.in           |  6 ++----
 package/dado/Config.in               |  4 ++--
 package/ljlinenoise/Config.in        |  7 ++-----
 package/ljsyscall/Config.in          |  6 ++----
 package/lpeg/Config.in               |  6 ++----
 package/lpty/Config.in               |  4 +---
 package/lrandom/Config.in            |  4 +---
 package/lsqlite3/Config.in           |  3 +--
 package/lua-basexx/Config.in         |  4 +---
 package/lua-bit32/Config.in          |  4 +---
 package/lua-cjson/Config.in          | 12 +-----------
 package/lua-coatpersistent/Config.in |  7 +++----
 package/lua-csnappy/Config.in        |  3 +--
 package/lua-curl/Config.in           |  4 ++--
 package/lua-datafile/Config.in       |  5 ++---
 package/lua-fifo/Config.in           |  2 +-
 package/lua-flu/Config.in            |  5 +----
 package/lua-http/Config.in           | 16 ++++++++--------
 package/lua-iconv/Config.in          |  4 ++--
 package/lua-lpeg-patterns/Config.in  |  5 ++---
 package/lua-markdown/Config.in       |  3 +--
 package/lua-messagepack/Config.in    |  4 ++--
 package/lua-periphery/Config.in      |  4 +---
 package/lua-resty-http/Config.in     |  2 +-
 package/lua-sailor/Config.in         | 20 +++++++++-----------
 package/lua-sdl2/Config.in           |  6 +++---
 package/lua-stdlib/Config.in         |  7 ++-----
 package/lua-testmore/Config.in       |  2 +-
 package/lua-utf8/Config.in           |  3 +--
 package/lua-valua/Config.in          |  5 +----
 package/luabitop/Config.in           |  5 ++---
 package/luacrypto/Config.in          |  8 ++------
 package/luadbi-sqlite3/Config.in     |  5 ++---
 package/luadbi/Config.in             |  6 +-----
 package/luaexpat/Config.in           |  5 ++---
 package/luafilesystem/Config.in      |  4 +---
 package/luajson/Config.in            |  6 ++----
 package/lualogging/Config.in         |  7 ++-----
 package/luaossl/Config.in            |  9 +--------
 package/luaposix/Config.in           | 10 +++-------
 package/luasec/Config.in             |  7 +++----
 package/luasocket/Config.in          |  6 +-----
 package/luasql-sqlite3/Config.in     |  5 ++---
 package/lunit/Config.in              |  2 +-
 package/orbit/Config.in              | 12 +++++-------
 package/rings/Config.in              |  5 ++---
 package/wsapi-fcgi/Config.in         | 11 +++++------
 package/wsapi-xavante/Config.in      | 15 ++++++---------
 package/wsapi/Config.in              |  9 +++------
 package/xavante/Config.in            | 15 +++++----------
 53 files changed, 119 insertions(+), 225 deletions(-)

diff --git a/package/argparse/Config.in b/package/argparse/Config.in
index d207b0482..f8e71a0cd 100644
--- a/package/argparse/Config.in
+++ b/package/argparse/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_ARGPARSE
 	bool "argparse"
 	help
-	  Argparse is a feature-rich command line parser for Lua
-	  inspired by argparse for Python. Argparse supports
-	  positional arguments, options, flags, optional arguments,
-	  subcommands and more. Argparse automatically generates
-	  usage, help and error messages.
+	  A feature-rich command-line argument parser
 
 	  https://github.com/mpeterv/argparse
diff --git a/package/cgilua/Config.in b/package/cgilua/Config.in
index d1e7fbf0e..65c0ad934 100644
--- a/package/cgilua/Config.in
+++ b/package/cgilua/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_CGILUA
 	bool "cgilua"
-	# Runtime dependency only
-	select BR2_PACKAGE_LUAFILESYSTEM
+	select BR2_PACKAGE_LUAFILESYSTEM # runtime
 	help
-	  CGILua is a tool for creating dynamic HTML pages
-	  and manipulating input data from Web forms.
+	  Tool for creating dynamic Web pages and manipulating data from
+	  Web forms
 
 	  http://keplerproject.github.com/cgilua
diff --git a/package/copas/Config.in b/package/copas/Config.in
index d7800b6dd..e093c9e0c 100644
--- a/package/copas/Config.in
+++ b/package/copas/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_COPAS
 	bool "copas"
-	# Runtime dependency only
-	select BR2_PACKAGE_COXPCALL if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
-	select BR2_PACKAGE_LUASOCKET
+	select BR2_PACKAGE_COXPCALL if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT # runtime
+	select BR2_PACKAGE_LUASOCKET # runtime
 	help
-	  Copas is a dispatcher based on coroutines that can be used
-	  for asynchronous networking. For example TCP or UDP based
-	  servers. But it also features timers and client support for
-	  http(s), ftp and smtp requests.
+	  Coroutine Oriented Portable Asynchronous Services
 
-	  http://keplerproject.github.com/copas/
+	  http://www.keplerproject.org/copas/
diff --git a/package/coxpcall/Config.in b/package/coxpcall/Config.in
index 373501795..9cea8a097 100644
--- a/package/coxpcall/Config.in
+++ b/package/coxpcall/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_COXPCALL
 	bool "coxpcall"
 	help
-	  Coxpcall encapsulates the protected calls with a coroutine
-	  based loop, so errors can be handled without the usual
-	  pcall/xpcall issues with coroutines for Lua 5.1.
+	  Coroutine safe xpcall and pcall
 
-	  http://keplerproject.github.io/coxpcall/
+	  http://keplerproject.github.io/coxpcall
diff --git a/package/dado/Config.in b/package/dado/Config.in
index fb469f40e..7f9870a61 100644
--- a/package/dado/Config.in
+++ b/package/dado/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DADO
 	bool "dado"
 	help
-	  Database Facilities for LuaSQL.
+	  Database Facilities for LuaSQL
 
-	  http://www.ccpa.puc-rio.br/software/dado/
+	  http://www.ccpa.puc-rio.br/software/dado
diff --git a/package/ljlinenoise/Config.in b/package/ljlinenoise/Config.in
index e6b587e65..f3c1e2f90 100644
--- a/package/ljlinenoise/Config.in
+++ b/package/ljlinenoise/Config.in
@@ -1,12 +1,9 @@
 config BR2_PACKAGE_LJLINENOISE
 	bool "ljlinenoise"
-	# ljsyscall is specifically for LuaJIT, not Lua.
 	depends on BR2_PACKAGE_LUAJIT
-	# run-time dependency only
-	select BR2_PACKAGE_LJSYSCALL
+	select BR2_PACKAGE_LJSYSCALL # runtime
 	help
-	  ljlinenoise is a pure LuaJIT port of linenoise,
-	  a small alternative to readline and libedit.
+	  Line editing in pure LuaJIT
 
 	  https://fperrad.frama.io/ljlinenoise/
 
diff --git a/package/ljsyscall/Config.in b/package/ljsyscall/Config.in
index 3af9dabe9..d335018ee 100644
--- a/package/ljsyscall/Config.in
+++ b/package/ljsyscall/Config.in
@@ -1,12 +1,10 @@
 config BR2_PACKAGE_LJSYSCALL
 	bool "ljsyscall"
-	# ljsyscall is specifically for LuaJIT, not Lua.
 	depends on BR2_PACKAGE_LUAJIT
 	help
-	  An FFI implementation of the Linux and NetBSD kernel ABIs for
-	  LuaJIT.
+	  LuaJIT Linux syscall FFI
 
-	  http://github.com/justincormack/ljsyscall
+	  http://www.myriabit.com/ljsyscall/
 
 comment "ljsyscall needs LuaJIT"
 	depends on !BR2_PACKAGE_LUAJIT
diff --git a/package/lpeg/Config.in b/package/lpeg/Config.in
index 957991d41..d1ab5001f 100644
--- a/package/lpeg/Config.in
+++ b/package/lpeg/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LPEG
 	bool "lpeg"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
-	  LPeg is a new pattern-matching library for Lua,
-	  based on Parsing Expression Grammars (PEGs).
+	  Parsing Expression Grammars For Lua
 
-	  http://www.inf.puc-rio.br/~roberto/lpeg/lpeg.html
+	  http://www.inf.puc-rio.br/~roberto/lpeg.html
diff --git a/package/lpty/Config.in b/package/lpty/Config.in
index 50cbd2548..a87318183 100644
--- a/package/lpty/Config.in
+++ b/package/lpty/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LPTY
 	bool "lpty"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
-	  A simple facility for lua to control other programs via
-	  PTYs.
+	  A simple facility for lua to control other programs via PTYs.
 
 	  http://www.tset.de/lpty/
diff --git a/package/lrandom/Config.in b/package/lrandom/Config.in
index 64bcf0ce0..720c1a9fc 100644
--- a/package/lrandom/Config.in
+++ b/package/lrandom/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LRANDOM
 	bool "lrandom"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
-	  A library for generating random numbers
-	  based on the Mersenne Twister
+	  A library for generating random numbers.
 
 	  http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#lrandom
diff --git a/package/lsqlite3/Config.in b/package/lsqlite3/Config.in
index 223fb59c9..57ec407b3 100644
--- a/package/lsqlite3/Config.in
+++ b/package/lsqlite3/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_LSQLITE3
 	bool "lsqlite3"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_SQLITE
 	help
-	  a thin Lua wrapper for the SQLite3 library.
+	  A binding for Lua to the SQLite3 database library
 
 	  http://lua.sqlite.org/
diff --git a/package/lua-basexx/Config.in b/package/lua-basexx/Config.in
index 2f3bb1dec..06a789a1d 100644
--- a/package/lua-basexx/Config.in
+++ b/package/lua-basexx/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LUA_BASEXX
 	bool "lua-basexx"
 	help
-	  A Lua library which provides base2(bitfield), base16(hex),
-	  base32(crockford/rfc), base64(rfc/url), base85(z85) decoding
-	  and encoding.
+	  A base2, base16, base32, base64 and base85 library for Lua
 
 	  https://github.com/aiq/basexx
diff --git a/package/lua-bit32/Config.in b/package/lua-bit32/Config.in
index f896940de..e0316ef8a 100644
--- a/package/lua-bit32/Config.in
+++ b/package/lua-bit32/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LUA_BIT32
 	bool "lua-bit32"
 	help
-	  bit32 is the native Lua 5.2 bit manipulation library, in the
-	  version from Lua 5.3; it is compatible with Lua 5.1, 5.2 and
-	  5.3.
+	  Lua 5.2 bit manipulation library
 
 	  http://www.lua.org/manual/5.2/manual.html#6.7
diff --git a/package/lua-cjson/Config.in b/package/lua-cjson/Config.in
index 262452a82..dac3cee6a 100644
--- a/package/lua-cjson/Config.in
+++ b/package/lua-cjson/Config.in
@@ -1,16 +1,6 @@
 config BR2_PACKAGE_LUA_CJSON
 	bool "lua-cjson"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
-	  The Lua CJSON module provides JSON support for Lua.
-	  It features:
-	  - Fast, standards compliant encoding/parsing routines
-	  - Full support for JSON with UTF-8, including decoding
-	    surrogate pairs
-	  - Optional run-time support for common exceptions to the JSON
-	    specification (infinity, NaN, ...)
-	  - No dependencies on other libraries
-
-	  (C-module)
+	  A fast JSON encoding/parsing module
 
 	  http://www.kyne.com.au/~mark/software/lua-cjson.php
diff --git a/package/lua-coatpersistent/Config.in b/package/lua-coatpersistent/Config.in
index 049a0bc2a..216f34570 100644
--- a/package/lua-coatpersistent/Config.in
+++ b/package/lua-coatpersistent/Config.in
@@ -1,11 +1,10 @@
 config BR2_PACKAGE_LUA_COATPERSISTENT
 	bool "lua-coatpersistent"
 	depends on BR2_PACKAGE_LSQLITE3 || BR2_PACKAGE_LUASQL_SQLITE3
-	# run-time dependencies
-	select BR2_PACKAGE_DADO
-	select BR2_PACKAGE_LUA_COAT
+	select BR2_PACKAGE_DADO # runtime
+	select BR2_PACKAGE_LUA_COAT # runtime
 	help
-	  An ORM for lua-Coat.
+	  an ORM for lua-Coat
 
 	  https://fperrad.frama.io/lua-CoatPersistent/
 
diff --git a/package/lua-csnappy/Config.in b/package/lua-csnappy/Config.in
index fb00a1300..f018b8569 100644
--- a/package/lua-csnappy/Config.in
+++ b/package/lua-csnappy/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LUA_CSNAPPY
 	bool "lua-csnappy"
 	help
-	  lua-csnappy is a binding of the csnappy library
-	  which implements the Google's Snappy (de)compressor.
+	  a fast compressor/decompressor
 
 	  https://fperrad.frama.io/lua-csnappy/
diff --git a/package/lua-curl/Config.in b/package/lua-curl/Config.in
index 88cdaf10c..fd4f3261d 100644
--- a/package/lua-curl/Config.in
+++ b/package/lua-curl/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_LUA_CURL
 	bool "lua-curl"
 	select BR2_PACKAGE_LIBCURL
 	help
-	  Lua binding to libcurl.
+	  Lua binding to libcurl
 
-	  https://lua-curl.github.io/
+	  https://github.com/Lua-cURL
diff --git a/package/lua-datafile/Config.in b/package/lua-datafile/Config.in
index e65406ed8..9eb489390 100644
--- a/package/lua-datafile/Config.in
+++ b/package/lua-datafile/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LUA_DATAFILE
 	bool "lua-datafile"
 	help
-	  datafile is a library for avoiding hardcoded paths
-	  when loading resource files in Lua modules.
+	  A library for handling paths when loading data files
 
-	  https://github.com/hishamhm/datafile
+	  http://github.com/hishamhm/datafile
diff --git a/package/lua-fifo/Config.in b/package/lua-fifo/Config.in
index 5715b6bd2..097a2de55 100644
--- a/package/lua-fifo/Config.in
+++ b/package/lua-fifo/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUA_FIFO
 	bool "lua-fifo"
 	help
-	  A lua library/'class' that implements a FIFO.
+	  A lua library/'class' that implements a FIFO
 
 	  https://github.com/daurnimator/fifo.lua
diff --git a/package/lua-flu/Config.in b/package/lua-flu/Config.in
index 526dc9008..8c2e061ec 100644
--- a/package/lua-flu/Config.in
+++ b/package/lua-flu/Config.in
@@ -6,10 +6,7 @@ config BR2_PACKAGE_LUA_FLU
 	select BR2_PACKAGE_ATTR
 	select BR2_PACKAGE_LIBFUSE
 	help
-	  Flu is a Lua binding for FUSE, which is a library allowing
-	  creation of filesystem drivers run in userspace. Flu is a high
-	  level binding, using basic Lua types rather than userdata
-	  whenever possible.
+	  Filesystems in Lua Userspace.
 
 	  http://piratery.net/flu/
 
diff --git a/package/lua-http/Config.in b/package/lua-http/Config.in
index 247cc4031..561e0677b 100644
--- a/package/lua-http/Config.in
+++ b/package/lua-http/Config.in
@@ -1,14 +1,14 @@
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
 	  HTTP library for Lua
 
diff --git a/package/lua-iconv/Config.in b/package/lua-iconv/Config.in
index e76019d67..de85e2fee 100644
--- a/package/lua-iconv/Config.in
+++ b/package/lua-iconv/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_LUA_ICONV
 	bool "lua-iconv"
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
-	  Lua binding to the POSIX 'iconv' library
+	  Lua binding to the iconv
 
-	  http://ittner.github.io/lua-iconv/
+	  http://ittner.github.com/lua-iconv/
diff --git a/package/lua-lpeg-patterns/Config.in b/package/lua-lpeg-patterns/Config.in
index 9c701d3de..741ca5d98 100644
--- a/package/lua-lpeg-patterns/Config.in
+++ b/package/lua-lpeg-patterns/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_LUA_LPEG_PATTERNS
 	bool "lua-lpeg-patterns"
-	# These are runtime dependencies
-	select BR2_PACKAGE_LPEG
+	select BR2_PACKAGE_LPEG # runtime
 	help
-	  a collection of LPEG patterns.
+	  a collection of LPEG patterns
 
 	  https://github.com/daurnimator/lpeg_patterns
diff --git a/package/lua-markdown/Config.in b/package/lua-markdown/Config.in
index c53dc4606..dff35aa50 100644
--- a/package/lua-markdown/Config.in
+++ b/package/lua-markdown/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LUA_MARKDOWN
 	bool "lua-markdown"
 	help
-	  A pure-lua implementation of the Markdown text-to-html
-	  markup system.
+	  Markdown text-to-html markup system.
 
 	  https://github.com/mpeterv/markdown
diff --git a/package/lua-messagepack/Config.in b/package/lua-messagepack/Config.in
index 7ec098f9a..69ec2f985 100644
--- a/package/lua-messagepack/Config.in
+++ b/package/lua-messagepack/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LUA_MESSAGEPACK
 	bool "lua-messagepack"
 	help
-	  A pure Lua implementation of the MessagePack serialization
-	  format.
+	  a pure Lua implementation of the MessagePack serialization
+	  format
 
 	  https://fperrad.frama.io/lua-MessagePack/
diff --git a/package/lua-periphery/Config.in b/package/lua-periphery/Config.in
index de5a71633..e8f422fc5 100644
--- a/package/lua-periphery/Config.in
+++ b/package/lua-periphery/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LUA_PERIPHERY
 	bool "lua-periphery"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
-	  A library for GPIO, SPI, I2C, MMIO, and Serial peripheral I/O
-	  interface access in userspace Linux with Lua.
+	  Linux Peripheral I/O (GPIO, SPI, I2C, MMIO, Serial) with Lua
 
 	  https://github.com/vsergeev/lua-periphery
diff --git a/package/lua-resty-http/Config.in b/package/lua-resty-http/Config.in
index 4697c90df..9e39a8105 100644
--- a/package/lua-resty-http/Config.in
+++ b/package/lua-resty-http/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_LUA_RESTY_HTTP
 	help
 	  Lua HTTP client cosocket driver for OpenResty / ngx_lua.
 
-	  http://github.com/pintsized/lua-resty-http
+	  https://github.com/pintsized/lua-resty-http
diff --git a/package/lua-sailor/Config.in b/package/lua-sailor/Config.in
index 2600d4600..822fe56db 100644
--- a/package/lua-sailor/Config.in
+++ b/package/lua-sailor/Config.in
@@ -1,15 +1,13 @@
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
-	  Sailor is a web framework written in Lua that follows the MVC
-	  design pattern.
+	  A Lua MVC Framework
 
-	  http://sailorproject.org/
+	  http://sailorproject.org
diff --git a/package/lua-sdl2/Config.in b/package/lua-sdl2/Config.in
index 65f9e7ff4..7ab051310 100644
--- a/package/lua-sdl2/Config.in
+++ b/package/lua-sdl2/Config.in
@@ -3,10 +3,10 @@ config BR2_PACKAGE_LUA_SDL2
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_SDL2
 	help
-	  Lua-SDL2 is a pure C binding of SDL2 to Lua 5.1, Lua 5.2,
-	  Lua 5.3, and LuaJIT.
+	  Lua-SDL2 is a pure C binding of SDL 2.0 for Lua 5.1, JIT, 5.2,
+	  and 5.3
 
-	  https://github.com/Tangent128/luasdl2
+	  https://github.com/Tangent128/luasdl2/
 
 comment "lua-sdl2 needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/lua-stdlib/Config.in b/package/lua-stdlib/Config.in
index 1843826c2..8bf620d74 100644
--- a/package/lua-stdlib/Config.in
+++ b/package/lua-stdlib/Config.in
@@ -1,9 +1,6 @@
 config BR2_PACKAGE_LUA_STDLIB
 	bool "lua-stdlib"
 	help
-	  lua-stdlib is a library of modules for common programming
-	  tasks, including list, table and functional operations,
-	  objects, pickling, pretty-printing and command-line option
-	  parsing.
+	  General Lua Libraries
 
-	  https://github.com/lua-stdlib/lua-stdlib/
+	  http://lua-stdlib.github.io/lua-stdlib
diff --git a/package/lua-testmore/Config.in b/package/lua-testmore/Config.in
index 3cbed3840..d6ab702b0 100644
--- a/package/lua-testmore/Config.in
+++ b/package/lua-testmore/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUA_TESTMORE
 	bool "lua-testmore"
 	help
-	  an Unit Testing Framework.
+	  an Unit Testing Framework
 
 	  https://fperrad.frama.io/lua-TestMore/
diff --git a/package/lua-utf8/Config.in b/package/lua-utf8/Config.in
index 313fa4e45..91671271d 100644
--- a/package/lua-utf8/Config.in
+++ b/package/lua-utf8/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LUA_UTF8
 	bool "lua-utf8"
 	help
-	  This module adds UTF-8 support to Lua.
-	  It's compatible with Lua "string" module.
+	  A UTF-8 support module for Lua
 
 	  http://github.com/starwing/luautf8
diff --git a/package/lua-valua/Config.in b/package/lua-valua/Config.in
index 96b379651..3d442be37 100644
--- a/package/lua-valua/Config.in
+++ b/package/lua-valua/Config.in
@@ -1,9 +1,6 @@
 config BR2_PACKAGE_LUA_VALUA
 	bool "lua-valua"
 	help
-	  This module provides tools for validating values, very useful
-	  in forms, but also usable elsewhere. It works in appended
-	  chains. Create a new validation object and start chaining
-	  your test functions.
+	  Validation for Lua!
 
 	  https://github.com/sailorproject/valua
diff --git a/package/luabitop/Config.in b/package/luabitop/Config.in
index a819fe8ae..3e29985d2 100644
--- a/package/luabitop/Config.in
+++ b/package/luabitop/Config.in
@@ -2,10 +2,9 @@ config BR2_PACKAGE_LUABITOP
 	bool "luabitop"
 	depends on !BR2_PACKAGE_LUA_5_3
 	help
-	  Lua BitOp is a C extension module for Lua 5.1/5.2 which adds
-	  bitwise operations on numbers.
+	  Lua Bit Operations Module
 
-	  http://bitop.luajit.org
+	  http://bitop.luajit.org/
 
 comment "luabitop needs a Lua 5.1/5.2 interpreter"
 	depends on BR2_PACKAGE_LUA_5_3
diff --git a/package/luacrypto/Config.in b/package/luacrypto/Config.in
index e9d43cd80..641e7ed97 100644
--- a/package/luacrypto/Config.in
+++ b/package/luacrypto/Config.in
@@ -2,10 +2,6 @@ config BR2_PACKAGE_LUACRYPTO
 	bool "luacrypto"
 	select BR2_PACKAGE_OPENSSL
 	help
-	  LuaCrypto provides a Lua frontend to the OpenSSL cryptographic
-	  library.
-	  The OpenSSL features that are currently exposed are digests
-	  (MD5, SHA-1, HMAC, and more) and crypto-grade random number
-	  generators communication.
+	  A Lua frontend to OpenSSL
 
-	  http://luacrypto.luaforge.net
+	  http://mkottman.github.com/luacrypto/
diff --git a/package/luadbi-sqlite3/Config.in b/package/luadbi-sqlite3/Config.in
index 6ed32a29a..18f275557 100644
--- a/package/luadbi-sqlite3/Config.in
+++ b/package/luadbi-sqlite3/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_LUADBI_SQLITE3
 	bool "luadbi-sqlite3"
-	select BR2_PACKAGE_LUADBI # runtime dependency
 	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_LUADBI # runtime
 	help
-	  LuaDBI is a database interface library for Lua.
-	  And this is the SQLite3 backend.
+	  Database abstraction layer
 
 	  https://github.com/mwild1/luadbi
diff --git a/package/luadbi/Config.in b/package/luadbi/Config.in
index 2e2905857..49043ab9f 100644
--- a/package/luadbi/Config.in
+++ b/package/luadbi/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_LUADBI
 	bool "luadbi"
 	help
-	  LuaDBI is a database interface library for Lua.
-	  It is designed to provide a RDBMS agnostic API for handling
-	  database operations. LuaDBI also provides support for
-	  prepared statement handles, placeholders and bind parameters
-	  for all database operations.
+	  Database abstraction layer
 
 	  https://github.com/mwild1/luadbi
diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
index 7139e8c6d..e6ed164f4 100644
--- a/package/luaexpat/Config.in
+++ b/package/luaexpat/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_LUAEXPAT
 	bool "luaexpat"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_EXPAT
 	help
-	  LuaExpat is a SAX XML parser based on the Expat library.
+	  XML Expat parsing
 
-	  http://matthewwild.co.uk/projects/luaexpat/
+	  http://www.keplerproject.org/luaexpat/
diff --git a/package/luafilesystem/Config.in b/package/luafilesystem/Config.in
index 50e7975b9..ea851099b 100644
--- a/package/luafilesystem/Config.in
+++ b/package/luafilesystem/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LUAFILESYSTEM
 	bool "luafilesystem"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
-	  LuaFileSystem offers a portable way to access
-	  the underlying directory structure and file attributes.
+	  File System Library for the Lua Programming Language
 
 	  http://keplerproject.github.com/luafilesystem/
diff --git a/package/luajson/Config.in b/package/luajson/Config.in
index c04aa7f00..0358ad05c 100644
--- a/package/luajson/Config.in
+++ b/package/luajson/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_LUAJSON
 	bool "luajson"
-	# run-time dependency
-	select BR2_PACKAGE_LPEG
+	select BR2_PACKAGE_LPEG # runtime
 	help
-	  LuaJSON is a customizable JSON decoder/encoder
-	  using LPEG for parsing.
+	  customizable JSON decoder/encoder
 
 	  http://github.com/harningt/luajson
diff --git a/package/lualogging/Config.in b/package/lualogging/Config.in
index bb87f57f0..a9b2190ef 100644
--- a/package/lualogging/Config.in
+++ b/package/lualogging/Config.in
@@ -1,9 +1,6 @@
 config BR2_PACKAGE_LUALOGGING
 	bool "lualogging"
 	help
-	  LuaLogging provides a simple API to use logging features in
-	  Lua. Its design was based on log4j. LuaLogging currently
-	  supports, through the use of appenders, console, file, rolling
-	  file, email, socket and SQL outputs.
+	  A simple API to use logging features
 
-	  http://www.keplerproject.org/lualogging/
+	  https://github.com/Neopallium/lualogging
diff --git a/package/luaossl/Config.in b/package/luaossl/Config.in
index d8763e76a..470467b22 100644
--- a/package/luaossl/Config.in
+++ b/package/luaossl/Config.in
@@ -3,14 +3,7 @@ config BR2_PACKAGE_LUAOSSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
 	help
-	  luaossl is a comprehensive binding to OpenSSL for Lua 5.1,
-	  5.2, and later.
-
-	  It includes support for certificate and key management,
-	  key generation, signature verification, and deep bindings
-	  to the distinguished name, alternative name, and X.509v3
-	  extension interfaces. It also binds OpenSSL's bignum, message
-	  digest, HMAC, cipher, and CSPRNG interfaces.
+	  Most comprehensive OpenSSL module in the Lua universe.
 
 	  http://25thandclement.com/~william/projects/luaossl.html
 
diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 91abcb9e3..67fbca285 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -4,12 +4,8 @@ config BR2_PACKAGE_LUAPOSIX
 	# "bit32" is included in Lua 5.2+. luajit has an equivalent
 	# "bit" module, but since it has a different name, luaposix
 	# doesn't find it.
-	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT # runtime
 	help
-	  This is a POSIX binding for LuaJIT, Lua 5.1, 5.2 and 5.3;
-	  like most libraries it simply binds to C APIs on the
-	  underlying system, so it won't work on non-POSIX systems.
-	  However, it does try to detect the level of POSIX conformance
-	  of the underlying system and bind only available APIs.
+	  Lua bindings for POSIX
 
-	  https://github.com/luaposix/luaposix
+	  http://github.com/luaposix/luaposix/
diff --git a/package/luasec/Config.in b/package/luasec/Config.in
index d7900a081..d22fd57a6 100644
--- a/package/luasec/Config.in
+++ b/package/luasec/Config.in
@@ -1,10 +1,9 @@
 config BR2_PACKAGE_LUASEC
 	bool "luasec"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LUASOCKET
+	select BR2_PACKAGE_LUASOCKET # runtime
 	help
-	  LuaSec is a binding for OpenSSL library to provide TLS/SSL
-	  communication.
+	  A binding for OpenSSL library to provide TLS/SSL communication
+	  over LuaSocket.
 
 	  https://github.com/brunoos/luasec/wiki
diff --git a/package/luasocket/Config.in b/package/luasocket/Config.in
index 45f959e8d..d92a55f78 100644
--- a/package/luasocket/Config.in
+++ b/package/luasocket/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_LUASOCKET
 	bool "luasocket"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
-	  LuaSocket is the most comprehensive networking support library
-	  for the Lua language.
-	  It provides easy access to TCP, UDP, DNS, SMTP,
-	  FTP, HTTP, MIME and much more.
+	  Network support for the Lua language
 
 	  http://luaforge.net/projects/luasocket/
diff --git a/package/luasql-sqlite3/Config.in b/package/luasql-sqlite3/Config.in
index 483d6a0f3..6bad2121f 100644
--- a/package/luasql-sqlite3/Config.in
+++ b/package/luasql-sqlite3/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_LUASQL_SQLITE3
 	bool "luasql-sqlite3"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_SQLITE
 	help
-	  LuaSQL is a simple interface from Lua to a DBMS.
+	  Database connectivity for Lua (SQLite3 driver)
 
-	  http://www.keplerproject.org/luasql
+	  http://www.keplerproject.org/luasql/
diff --git a/package/lunit/Config.in b/package/lunit/Config.in
index d6c2c6b15..ceb43da5e 100644
--- a/package/lunit/Config.in
+++ b/package/lunit/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LUNIT
 	bool "lunit"
 	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
 	help
-	  A unit testing framework for Lua.
+	  A unit testing framework for Lua
 
 	  http://www.mroth.net/lunit/
 
diff --git a/package/orbit/Config.in b/package/orbit/Config.in
index 8df42a838..80624c57c 100644
--- a/package/orbit/Config.in
+++ b/package/orbit/Config.in
@@ -1,15 +1,13 @@
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
-	  An MVC web framework for Lua. The design is inspired by
-	  lightweight Ruby frameworks such as Camping
+	  MVC for Lua Web Development
 
-	  http://keplerproject.github.com/orbit
+	  http://www.keplerproject.org/orbit
 
 comment "orbit needs a Lua 5.1 interpreter"
 	depends on !BR2_PACKAGE_LUA_5_1
diff --git a/package/rings/Config.in b/package/rings/Config.in
index 87ade07cb..1c3b5d444 100644
--- a/package/rings/Config.in
+++ b/package/rings/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_RINGS
 	bool "rings"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
-	  Provides a way to create new Lua states from within Lua.
+	  Create new Lua states from within Lua
 
-	  http://github.com/keplerproject/rings
+	  http://www.keplerproject.org/rings/
diff --git a/package/wsapi-fcgi/Config.in b/package/wsapi-fcgi/Config.in
index b4304a065..08163feec 100644
--- a/package/wsapi-fcgi/Config.in
+++ b/package/wsapi-fcgi/Config.in
@@ -2,11 +2,10 @@ config BR2_PACKAGE_WSAPI_FCGI
 	bool "wsapi-fcgi"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBFCGI
-	# Runtime dependency only
-	select BR2_PACKAGE_WSAPI
+	select BR2_PACKAGE_COXPCALL # runtime
+	select BR2_PACKAGE_RINGS # runtime
+	select BR2_PACKAGE_WSAPI # runtime
 	help
-	  WSAPI is an API that abstracts the web server from Lua web
-	  applications. This is the rock that contains the FCGI module
-	  lfcgi.
+	  Lua Web Server API FastCGI Adapter
 
-	  http://keplerproject.github.com/wsapi/
+	  http://www.keplerproject.org/wsapi
diff --git a/package/wsapi-xavante/Config.in b/package/wsapi-xavante/Config.in
index 3e494bba8..ae19546fc 100644
--- a/package/wsapi-xavante/Config.in
+++ b/package/wsapi-xavante/Config.in
@@ -1,13 +1,10 @@
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
-	  WSAPI is an API that abstracts the web server from Lua web
-	  applications. This is the rock that contains the Xavante
-	  adapter and launcher.
+	  Lua Web Server API - Xavante Handler
 
-	  http://keplerproject.github.com/wsapi/
+	  http://www.keplerproject.org/wsapi
diff --git a/package/wsapi/Config.in b/package/wsapi/Config.in
index 348a0404b..d8e870c20 100644
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
-	  API that abstracts the web server from Lua web applications.
+	  Lua Web Server API
 
-	  http://keplerproject.github.com/wsapi/
+	  http://www.keplerproject.org/wsapi
diff --git a/package/xavante/Config.in b/package/xavante/Config.in
index d66ca1f0a..2db896d9c 100644
--- a/package/xavante/Config.in
+++ b/package/xavante/Config.in
@@ -1,14 +1,9 @@
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
-	  Xavante is a Lua HTTP 1.1 Web server that uses a modular
-	  architecture based on URI mapped handlers. Xavante currently
-	  offers a file handler, a redirect handler and a WSAPI handler.
-	  Those are used for general files, URI remapping and WSAPI
-	  applications respectively.
+	  Lua Web Server Library
 
-	  http://keplerproject.github.com/xavante/
+	  http://keplerproject.github.io/xavante
-- 
2.17.1
