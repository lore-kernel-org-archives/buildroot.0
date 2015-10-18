From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 17:45:27 +0200
Subject: [Buildroot] [PATCH] system/skeleton: finalize removal of ftp user
Message-ID: <1445183127-493-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 3dde19e5f32c58ffbf7e190257b073e91e0a7e8d, the ftp user was
removed from /etc/passwd, /etc/group and /home in the skeleton, but
the corresponding entry was not removed from /etc/shadow. This commit
fixes that.

Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/etc/shadow | 1 -
 1 file changed, 1 deletion(-)

diff --git a/system/skeleton/etc/shadow b/system/skeleton/etc/shadow
index 972dd59..2ac2607 100644
--- a/system/skeleton/etc/shadow
+++ b/system/skeleton/etc/shadow
@@ -5,5 +5,4 @@ sync:*:10933:0:99999:7:::
 halt:*:10933:0:99999:7:::
 uucp:*:10933:0:99999:7:::
 operator:*:10933:0:99999:7:::
-ftp:*:10933:0:99999:7:::
 nobody:*:10933:0:99999:7:::
-- 
2.6.2
