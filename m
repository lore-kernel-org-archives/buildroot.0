From: Simon Rowe <simon.rowe@citrix.com>
Date: Tue, 17 Sep 2019 10:31:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvmtools: source default file
Message-ID: <1568712701-114422-1-git-send-email-simon.rowe@citrix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the SYSV init script allow /etc/default/vmtoolsd to override $ARGS
(if it present)

Signed-off-by: Simon Rowe <simon.rowe@citrix.com>
---
 package/openvmtools/S10vmtoolsd | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openvmtools/S10vmtoolsd b/package/openvmtools/S10vmtoolsd
index 6afb9ca..5fdb568 100644
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
-- 
1.8.3.1
