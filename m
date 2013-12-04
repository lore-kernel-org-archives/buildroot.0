From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  4 Dec 2013 13:00:54 +0100
Subject: [Buildroot] [PATCH 1/1] support: fix typo in mkusers
Message-ID: <1386158454-24057-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes typos in the 'encode_password' function calls.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 support/scripts/mkusers | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index 19aa085..3b287b8 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -307,10 +307,10 @@ add_one_user() {
     esac
     case "${passwd}" in
         !=*)
-            _passwd='!'"$( encode_passwd "${passwd#!=}" )"
+            _passwd='!'"$( encode_password "${passwd#!=}" )"
             ;;
         =*)
-            _passwd="$( encode_passwd "${passwd#=}" )"
+            _passwd="$( encode_password "${passwd#=}" )"
             ;;
         *)
             _passwd="${passwd}"
-- 
1.8.4.2
