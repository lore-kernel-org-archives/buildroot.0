From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 16 Sep 2020 17:35:09 +0200
Subject: [Buildroot] [PATCH v3 7/8] package/openvmtools: use /run for PIDFile
In-Reply-To: <20200916153510.476-1-buildroot@heine.tech>
References: <20200916153340.345-1-buildroot@heine.tech>
 <20200916153510.476-1-buildroot@heine.tech>
Message-ID: <20200916153510.476-7-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

PIDFile= references a path below legacy directory /var/run/, updating
/var/run/vmtoolsd.pid ? /run/vmtoolsd.pid; please update the unit file
accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/openvmtools/vmtoolsd.service | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvmtools/vmtoolsd.service b/package/openvmtools/vmtoolsd.service
index cb97357ec2..1d2a3566cf 100644
--- a/package/openvmtools/vmtoolsd.service
+++ b/package/openvmtools/vmtoolsd.service
@@ -5,8 +5,8 @@ ConditionVirtualization=vmware
 
 [Service]
 Type=forking
-PIDFile=/var/run/vmtoolsd.pid
-ExecStart=/usr/bin/vmtoolsd -b /var/run/vmtoolsd.pid
+PIDFile=/run/vmtoolsd.pid
+ExecStart=/usr/bin/vmtoolsd -b /run/vmtoolsd.pid
 Restart=on-failure
 KillMode=process
 KillSignal=SIGKILL
-- 
2.25.1
