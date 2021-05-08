From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 May 2021 10:58:36 +0200
Subject: [Buildroot] [git commit] package/python3: security bump to version
 3.9.5
Message-ID: <20210508083725.0045486B12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f02c0ee1b035ca3b035caa55e3452f56d76e5230
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- bpo-43434: Creating a sqlite3.Connection object now also produces a
  sqlite3.connect auditing event.  Previously this event was only produced
  by sqlite3.connect() calls.  Patch by Erlend E.  Aasland.

- bpo-43882: The presence of newline or tab characters in parts of a URL
  could allow some forms of attacks.
  Following the controlling specification for URLs defined by WHATWG
  urllib.parse() now removes ASCII newlines and tabs from URLs, preventing
  such attacks.

- bpo-43472: Ensures interpreter-level audit hooks receive the
  cpython.PyInterpreterState_New event when called through the
  _xxsubinterpreters module.

- bpo-36384: ipaddress module no longer accepts any leading zeros in IPv4
  address strings.  Leading zeros are ambiguous and interpreted as octal
  notation by some libraries.  For example the legacy function
  socket.inet_aton() treats leading zeros as octal notatation.  glibc
  implementation of modern inet_pton() does not accept any leading zeros.
  For a while the ipaddress module used to accept ambiguous leading zeros.

- bpo-43075: Fix Regular Expression Denial of Service (ReDoS) vulnerability
  in urllib.request.AbstractBasicAuthHandler.  The ReDoS-vulnerable regex
  has quadratic worst-case complexity and it allows cause a denial of
  service when identifying crafted invalid RFCs.  This ReDoS issue is on the
  client side and needs remote attackers to control the HTTP server.

- bpo-42800: Audit hooks are now fired for frame.f_code, traceback.tb_frame,
  and generator code/frame attribute access.

https://www.python.org/downloads/release/python-395/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 2a0ba6ab4f..78571b5e0b 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-394/
-md5  2a3dba5fc75b695c45cf1806156e1a97  Python-3.9.4.tar.xz
+# From https://www.python.org/downloads/release/python-395/
+md5  71f7ada6bec9cdbf4538adc326120cfd  Python-3.9.5.tar.xz
 # Locally computed
-sha256  4b0e6644a76f8df864ae24ac500a51bbf68bd098f6a173e27d3b61cdca9aa134  Python-3.9.4.tar.xz
+sha256  0c5a140665436ec3dbfbb79e2dfb6d192655f26ef4a29aeffcb6d1820d716d83  Python-3.9.5.tar.xz
 sha256  599826df92bfdcd2702eac691072498bb096c55af04ee984cf90f70ed77b5a70  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 345c6a8699..b492e09154 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.9
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
