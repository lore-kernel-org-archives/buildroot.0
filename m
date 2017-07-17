From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Jul 2017 17:00:23 +0000
Subject: [Buildroot] [Bug 10091] gcc7.1 does not build with graphite support
 due to old isl
In-Reply-To: <bug-10091-163@https.bugs.busybox.net/>
References: <bug-10091-163@https.bugs.busybox.net/>
Message-ID: <bug-10091-163-XuR09TzFpi@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10091

--- Comment #3 from Andrey Yurovsky <yurovsky@gmail.com> ---
I just tried bumping ISL and was able to build GCC7 with graphite (for ARMv5 in
this case), I'm trying to better understand the dependencies here but perhaps
ISL 0.18 doesn't need cloog or can work with the older version.

diff --git a/package/isl/isl.hash b/package/isl/isl.hash
index e2c14ad14..22941de42 100644
--- a/package/isl/isl.hash
+++ b/package/isl/isl.hash
@@ -1,2 +1,4 @@
 # Locally computed
 sha256 8882c9e36549fc757efa267706a9af733bb8d7fe3905cbfde43e17a89eea4675       
isl-0.14.1.tar.xz
+sha256 0f35051cc030b87c673ac1f187de40e386a1482a0cfdf2c552dd6031b307ddc4 
isl-0.18.tar.xz
+
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index 74de125b6..85d013723 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -7,7 +7,7 @@
 # The latest 0.15 version is not yet compatible with cloog 0.18.3, so
 # bumping isl is not possible until a new version of cloog is
 # published.
-ISL_VERSION = 0.14.1
+ISL_VERSION = 0.18
 ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
 ISL_SITE = http://isl.gforge.inria.fr
 ISL_LICENSE = MIT

-- 
You are receiving this mail because:
You are on the CC list for the bug.
