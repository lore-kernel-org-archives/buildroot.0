From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 18:17:09 +0200
Subject: [Buildroot] [git commit] package: include package/skeleton/Config.in
Message-ID: <20150714161744.11D3080075@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1d25900ce56087b43ef6f0f7484d65ef5afdd10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was missing from the patch introducing the skeleton package. It
was working fine, except that the skeleton package was not in the
global variable PACKAGES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0288cb0..5beb450 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1,5 +1,6 @@
 menu "Target packages"
 
+	source "package/skeleton/Config.in"
 	source "package/busybox/Config.in"
 
 menu "Audio and video applications"
