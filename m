From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 11:51:12 +0100
Subject: [Buildroot] [git commit] haveged: fix systemd service path
Message-ID: <20151104105453.5E5BC81E18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6411bd66d98083761120515883c2f70e53eac03b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'haveged' is installed in /usr/sbin, not /usr/bin.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/haveged/haveged.service |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/haveged/haveged.service b/package/haveged/haveged.service
index d87fe5b..91035c6 100644
--- a/package/haveged/haveged.service
+++ b/package/haveged/haveged.service
@@ -3,7 +3,7 @@ Description=Entropy Harvesting Daemon
 Documentation=man:haveged(8)
 
 [Service]
-ExecStart=/usr/bin/haveged -F -w 1024 -v 1
+ExecStart=/usr/sbin/haveged -F -w 1024 -v 1
 SuccessExitStatus=143
 
 [Install]
