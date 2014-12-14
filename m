From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Dec 2014 19:21:57 +0100
Subject: [Buildroot] [PATCH v2] package/faad2: add hash
Message-ID: <1418581317-8323-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream do not host the files, they are hosted on SourceForge; SF has
both sha1 and md5, so use the sha1.

Also add a strong, locally computed hash.

Should fix build failures for which sourceforge sends garbage:
    http://autobuild.buildroot.org/results/f0a/f0a36c78fd910bc0aea54df4b76ab8a0f82f7ae4/
    http://autobuild.buildroot.org/results/3d6/3d6134c71e57238d4d865040eac9f34e2d17844c/
    http://autobuild.buildroot.org/results/232/2323f72f9b08ef8e20ec67a5aebfadd5b469a298/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

---
Changes v1 -> v2:
  - add sha1 from upstream  (Bernd)
---
 package/faad2/faad2.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/faad2/faad2.hash

diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
new file mode 100644
index 0000000..b5e3554
--- /dev/null
+++ b/package/faad2/faad2.hash
@@ -0,0 +1,4 @@
+# From the SourceForge download page (used by upstream):
+sha1  183354a43a44c5e587e56f989e09b0fbd195a5c6  faad2-2.7.tar.gz
+# Locally computed
+sha256  ee26ed1e177c0cd8fa8458a481b14a0b24ca0b51468c8b4c8b676fd3ceccd330  faad2-2.7.tar.gz
-- 
1.9.1
