From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 14:25:17 +0100
Subject: [Buildroot] [git commit] tpm2-abrmd: S80tpm2-abrmd: create pid file
 at startup
Message-ID: <20190116132622.4D78C8D469@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03be1db6637ac096a56bec4bc77524191451bc45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The start-stop-daemon invocation to start abrmd was missing the -m (make
pidfile) option, causing stop to fail.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/S80tpm2-abrmd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tpm2-abrmd/S80tpm2-abrmd b/package/tpm2-abrmd/S80tpm2-abrmd
index cfa9d44771..6a0bef0a31 100755
--- a/package/tpm2-abrmd/S80tpm2-abrmd
+++ b/package/tpm2-abrmd/S80tpm2-abrmd
@@ -28,7 +28,7 @@ start() {
 	printf "Starting tpm2-abrmd: "
 	check_device
 	rm_stale_pidfile /var/run/tpm2-abrmd.pid /usr/sbin/tpm2-abrmd
-	start-stop-daemon -S -q -o -b -p /var/run/tpm2-abrmd.pid -c tss:tss -x /usr/sbin/tpm2-abrmd -- ${DAEMON_OPTS} || {
+	start-stop-daemon -S -q -o -b -m -p /var/run/tpm2-abrmd.pid -c tss:tss -x /usr/sbin/tpm2-abrmd -- ${DAEMON_OPTS} || {
 		echo "FAIL"
 		exit 1
 	}
