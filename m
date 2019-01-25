From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Jan 2019 08:02:06 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] tpm2-abrmd:
 S80tpm2-abrmd: create pid file at startup
Message-ID: <20190125072924.395DE8B44E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9c2e8100ed7fa967db50735549af92aedeeda1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

The start-stop-daemon invocation to start abrmd was missing the -m (make
pidfile) option, causing stop to fail.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 03be1db6637ac096a56bec4bc77524191451bc45)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/S80tpm2-abrmd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tpm2-abrmd/S80tpm2-abrmd b/package/tpm2-abrmd/S80tpm2-abrmd
index d54c220c04..33345fa11c 100755
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
