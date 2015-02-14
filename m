From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 11:52:05 +0100
Subject: [Buildroot] [PATCH 3/4] br-reproduce-build: fix URL of gitid
In-Reply-To: <cover.1423910953.git.yann.morin.1998@free.fr>
References: <cover.1423910953.git.yann.morin.1998@free.fr>
Message-ID: <ca854982ed957dec6bdc523ae2974e0aa630ea75.1423910953.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 utils/br-reproduce-build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/utils/br-reproduce-build b/utils/br-reproduce-build
index c0dc530..9987684 100755
--- a/utils/br-reproduce-build
+++ b/utils/br-reproduce-build
@@ -16,9 +16,11 @@ if [ $# -ne 1 ] ; then
     exit 1 ;
 fi
 
-BUILD_ID=$1
+# BUILD_ID must be in the form xxx/xxxyyyyyyyyyy (xxxyyyyy... being the sha1)
+BUILD_ID="${1#*/}"
+BUILD_ID="${BUILD_ID%${BUILD_ID#???}}/${BUILD_ID}"
 
-BUILD_DIR=${OUTPUT_DIR}/${BUILD_ID}
+BUILD_DIR="${OUTPUT_DIR}/${BUILD_ID#*/}"
 
 mkdir -p ${BUILD_DIR}
 if [ $? -ne 0 ] ; then
-- 
1.9.1
