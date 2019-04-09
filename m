From: Markus Mayer <mmayer@broadcom.com>
Date: Tue,  9 Apr 2019 15:05:15 -0700
Subject: [Buildroot] [PATCH] support/dependencies/dependencies.sh: simplify
 an error message
Message-ID: <20190409220515.793-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no need to break the "\n" sequence using "%sn". We can just
escape it. Note: the escaping backslash needs to be escaped too,
because the shell will process the string before printf gets to see it.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 support/dependencies/dependencies.sh | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 826874baa2e8..1d5c164aa65b 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -37,8 +37,7 @@ case ":${PATH:-unset}:" in
 	;;
 (*"
 "*)	printf "\n"
-	# Break the '\n' sequence, or a \n is printed (which is not what we want).
-	printf "Your PATH contains a newline (%sn) character.\n" "\\"
+	printf "Your PATH contains a newline (\\\n) character.\n"
 	printf "This doesn't work. Fix you PATH.\n"
 	exit 1
 	;;
-- 
2.17.1
