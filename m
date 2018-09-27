From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 20:42:00 +0200
Subject: [Buildroot] [git commit] linux-firmware: bump version and fix hash
Message-ID: <20180927191952.C977888FA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e14102c6f2f6eb31844ebbe844fb64baa3a85c11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the package to the most up to date version and fix the sha256 hash.
linux-firmware was failing due to an incorrect sha256 hash, as follows:

Fetching all references
warning: redirecting to https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/
remote: Counting objects: 6972, done.
remote: Total 6972 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (6972/6972), 196.63 MiB | 4.22 MiB/s, done.
Resolving deltas: 100% (4516/4516), done.
From http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware
 * [new branch]      master     -> origin/master
warning: redirecting to https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/
warning: refname '8d69bab7a3da1913113ea98cefb73d5fa6988286' is ambiguous.
Git normally never creates a ref that ends with 40 hex characters
because it will be ignored when you just specify 40-hex. These refs
may be created by mistake. For example,

  git checkout -b $br $(git rev-parse ...)

where "$br" is somehow empty and a 40-hex ref is created. Please
examine these refs and maybe delete them. Turn this message off by
running "git config advice.objectNameWarning false"
ERROR: linux-firmware-8d69bab7a3da1913113ea98cefb73d5fa6988286.tar.gz has wrong sha256 hash:
ERROR: expected: 905be20e4e2d7628dea4e2e99195520fc0cce8b247faabdc52fc44a3ff2ceb04
ERROR: got     : b9fce72a7b0b55eb311701dfd47914bc9e037134fa401d33e6e73ab9ebc9d116
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.hash | 2 +-
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index b1f46b97e9..d8fdf77016 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 905be20e4e2d7628dea4e2e99195520fc0cce8b247faabdc52fc44a3ff2ceb04 linux-firmware-8d69bab7a3da1913113ea98cefb73d5fa6988286.tar.gz
+sha256 8f419b5d0c65d0f861a2cfc634f30e7952135de71a3ebe6b7afbda091f5a94ba linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a.tar.gz
 sha256 8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9 LICENCE.Abilis
 sha256 4b3ea5d5a03c0db81bee0bcb14b30d75b30ef568597bb5be7d4dee57f434265f LICENSE.amdgpu
 sha256 38f2037aa14631b4b29826d7a99379613c41a97064d1defdee30a7a022138b20 LICENCE.Marvell
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c9866fd1bb..4eba57434b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 8d69bab7a3da1913113ea98cefb73d5fa6988286
+LINUX_FIRMWARE_VERSION = 44d4fca9922a252a0bd81f6307bcc072a78da54a
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
