From: Christopher Peeters <christopher@lecroq.be>
Date: Fri, 15 Feb 2019 18:36:07 +0100
Subject: [Buildroot] [PATCH 1/1] Add libvirt (KVM) support
Message-ID: <20190215173607.13773-1-christopher@lecroq.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher Peeters <christopher@lecroq.be>
---
 support/misc/Vagrantfile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 1ca5edc647..48f01a5807 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -29,6 +29,12 @@ Vagrant.configure('2') do |config|
 		end
 	end
 
+  config.vm.provider :libvirt do |v, override|
+    override.vm.box = 'generic/ubuntu1804'
+    v.memory = VM_MEMORY
+    v.cpus = VM_CORES
+  end 
+
 	config.vm.provision 'shell' do |s|
 		s.inline = 'echo Setting up machine name'
 
-- 
2.20.1
