From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 21:29:07 +0200
Subject: [Buildroot] [git commit] package/openvmtools: source default file
Message-ID: <20190917192433.8A9538E83C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d104ce719a11ff8fd562f5447d416c1e010878b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the SYSV init script allow /etc/default/vmtoolsd to override $ARGS
(if it present)

Signed-off-by: Simon Rowe <simon.rowe@citrix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openvmtools/S10vmtoolsd | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openvmtools/S10vmtoolsd b/package/openvmtools/S10vmtoolsd
index 6afb9ca08a..5fdb5682f6 100644
--- a/package/openvmtools/S10vmtoolsd
+++ b/package/openvmtools/S10vmtoolsd
@@ -7,6 +7,8 @@ EXEC="/usr/bin/vmtoolsd"
 ARGS="-b"
 PID="/var/run/vmtoolsd.pid"
 
+[ -r /etc/default/vmtoolsd ] && . /etc/default/vmtoolsd
+
 case "$1" in
   start)
     printf "Starting vmtoolsd: "
