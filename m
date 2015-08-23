From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Aug 2015 20:58:01 +0200
Subject: [Buildroot] [PATCHv2] package: add comment about ipkg/opkg/rpm
Message-ID: <1440356281-10227-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Too often the question is raised, that ipkg, opkg and rpm do not work,
and users complain they can not install packages.

Even though we do have a clear and clearly explained section in our
manual, people do not read it (when will users read manuals? sigh...).

So, add a big fat comment about ipkg/opkg/rpm, that Buildroot does not
generate binary packages and does not provide any package database for
any of those package manager.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - don't use U+00A0 as first char on empty lines  (Arnout)
---
 package/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b9437d7..6a37c84 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1370,6 +1370,18 @@ endif
 endmenu
 
 menu "Package managers"
+comment "-----------------------------------------------------"
+comment "Please note:                                         "
+comment "- Buildroot does *not* generate binary packages,     "
+comment "- Buildroot does *not* install any package database. "
+comment "*                                                    "
+comment "It is up to you to provide those by yourself if you  "
+comment "want to use any of those package managers.           "
+comment "*                                                    "
+comment "See the manual:                                      "
+comment "http://buildroot.org/downloads/manual/manual.html#faq"
+comment "-no-binary-packages                                  "
+comment "-----------------------------------------------------"
 	source "package/ipkg/Config.in"
 	source "package/opkg/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-- 
1.9.1
