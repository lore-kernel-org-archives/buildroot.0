From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 23:42:32 +0200
Subject: [Buildroot] [git commit] json-c: add .hash file
Message-ID: <20160615214351.1186881F98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a4563f13fe526b58808f1cd32c28e69f679d45e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/38f/38fd47a81cc2a6fc515158692af4e2b62f4a965f/
http://autobuild.buildroot.org/results/ecc/ecc4ca7fdda173faf042dfe991073d8c5e9af4d6/

Similar to jquery-keyboard, it seems the json-c tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/json-c/json-c.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
new file mode 100644
index 0000000..6550895
--- /dev/null
+++ b/package/json-c/json-c.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 99304a4a633f1ee281d6a521155a182824dd995139d5ed6ee5c93093c281092b  json-c-json-c-0.12-20140410.tar.gz
