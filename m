From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 25 Feb 2015 22:17:21 +0100
Subject: [Buildroot] [PATCH 04/13] autobuild-run,
	python3: configparser<>ConfigParser
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <1424899050-24932-5-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ConfigParser module has been renamed to configparser.

Py2k compatibility: import ConfigParser if version < 3

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 3a3b8de..236597d 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -70,11 +70,12 @@ from time import localtime, strftime
 import sys
 import hashlib
 import argparse
-import ConfigParser
 
 if sys.hexversion >= 0x3000000:
+    import configparser
     import urllib.request as _urllib
 else:
+    import ConfigParser as configparser
     import urllib2 as _urllib
 
 urlopen = _urllib.urlopen
@@ -599,7 +600,7 @@ Format of the configuration file:
         if not os.path.exists(args.config):
             print("ERROR: configuration file %s does not exist" % args.config)
             sys.exit(1)
-        parser = ConfigParser.RawConfigParser()
+        parser = configparser.RawConfigParser()
         if not parser.read([args.config]):
             print("ERROR: cannot parse configuration file %s" % args.config)
             sys.exit(1)
-- 
2.3.0
