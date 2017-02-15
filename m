From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Feb 2017 22:44:32 +0100
Subject: [Buildroot] [PATCH 4/7 v4] support/test-pkg: the list of toolchains
	really contains URLs
In-Reply-To: <cover.1487195062.git.yann.morin.1998@free.fr>
References: <cover.1487195062.git.yann.morin.1998@free.fr>
Message-ID: <ef6257273f532b2b578205926ad7bf68cb9f34e5.1487195062.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/test-pkg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 965ddaf..5714afa 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -78,11 +78,11 @@ main() {
     nb=0
     nb_skip=0
     nb_fail=0
-    for toolchain in "${toolchains[@]}"; do
+    for url in "${toolchains[@]}"; do
         : $((nb++))
-        printf "%40s [%*d/%d]: " "$(basename "${toolchain}" .config)" \
+        printf "%40s [%*d/%d]: " "$(basename "${url}" .config)" \
                                  ${#nb_tc} ${nb} ${nb_tc}
-        build_one "${dir}" "${toolchain}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
+        build_one "${dir}" "${url}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
         case ${ret} in
         (0) printf "OK\n";;
         (1) : $((nb_skip++)); printf "SKIPPED\n";;
-- 
2.7.4
