From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 23:10:09 +0100
Subject: [Buildroot] [git commit] package/pipewire: fix comment in Config.in
Message-ID: <20191221220507.801B78D3EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=acba13db99c21d40ce556e984d800c8a0b68bff3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ac92146ebb7627378c0a8c92f6490e55333eb6bb forgot to update
comment with udev dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pipewire/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 80e28d3614..57e70d65f8 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -30,6 +30,6 @@ comment "pipewire gstreamer support needs a toolchain w/ wchar, threads"
 
 endif
 
-comment "pipewire needs a toolchain w/ threads"
+comment "pipewire needs udev and a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
