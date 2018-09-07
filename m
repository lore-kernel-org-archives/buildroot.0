From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:15:52 -0000
Subject: [Buildroot] [git commit] support/misc: updating Vagrantfile to
 ubuntu 18.04
Message-ID: <20180907111455.A936E8158A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8511a66fc1d16014703e76ce0d5bf3ca3b010bdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates the vagrant box to ubuntu bionic 64 and switches back
to the official ubuntu image cause the issues with the official image
are now solved.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/misc/Vagrantfile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index cca0a3db3d..acfc8abfc8 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -12,7 +12,7 @@ VM_MEMORY=2048
 VM_CORES=1
 
 Vagrant.configure('2') do |config|
-	config.vm.box = 'bento/ubuntu-16.04'
+	config.vm.box = 'ubuntu/bionic64'
 
 	config.vm.provider :vmware_fusion do |v, override|
 		v.vmx['memsize'] = VM_MEMORY
