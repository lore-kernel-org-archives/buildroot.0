From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 May 2020 09:58:22 +0200
Subject: [Buildroot] [git commit] package/apparmor: replace deprecated egrep
 with grep -E
Message-ID: <20200508075218.CC7D690FD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6569d76aeaf4726359166b429bf42e54ec9ce71e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream commit: 5f46dedd6e8109d845af118b36039a5d7dd05af9

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0002-replace-deprecated-egrep-with-grep-e.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch b/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch
new file mode 100644
index 0000000000..4caefe447b
--- /dev/null
+++ b/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch
@@ -0,0 +1,28 @@
+From 5f46dedd6e8109d845af118b36039a5d7dd05af9 Mon Sep 17 00:00:00 2001
+From: Christian Boltz <apparmor@cboltz.de>
+Date: Mon, 18 Mar 2019 19:17:16 +0100
+Subject: [PATCH] replace deprecated egrep with grep -e
+
+(cherry picked from commit 5f46dedd6e8109d845af118b36039a5d7dd05af9)
+Signed-off-by: Christian Boltz <apparmor@cboltz.de>
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ parser/rc.apparmor.functions | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/parser/rc.apparmor.functions b/parser/rc.apparmor.functions
+index 22e8367..f3108f8 100644
+--- a/parser/rc.apparmor.functions
++++ b/parser/rc.apparmor.functions
+@@ -129,7 +129,7 @@ skip_profile() {
+ 	     "${profile%.pacnew}" != "${profile}" ] ; then
+ 		return 2
+ 	fi
+-	if echo "${profile}" | egrep -q '^.+\.new-[0-9\.]+_[0-9]+$'; then
++	if echo "${profile}" | grep -E -q '^.+\.new-[0-9\.]+_[0-9]+$'; then
+ 		return 2
+ 	fi
+ 
+-- 
+2.26.2
+
