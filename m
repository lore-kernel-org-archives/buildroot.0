From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2019 19:10:25 +0100
Subject: [Buildroot] [git commit] package/openvmtools: only try to start
 vmtoolsd on vmware
Message-ID: <20191201180305.B83CD8347B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89ebe8b4a12400435b9473b4ca7ea1240ff5f93e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

adds ConditionVirtualization=vmware to vmtoolsd.service

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvmtools/vmtoolsd.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openvmtools/vmtoolsd.service b/package/openvmtools/vmtoolsd.service
index 17a4df44c2..cb97357ec2 100644
--- a/package/openvmtools/vmtoolsd.service
+++ b/package/openvmtools/vmtoolsd.service
@@ -1,6 +1,7 @@
 [Unit]
 Description=vmtoolsd for openvmtools
 After=syslog.target network.target
+ConditionVirtualization=vmware
 
 [Service]
 Type=forking
