From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 2 Jul 2017 18:24:59 +0200
Subject: [Buildroot] [PATCH v2] .gitlab-ci.yml: use the Buildroot CI image
	published on Docker Hub
In-Reply-To: <20170702161324.485-1-arnout@mind.be>
References: <20170702161324.485-1-arnout@mind.be>
Message-ID: <20170702162459.2065-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: Forgot to update .gitlab-ci.yml after the final changes
---
 .gitlab-ci.yml    | 14 +-------------
 .gitlab-ci.yml.in | 14 +-------------
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7acf4b620e..3ae7e5db64 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -4,19 +4,7 @@
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
-        python-nose2 python-pexpect qemu-system-arm qemu-system-x86
-    # To be able to generate a toolchain with locales, enable one UTF-8 locale
-    - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
-    - /usr/sbin/locale-gen
+image: buildroot/base
 
 .defconfig_script: &defconfig_script
     - echo 'Configure Buildroot'
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index c69f9de99c..3088677e67 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -4,19 +4,7 @@
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
-        python-nose2 python-pexpect qemu-system-arm qemu-system-x86
-    # To be able to generate a toolchain with locales, enable one UTF-8 locale
-    - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
-    - /usr/sbin/locale-gen
+image: buildroot/base
 
 .defconfig_script: &defconfig_script
     - echo 'Configure Buildroot'
-- 
2.13.2
