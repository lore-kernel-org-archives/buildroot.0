From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 22:14:20 +0100
Subject: [Buildroot] [git commit] package/gettext-tiny: fix gettext wrapper
Message-ID: <20191115210824.2D5918F003@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5afd8dfd5b3b6589441c37115cfb23aa31838f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a textdomain is specified, we ignore it twice: we shift args, and
we printf ${2}, which would yield an empty printf.

Fix that by not shifting, and just printf ${2}; this is nicer.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gettext-tiny/gettext-wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gettext-tiny/gettext-wrapper b/package/gettext-tiny/gettext-wrapper
index 3791a3a1aa..11424824c3 100644
--- a/package/gettext-tiny/gettext-wrapper
+++ b/package/gettext-tiny/gettext-wrapper
@@ -19,6 +19,6 @@ done
 case ${#} in
     (0)   printf "missing arguments\n" >&2; return 1;;
     (1)   printf "%s" "${1}";;
-    (2)   shift; printf "%s" "${2}";;
+    (2)   printf "%s" "${2}";;
     (*)   printf "too many arguments\n" >&2; return 1;;
 esac
