From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 30 Jun 2019 14:38:45 +0200
Subject: [Buildroot] [git commit] package/docker-cli: security bump to
 version 18.09.7
Message-ID: <20190630123813.61C4381059@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdbb3ced003a3fbf141964d4acaabda969d742b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-15664: API endpoints behind the 'docker cp' command are
vulnerable to a symlink-exchange attack with Directory Traversal, giving
attackers arbitrary read-write access to the host filesystem with root
privileges, because daemon/archive.go does not do archive operations on a
frozen filesystem (or from within a chroot).

And includes additional post-18.09.6 fixes:

Builder
- Fixed a panic error when building dockerfiles that contain only comments.
  moby/moby#38487
- Added a workaround for GCR authentication issue. moby/moby#38246
- Builder-next: Fixed a bug in the GCR token cache implementation
  workaround.  moby/moby#39183

Runtime
- Added performance optimizations in aufs and layer store that helps in
  massively parallel container creation and removal.  moby/moby#39107,
  moby/moby#39135
- daemon: fixed a mirrors validation issue. moby/moby#38991
- Docker no longer supports sorting UID and GID ranges in ID maps.
  moby/moby#39288

Logging
- Added a fix that now allows large log lines for logger plugins.
  moby/moby#39038

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 4abc5cf91a..27bf3322c4 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	02bcb73dde1c9542fa65c8b87078aaa1b01b0dbdd62346637bcf0999a2a0909f  docker-cli-18.09.6.tar.gz
+sha256  62e25a0935bee75f999fb95b224ad982054fc1adc4351ce98d704ec00114ce57  docker-cli-18.09.7.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index eef492d625..0cff46abbd 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 18.09.6
+DOCKER_CLI_VERSION = 18.09.7
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 DOCKER_CLI_WORKSPACE = gopath
 
