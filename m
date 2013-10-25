From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2013 09:19:42 +0200
Subject: [Buildroot] [git commit] ebtables: install ethertypes
Message-ID: <20131025073057.BFC4E9BB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d19e39ca25f0e77ea7f7b8ce734818d5d6cef24e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's handy and closes bug #6608.
Thanks to Cassiano Martin <cassiano@idbinfo.com.br> for pointing it out.

[Peter: use INSTALL]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ebtables/ebtables.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 116012c..edb5d42 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -31,6 +31,7 @@ define EBTABLES_INSTALL_TARGET_CMDS
 	done
 	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/ebtables \
 		$(TARGET_DIR)/sbin/ebtables
+	$(INSTALL) -m 0644 -D $(@D)/ethertypes $(TARGET_DIR)/etc/ethertypes
 endef
 endif
 
