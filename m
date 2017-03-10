From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Mar 2017 14:22:25 +0100
Subject: [Buildroot] [git commit] gitlab-ci: add gcc-multilib to the docker
	image
Message-ID: <20170310132314.8DD14804F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=512a08309493ff34b13dcbca53c9915ce40b44e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed for defconfigs that use syslinux.

Fixes https://gitlab.com/buildroot.org/buildroot/builds/11701092

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml    | 2 +-
 .gitlab-ci.yml.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1954eaa..cb9e6fc 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -11,7 +11,7 @@ before_script:
     # The container has no package lists, so need to update first
     - apt-get update -qq
     - apt-get install -y -qq --no-install-recommends
-        build-essential locales bc ca-certificates file rsync
+        build-essential locales bc ca-certificates file rsync gcc-multilib
         git bzr cvs mercurial subversion libc6:i386 unzip wget cpio
     # To be able to generate a toolchain with locales, enable one UTF-8 locale
     - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index b4a6a3f..0f9cbcb 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -11,7 +11,7 @@ before_script:
     # The container has no package lists, so need to update first
     - apt-get update -qq
     - apt-get install -y -qq --no-install-recommends
-        build-essential locales bc ca-certificates file rsync
+        build-essential locales bc ca-certificates file rsync gcc-multilib
         git bzr cvs mercurial subversion libc6:i386 unzip wget cpio
     # To be able to generate a toolchain with locales, enable one UTF-8 locale
     - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
