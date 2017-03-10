From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 10 Mar 2017 13:35:58 +0100
Subject: [Buildroot] [PATCH 3/3] gitlab-ci: add gcc-multilib to the docker
	image
In-Reply-To: <20170310123558.22033-1-arnout@mind.be>
References: <20170310123558.22033-1-arnout@mind.be>
Message-ID: <20170310123558.22033-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is needed for defconfigs that use sylinux.

Fixes https://gitlab.com/buildroot.org/buildroot/builds/11701092

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml    | 2 +-
 .gitlab-ci.yml.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1954eaa8b1..cb9e6fc17c 100644
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
index b4a6a3fb28..0f9cbcba33 100644
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
-- 
2.11.0
