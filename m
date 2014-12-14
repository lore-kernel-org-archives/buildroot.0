From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 19:45:39 +0100
Subject: [Buildroot] [git commit] package/faad2: add hash
Message-ID: <20141214184650.71E51801FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8314e3e6ad070622a17bb6ad570d662fbffe282d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream do not host the files, they are hosted on SourceForge; SF has
both sha1 and md5, so use the sha1.

Also add a strong, locally computed hash.

Should fix build failures for which sourceforge sends garbage:
    http://autobuild.buildroot.org/results/f0a/f0a36c78fd910bc0aea54df4b76ab8a0f82f7ae4/
    http://autobuild.buildroot.org/results/3d6/3d6134c71e57238d4d865040eac9f34e2d17844c/
    http://autobuild.buildroot.org/results/232/2323f72f9b08ef8e20ec67a5aebfadd5b469a298/
    ...

[Peter: use correct sha1, add link to upstream page listing it]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/faad2/faad2.hash |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
new file mode 100644
index 0000000..691645b
--- /dev/null
+++ b/package/faad2/faad2.hash
@@ -0,0 +1,4 @@
+# From http://sourceforge.net/projects/faac/files/faad2-src/faad2-2.7/ (used by upstream):
+sha1	80eaaa5cc576c35dd28863767b795c50cbcc0511  faad2-2.7.tar.gz
+# Locally computed
+sha256  ee26ed1e177c0cd8fa8458a481b14a0b24ca0b51468c8b4c8b676fd3ceccd330  faad2-2.7.tar.gz
