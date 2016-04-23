From: Pierre FICHEUX <pierre.ficheux@smile.fr>
Date: Sat, 23 Apr 2016 20:02:28 +0200
Subject: [Buildroot] i2c-tools package
Message-ID: <191d78520e761938d9243be46131703b@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

Hi, 

I propose to update i2c-tools package in order to install
i2c-dev.h in the staging directory. 

A recent i2c-dev.h is necessary
for external i2c based packages. 

regards 

diff --git
a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index
187bd09..c06cb27 100644
--- a/package/i2c-tools/i2c-tools.mk
+++
b/package/i2c-tools/i2c-tools.mk
@@ -55,4 +55,9 @@ define
I2C_TOOLS_INSTALL_TARGET_CMDS
 $(I2C_TOOLS_INSTALL_PYSMBUS)

endef

+I2C_TOOLS_INSTALL_STAGING = YES
+define
I2C_TOOLS_INSTALL_STAGING_CMDS
+ $(INSTALL) -D -m644
$(@D)/include/linux/i2c-dev.h $(STAGING_DIR)/usr/in
+endef
+
 $(eval
$(generic-package)) 

-- 
Pierre FICHEUX -/- SMILE/OWI, France --
pierre.ficheux at smile.fr
 http://ingenierie.openwide.fr

http://www.linuxembedded.fr
I would love to change the world, but they
won't give me the source code
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160423/a79b5553/attachment.html>
