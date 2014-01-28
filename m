From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 27 Jan 2014 19:42:55 -0500
Subject: [Buildroot] [PATCH] erlang: bump version to R16B03-1
Message-ID: <1390869775-13612-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OTP R16B03-1 is a service release which corrects a few issues found in
the R16B03 release. The corrections are:

 - The ODBC application was missing in the prebuilt Windows installers
 - 3 corrections in the SSL application:
   - Add missing validation of the server_name_indication option and test for
     its explicit use.
   - Elliptic curve selection in server mode now properly selects a curve
     suggested by the client, if possible.
   - The server did not indicate support for secure renegotiation during TLS
     extension handling.
 - In the syntax tools application a bug was introduced which broke
   reverting of local funs. This is now corrected (thanks to Anthony
   Ramine)
 - wx - Solved a problem which caused the debugger to crash when closing a
   window. Fixed static linking on Mac.
 - xmerl - Fixed a problem in the SAX-parser when the header of the next
   document was appearing in the buffer when using the
   xmerl_sax_parser:stream/2 function.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang/erlang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 18ceb7b..1572731 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_VERSION = R16B03
+ERLANG_VERSION = R16B03-1
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
-- 
1.8.3.2
