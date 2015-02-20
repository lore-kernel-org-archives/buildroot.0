From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 20 Feb 2015 13:28:57 +0100
Subject: [Buildroot] [PATCH 2/7] libserialport: drop untrue statement from
	Config.in help
In-Reply-To: <1424435342-2188-1-git-send-email-bgolaszewski@baylibre.com>
References: <1424435342-2188-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1424435342-2188-3-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to http://sigrok.org/wiki/Libserialport:

  Note: While libserialport is hosted on sigrok.org (and sigrok
  uses libserialport), this is a completely independent library
  that can be used by other projects as well. The libserialport
  library does not depend on any sigrok related libraries or
  projects.

Drop the fragment about being a part of the sigrok suite and
extend the help text.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/libserialport/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libserialport/Config.in b/package/libserialport/Config.in
index 1e2935f..d821830 100644
--- a/package/libserialport/Config.in
+++ b/package/libserialport/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_LIBSERIALPORT
 	bool "libserialport"
 	help
-	  Serial port access library.
-
-	  This library is a part of the sigrok software suite.
+	  Libserialport is a minimal, cross-platform shared
+	  library written in C that is intended to take care
+	  of the OS-specific details when writing software
+	  that uses serial ports.
 
 	  http://sigrok.org/wiki/Libserialport
-- 
2.1.4
