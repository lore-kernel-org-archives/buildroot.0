From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 11:52:04 +0100
Subject: [Buildroot] [PATCH 2/4] br-reproduce-build: use current directory
	as the default for outputs
In-Reply-To: <cover.1423910953.git.yann.morin.1998@free.fr>
References: <cover.1423910953.git.yann.morin.1998@free.fr>
Message-ID: <2f64e37394ac3c2806646babb32b498a2c598224.1423910953.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows the user running something like:

    cd /somewhere
    /path/to/br-reproduce-build ID

Or even have br-reproduce-build in his PATH.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 utils/br-reproduce-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/br-reproduce-build b/utils/br-reproduce-build
index a84bd5a..c0dc530 100755
--- a/utils/br-reproduce-build
+++ b/utils/br-reproduce-build
@@ -8,7 +8,7 @@ BASE_GIT="${BASE_GIT:-/home/test/buildroot/}"
 # Location where the output directories will be created. One
 # subdirectory, named after the build ID will be created for each
 # build.
-OUTPUT_DIR="${OUTPUT_DIR:-/home/test/outputs/}"
+OUTPUT_DIR="${OUTPUT_DIR:-$(pwd)}"
 
 if [ $# -ne 1 ] ; then
     echo "Usage: $0 buildid" ;
-- 
1.9.1
