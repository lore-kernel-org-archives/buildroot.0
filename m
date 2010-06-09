From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Jun 2010 12:04:25 +0200
Subject: [Buildroot] [git commit master 1/1] dependencies.sh: fix CWD in
	PATH check
Message-ID: <20100609100642.CB5CA7FA57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=016eb67078952e6309d573d447b7df25cde0aa15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1999

Signed-off-by: Nick Leverton <nick@leverton.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                |    1 +
 toolchain/dependencies/dependencies.sh |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0c4b9d6..3ba7195 100644
--- a/CHANGES
+++ b/CHANGES
@@ -30,6 +30,7 @@
 	#1951: Bump openssl to 0.9.8o
 	#1957: Bump sqlite to 3.6.23.1
 	#1987: intltool: Fix spelling mistake
+	#1999: Typo in path checking
 
 2010.05, Released May 30th, 2010:
 
diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 34149c1..96f843f 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -41,7 +41,7 @@ if test -n "$PATH" ; then
 	/bin/echo TRiGGER_start"$PATH"TRiGGER_end | /bin/grep ':\.:' >/dev/null 2>&1 ||
 	/bin/echo TRiGGER_start"$PATH"TRiGGER_end | /bin/grep 'TRiGGER_start\.:' >/dev/null 2>&1 ||
 	/bin/echo TRiGGER_start"$PATH"TRiGGER_end | /bin/grep ':\.TRiGGER_end' >/dev/null 2>&1 ||
-	/bin/echo TRiGGER_start"$PATH"TRiGGER_end | /bin/grep 'TRIGGER_start\.TRIGGER_end' >/dev/null 2>&1
+	/bin/echo TRiGGER_start"$PATH"TRiGGER_end | /bin/grep 'TRiGGER_start\.TRiGGER_end' >/dev/null 2>&1
 	if test $? = 0; then
 		/bin/echo -e "\nYou seem to have the current working directory in your"
 		/bin/echo -e "PATH environment variable. This doesn't work.\n"
-- 
1.7.1
