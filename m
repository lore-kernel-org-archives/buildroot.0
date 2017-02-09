From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Thu,  9 Feb 2017 14:43:03 +0100
Subject: [Buildroot] [PATCH] mkusers: create system users/groups below
	UID/GID 1000
Message-ID: <1486647783-6622-1-git-send-email-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Try not to create users/groups past UID/GID 1000, as this space
is usually reserved for proper user/group accounts.

Change buildroot behaviour to be similar to distros (like Debian)
where UID/GID 101-999 are used for dynamic allocation to system
service accounts.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 support/scripts/mkusers | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index d834578..c9f31fc 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -4,10 +4,10 @@ myname="${0##*/}"
 
 #----------------------------------------------------------------------------
 # Configurable items
-MIN_UID=1000
-MAX_UID=1999
-MIN_GID=1000
-MAX_GID=1999
+MIN_UID=101
+MAX_UID=999
+MIN_GID=101
+MAX_GID=999
 # No more is configurable below this point
 #----------------------------------------------------------------------------
 
-- 
2.7.4
