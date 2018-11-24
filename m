From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 10:11:13 +0100
Subject: [Buildroot] [git commit] utils/test-pkg: use the correct config
 prefix when merging
Message-ID: <20181202071558.58AFF82855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ca206e5a14167ae86b9aba9a65e2392edcb9a70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We should use an empty prefix as we do not have any prefix.
Note that BR2_ is mere a convention.

Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/test-pkg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index aa91ee02cf..e4f68ed061 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -129,7 +129,7 @@ build_one() {
 
     mkdir -p "${dir}"
 
-    support/kconfig/merge_config.sh -O "${dir}" \
+    CONFIG_= support/kconfig/merge_config.sh -O "${dir}" \
         "${toolchainconfig}" "support/config-fragments/minimal.config" "${cfg}" \
         >> "${dir}/logfile" 2>&1
     # We want all the options from the snippet to be present as-is (set
