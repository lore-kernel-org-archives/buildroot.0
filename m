From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 23:24:49 +0100
Subject: [Buildroot] [git commit] test-pkg: filter empty lines and comments
 in CSV file
Message-ID: <20171201205339.8AD7A80160@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9272eb468463deff3a3b181db0372e64b51affc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for the addition of comments in the CSV file listing
toolchain configurations, we filter out such lines when reading the
CSV file in utils/test-pkg.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/test-pkg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 6899d44..1b7046e 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -54,7 +54,7 @@ main() {
     # Extract the URLs of the toolchains; drop internal toolchains
     # E.g.: http://server/path/to/name.config,arch,libc
     #  -->  http://server/path/to/name.config
-    toolchains=($(sed -r -e 's/,.*//; /internal/d;' "${toolchains_csv}" \
+    toolchains=($(sed -r -e 's/,.*//; /internal/d; /^#/d; /^$/d;' "${toolchains_csv}" \
                   |if [ ${random} -gt 0 ]; then \
                       sort -R |head -n ${random}
                    else
