From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Apr 2019 07:45:30 +0200
Subject: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 simplify an error message
Message-ID: <20190410054249.2D4448E212@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09cb4ea933c7adec1e5074637befb8d1ce87015a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no need to break the "\n" sequence using "%sn". We can just
escape it. Note: the escaping backslash needs to be escaped too,
because the shell will process the string before printf gets to see it.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 826874baa2..1d5c164aa6 100755
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
