From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Aug 2018 08:27:13 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] makedevs: allow leading
 whitespace for capabilities
Message-ID: <20180810062602.85AF98B81D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c92d7ed08d6c801ca7910026eb191bbbfce8bcb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Currently makedevs silently ignores extended attributes with leading
whitespace, for example those added to a <PACKAGE>_PERMISSIONS following
the recommended style from check-package.

Makedevs already ignores leading whitespace for normal entries (file
permission changes and device files creation). Do the same for extended
attributes.

Fixes: #11191.

Reported-by: Jean-pierre Cartal <jpcartal@free.fr>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2d8d5ced107ab2a05d023873de4e8f12f081e5af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/makedevs/makedevs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index 1ba5936342..c57b964f5c 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -510,7 +510,7 @@ int main(int argc, char **argv)
 
 		linenum++;
 
-		if (1 == sscanf(line, "|xattr %254s", xattr)) {
+		if (1 == sscanf(line, " |xattr %254s", xattr)) {
 #ifdef EXTENDED_ATTRIBUTES
 			if (!full_name)
 				bb_error_msg_and_die("line %d should be after a file\n", linenum);
