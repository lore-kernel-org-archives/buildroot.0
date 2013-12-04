From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Dec 2013 13:11:32 +0100
Subject: [Buildroot] [git commit] support: fix typo in mkusers
Message-ID: <20131204121152.8530F9BEF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f34b761e053dff82604f22111d1029e7d0812020
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes typos in the 'encode_password' function calls.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/mkusers |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
