From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 11:52:03 +0100
Subject: [Buildroot] [PATCH 1/4] br-reproduce-build: accept BASE_GIT and
	OUTPUT_DIR from the env
In-Reply-To: <cover.1423910953.git.yann.morin.1998@free.fr>
References: <cover.1423910953.git.yann.morin.1998@free.fr>
Message-ID: <ec8f06991d8b4badd77bccbfa4d5a62aec2d83bb.1423910953.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when we want to set those variables, one has to edit the
script, so would get a conflict on the next git-pull.

Instead, allow the user to specify those variables in the environment.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 utils/br-reproduce-build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/br-reproduce-build b/utils/br-reproduce-build
index 7b4961c..a84bd5a 100755
--- a/utils/br-reproduce-build
+++ b/utils/br-reproduce-build
@@ -3,12 +3,12 @@
 # A directory that contains an existing Git repository of
 # Buildroot. The script will git clone from it instead of git cloning
 # from the official repo, in order to reduce the clone time.
-BASE_GIT=/home/test/buildroot/
+BASE_GIT="${BASE_GIT:-/home/test/buildroot/}"
 
 # Location where the output directories will be created. One
 # subdirectory, named after the build ID will be created for each
 # build.
-OUTPUT_DIR=/home/test/outputs/
+OUTPUT_DIR="${OUTPUT_DIR:-/home/test/outputs/}"
 
 if [ $# -ne 1 ] ; then
     echo "Usage: $0 buildid" ;
-- 
1.9.1
