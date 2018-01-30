From: Auke Oosterhoff <a.oosterhoff@climotion.com>
Date: Tue, 30 Jan 2018 15:27:08 +0100
Subject: [Buildroot] Bugs in patch [v2,7/7] package/mender: new package
Message-ID: <CAGkEsZy33hDrAeY3Cq+_w2Z_EH5WTMqF1fw4dL5q21G1_ev+=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I tested a series of patches which add a new infrastructure for go
packages[1] and patch 7[2] of this series contains a few bugs. The patch
add support for the package Mender.

The MENDER_INSTALL_TARGET_CMDS copies 2 different files to the same
location, which is wrong. Both files should keep their name in target.

+	$(INSTALL) -D -m 0644 package/mender/mender.conf
\+		$(TARGET_DIR)/etc/mender/mender.conf+	$(INSTALL) -D -m 0644
package/mender/tenant.conf \+		$(TARGET_DIR)/etc/mender/mender.conf

And also, the mender binary isn't copied to the target.
I think the content of MENDER_INSTALL_TARGET_CMDS should be extended with:

+	$(INSTALL) -D -m 0755 $(@D)/$(MENDER_BINDIR)/mender
$(TARGET_DIR)/usr/bin/mender

-- 
Met vriendelijke groet,

Auke Willem Oosterhoff


[1]: https://patchwork.ozlabs.org/cover/854079/
[2]: https://patchwork.ozlabs.org/patch/854085/


<http://www.climotion.com/>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180130/7e48de62/attachment.html>
