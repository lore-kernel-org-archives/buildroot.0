From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 13 Aug 2018 10:49:12 +0200
Subject: [Buildroot] [PATCH] support/misc: updating Vagrantfile to ubuntu
 18.04
Message-ID: <1534150152-32385-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch updates the vagrant box to ubuntu bionic 64 and switches back
to the official ubuntu image cause the issues with the official image
are now solved.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 support/misc/Vagrantfile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index cca0a3d..acfc8ab 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -12,7 +12,7 @@ VM_MEMORY=2048
 VM_CORES=1
 
 Vagrant.configure('2') do |config|
-	config.vm.box = 'bento/ubuntu-16.04'
+	config.vm.box = 'ubuntu/bionic64'
 
 	config.vm.provider :vmware_fusion do |v, override|
 		v.vmx['memsize'] = VM_MEMORY
-- 
2.7.4
