From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Thu, 28 Nov 2019 16:52:30 +0100
Subject: [Buildroot] [PATCH] package/openvmtools: only try to start vmtoolsd
 on vmware
Message-ID: <20191128155230.7915-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

adds ConditionVirtualization=vmware to vmtoolsd.service

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/openvmtools/vmtoolsd.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openvmtools/vmtoolsd.service b/package/openvmtools/vmtoolsd.service
index 17a4df4..cb97357 100644
--- a/package/openvmtools/vmtoolsd.service
+++ b/package/openvmtools/vmtoolsd.service
@@ -1,6 +1,7 @@
 [Unit]
 Description=vmtoolsd for openvmtools
 After=syslog.target network.target
+ConditionVirtualization=vmware
 
 [Service]
 Type=forking
-- 
2.7.4
