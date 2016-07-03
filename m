From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 12:42:19 +0200
Subject: [Buildroot] [git commit] sunxi-mail: hack to work around
	autobuilder issue
Message-ID: <20160703104237.3AD2E7FBC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=956fcc2100c865b25f97c688f0b9012bbd5dfdb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/5a5/5a50be9feeb5da7694e9a42f615f0b7276319aeb/

The recent change to use git submodules for sunxi-mali instead of the github
wrapper without changing the version unfortunately doesn't work for people
who have already built sunxi-mali, as the existing github tarball will be
used instead of buildroot doing a clean git clone (with submodules).

The sunxi-mali commit we are using is the latest in the repo, so we cannot
fix it by bumping the version.  Instead simply remove the last character of
the VERSION sha1 so the existing tarballs are no longer used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sunxi-mali/sunxi-mali.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
index d621da1..c808db6 100644
--- a/package/sunxi-mali/sunxi-mali.mk
+++ b/package/sunxi-mali/sunxi-mali.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-SUNXI_MALI_VERSION = d343311efc8db166d8371b28494f0f27b6a58724
+# last sha1 character dropped to ensure unique filename
+SUNXI_MALI_VERSION = d343311efc8db166d8371b28494f0f27b6a5872
 SUNXI_MALI_SITE = https://github.com/linux-sunxi/sunxi-mali
 SUNXI_MALI_SITE_METHOD = git
 
