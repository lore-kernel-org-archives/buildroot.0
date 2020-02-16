From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 15:27:05 +0100
Subject: [Buildroot] [git commit] linux: use correct conditional for
 wireguard kernel config fixup
Message-ID: <20200216141641.7D47D8E187@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=953538b650c4eccc4561550ae306eace4d37eec6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit de591c5c3a93 (package/wireguard-linux-compat: new package) split up
the wireguard package in wireguard-tools and wireguard-linux-compat, but
forgot to update the conditional in linux.mk, so the kernel config fixups
needed for wireguard are no longer applied.

Update the conditional to use the BR2_PACKAGE_WIREGUARD_LINUX_COMPAT symbol
instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index bf308b807a..4b60f33ff3 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -392,7 +392,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT,$(@D)/.config))
-	$(if $(BR2_PACKAGE_WIREGUARD),
+	$(if $(BR2_PACKAGE_WIREGUARD_LINUX_COMPAT),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INET,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET_FOU,$(@D)/.config)
