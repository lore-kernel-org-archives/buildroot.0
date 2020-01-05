From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2020 22:54:38 +0100
Subject: [Buildroot] [git commit] package/docker-cli: security bump to
 19.03.5
Message-ID: <20200105223019.98B5F8EDF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39cffd535633984c851b71195767951e9db56dc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerabilities:

- CVE-2019-14271: In Docker 19.03.x before 19.03.1 linked against the GNU C
  Library (aka glibc), code injection can occur when the nsswitch facility
  dynamically loads a library inside a chroot that contains the contents of
  the container

Signed-off-by: Christian Stewart <christian@paral.in>
[Peter: mention security impact]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 061e611735..44f13c8bfc 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cef3f9e8615cde906619f7ab021655a8b974d1b497ce0e5787b1afccbeabb08d  docker-cli-18.09.9.tar.gz
+sha256	00d06baf4793794c0fd9ecad5b7e95aed6eb942f24c8b6e2d7c7f7564b9743ad  docker-cli-19.03.5.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 201d782e1d..4ad30e0278 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 18.09.9
+DOCKER_CLI_VERSION = 19.03.5
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 DOCKER_CLI_WORKSPACE = gopath
 
