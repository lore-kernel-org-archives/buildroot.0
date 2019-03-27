From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 23:00:28 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] lvm2: Update to 2.02.183
Message-ID: <20190327215821.1590681D34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00eb766a9240df5a29e10137c40ab46fd0acc897
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

In particular update to solve an issue where LVM would fail to
initialise LVM devices when asynchronous IO was not available and it
would fail to fall back to synchronous IO. [0][1]

[0] https://bugzilla.redhat.com/show_bug.cgi?id=1650652
[1] https://github.com/open-power/petitboot/issues/60

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ba9442dfe3dd2655a1b3e1cfe7e8a377bfbcf1c8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 697a413995..ad0d93b144 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,5 +1,5 @@
 # From ftp://sources.redhat.com/pub/lvm2/sha512.sum
-sha512 6e0a10ab48be4f0c751447c6ab88b8f9fa1dcd1d703de77966e8507b173df70b1987fa0be252c31dfce9e0ee70e5f439db58c8f534e24144a70f254c091554ee  LVM2.2.02.180.tgz
+sha512 3947523c6b0862ada40677ed171ed0cf95e070119e377296fc5ccb153e9c4212d34c0b16a887dbd68ccf265525345dabfed2aa59fb3604555429a7e2ecfff4d7  LVM2.2.02.183.tgz
 # Locally computed sha256 checksums
 sha256 e76fbcd2fb97cf202da330301327754d2db5c58b5b4bebd3a8a749393e7603d1  COPYING
 sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LIB
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 152381d65d..7fdb9a7e30 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.180
+LVM2_VERSION = 2.02.183
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2
 LVM2_INSTALL_STAGING = YES
