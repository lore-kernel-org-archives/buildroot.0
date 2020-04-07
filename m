From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 21:02:43 +0200
Subject: [Buildroot] [git commit branch/2019.11.x] package/vala: fix wrapper
Message-ID: <20200407184935.E02AB8D703@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adb823e2e04527496fb63a7b3436d5f9a70a2194
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Add double quotes around the $@ variable to prevent word splitting.

Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[yann.morin.1998 at free.fr: s/globbing/word splitting/]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 30b6db05cb29b3a79c85f3bcc9c30a18d03c6cfa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vala/vala-wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vala/vala-wrapper b/package/vala/vala-wrapper
index ae2f7ca671..84fc905b9f 100644
--- a/package/vala/vala-wrapper
+++ b/package/vala/vala-wrapper
@@ -1,2 +1,2 @@
 #!/bin/sh
-$0- at VALA_VERSION@ --vapidir=${STAGING_DIR}/usr/share/vala/vapi --girdir=${STAGING_DIR}/usr/share/gir-1.0 $@
+$0- at VALA_VERSION@ --vapidir=${STAGING_DIR}/usr/share/vala/vapi --girdir=${STAGING_DIR}/usr/share/gir-1.0 "$@"
