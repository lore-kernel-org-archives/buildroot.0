From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 23:11:02 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] .gitlab-ci.yml: use the
	Buildroot CI image published on Docker Hub
Message-ID: <20170720210737.44B6581ED1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19904538a4acb179470d6408d1c9a9742e78b6d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d2a151cea0a9066015b9e6c1fb714a84faffec0f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml    | 13 +------------
 .gitlab-ci.yml.in | 13 +------------
 2 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5fb6454..f568a0b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -4,18 +4,7 @@
 # It needs to be regenerated every time a defconfig is added, using
 # "make .gitlab-ci.yml".
 
-image: debian:stable
-
-before_script:
-    - dpkg --add-architecture i386
-    # The container has no package lists, so need to update first
-    - apt-get update -qq
-    - apt-get install -y -qq --no-install-recommends
-        build-essential locales bc ca-certificates file rsync gcc-multilib
-        git bzr cvs mercurial subversion libc6:i386 unzip wget cpio
-    # To be able to generate a toolchain with locales, enable one UTF-8 locale
-    - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
-    - /usr/sbin/locale-gen
+image: buildroot/base
 
 .defconfig_script: &defconfig_script
     - echo 'Configure Buildroot'
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 0f9cbcb..510834e 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -4,18 +4,7 @@
 # It needs to be regenerated every time a defconfig is added, using
 # "make .gitlab-ci.yml".
 
-image: debian:stable
-
-before_script:
-    - dpkg --add-architecture i386
-    # The container has no package lists, so need to update first
-    - apt-get update -qq
-    - apt-get install -y -qq --no-install-recommends
-        build-essential locales bc ca-certificates file rsync gcc-multilib
-        git bzr cvs mercurial subversion libc6:i386 unzip wget cpio
-    # To be able to generate a toolchain with locales, enable one UTF-8 locale
-    - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
-    - /usr/sbin/locale-gen
+image: buildroot/base
 
 .defconfig_script: &defconfig_script
     - echo 'Configure Buildroot'
