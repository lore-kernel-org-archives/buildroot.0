From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 14:28:02 +0100
Subject: [Buildroot] [git commit] netbsd-queue: actually use the Config.in
	file
Message-ID: <20151230132927.BACD882749@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=762b819e6f4bf741a94dfe3d6b28a6deea99edd8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit e84fd04e88bcda2771847958b3b5153e476db45f, Yann added a
Config.in symbol for netbsd-queue in a brand new Config.in file. But
that Config.in file was never included anywhere, making it somewhat
useless.

Let's include it under Libraries -> Other, even if its actual
inclusion location doesn't matter much since it's just a hidden
Config.in option anyway.

Fixes:

  http://autobuild.buildroot.org/results/d23/d23a1c51c4d7a260364aeef576fdf5a407abc2f6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Config.in b/package/Config.in
index bc6099d..cf994b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1198,6 +1198,7 @@ endif
 	source "package/mpfr/Config.in"
 	source "package/msgpack/Config.in"
 	source "package/mtdev2tuio/Config.in"
+	source "package/netbsd-queue/Config.in"
 	source "package/orc/Config.in"
 	source "package/p11-kit/Config.in"
 	source "package/poco/Config.in"
