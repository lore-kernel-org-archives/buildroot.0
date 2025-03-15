Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D27C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 23:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9F7083437;
	Sat, 15 Mar 2025 23:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BASrJ10iKh5L; Sat, 15 Mar 2025 23:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D9E68222C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D9E68222C;
	Sat, 15 Mar 2025 23:12:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2FF961
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFC946076D
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXH-CXXmY39G for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 23:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E84596079D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E84596079D
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:11:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4C9D88009; Sat, 15 Mar 2025 23:11:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 22:21:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ebbaac08e3f462bf023c12077f739ed1c0543eb2
X-Git-Newrev: b36475315b974e1ac3120156745b55daf1b7557c
X-Patchwork-Hint: ignore
Message-Id: <20250315231151.E4C9D88009@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/aardvark-dns: new
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b36475315b974e1ac3120156745b55daf1b7557c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

aardvark-dns is needed by netavark to provide cross-container DNS
resolving with Podman.

It is to be noted that netavark and aardvark-dns have to be updated in
lock-step [0].

Update the podman runtime test to validate this is working.

[0] https://github.com/containers/podman/blob/main/DISTRO_PACKAGE.md#networking-tools-netavark-aardvark-dns-passt

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                            |  1 +
 package/aardvark-dns/Config.in               |  9 +++++++
 package/aardvark-dns/aardvark-dns.hash       |  3 +++
 package/aardvark-dns/aardvark-dns.mk         | 15 +++++++++++
 package/netavark/Config.in                   |  1 +
 package/netavark/netavark.mk                 |  1 +
 package/podman/podman.mk                     |  1 +
 support/testing/tests/package/test_podman.py | 38 ++++++++++++++++++++++++++++
 8 files changed, 69 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7e98256cdf..4297903fd8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2411,6 +2411,7 @@ menu "Miscellaneous"
 endmenu
 
 menu "Networking applications"
+	source "package/aardvark-dns/Config.in"
 	source "package/aircrack-ng/Config.in"
 	source "package/alfred/Config.in"
 	source "package/aoetools/Config.in"
diff --git a/package/aardvark-dns/Config.in b/package/aardvark-dns/Config.in
new file mode 100644
index 0000000000..83ef5a16f9
--- /dev/null
+++ b/package/aardvark-dns/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_AARDVARK_DNS
+	bool "aardvark-dns"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Authoritative dns server for A/AAAA container records.
+	  Forwards other request to host's /etc/resolv.conf
+
+	  https://github.com/containers/aardvark-dns/
diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
new file mode 100644
index 0000000000..5327a38b7e
--- /dev/null
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  bbd4a0b0bdf6788c09266f1f944d5c5397b6db4f1da0735a1d42738a6e074249  aardvark-dns-v1.14.0-git4-cargo2.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/aardvark-dns/aardvark-dns.mk b/package/aardvark-dns/aardvark-dns.mk
new file mode 100644
index 0000000000..a2e74a72bf
--- /dev/null
+++ b/package/aardvark-dns/aardvark-dns.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# aardvark-dns
+#
+################################################################################
+
+# When updating the version here, also update netavark in lockstep
+AARDVARK_DNS_VERSION = v1.14.0
+AARDVARK_DNS_SITE = https://github.com/containers/aardvark-dns
+AARDVARK_DNS_SITE_METHOD = git
+
+AARDVARK_DNS_LICENSE = Apache-2.0
+AARDVARK_DNS_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
diff --git a/package/netavark/Config.in b/package/netavark/Config.in
index cf7b731141..c78e57556f 100644
--- a/package/netavark/Config.in
+++ b/package/netavark/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NETAVARK
 	bool "netavark"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_AARDVARK_DNS  # runtime
 	select BR2_PACKAGE_IPTABLES if !BR2_PACKAGE_NFTABLES  # runtime
 	select BR2_PACKAGE_NFTABLES_JSON if BR2_PACKAGE_NFTABLES && !BR2_PACKAGE_IPTABLES
 	help
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
index c96912ef5a..31d0b28b74 100644
--- a/package/netavark/netavark.mk
+++ b/package/netavark/netavark.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating the version here, also update aardvark-dns in lockstep
 NETAVARK_VERSION = v1.14.0
 NETAVARK_SITE = https://github.com/containers/netavark
 NETAVARK_SITE_METHOD = git
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 48b4cd9b27..29c5591a0a 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -101,6 +101,7 @@ PODMAN_POST_INSTALL_TARGET_HOOKS += PODMAN_CONFIG
 
 define PODMAN_HELPERS
 	$(Q)mkdir -p $(TARGET_DIR)/usr/libexec/podman
+	$(Q)ln -sf ../../bin/aardvark-dns $(TARGET_DIR)/usr/libexec/podman/aardvark-dns
 	$(Q)ln -sf ../../bin/netavark $(TARGET_DIR)/usr/libexec/podman/netavark
 	$(Q)ln -sf ../../bin/slirp4netns $(TARGET_DIR)/usr/libexec/podman/slirp4netns
 	$(PODMAN_HELPER_INIT)
diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
index e2b0598961..44211b438e 100644
--- a/support/testing/tests/package/test_podman.py
+++ b/support/testing/tests/package/test_podman.py
@@ -166,6 +166,44 @@ class PodmanBase(infra.basetest.BRTest):
         output, _ = self.emulator.run('echo ${br_container}')
         self.assertEqual(output[0], "", "Still in a container")
 
+        # Test networking between two containers
+        self.assertRunOk("podman network create buz")
+        self.assertRunOk(
+            "podman container run --rm -ti --name pod007 --network buz --detach busybox:1.37.0",
+        )
+        self.assertRunOk(
+            "podman container run --rm -ti --name pod006 --network buz --detach busybox:1.37.0",
+        )
+        # Ensure each pod can resolv itself and the other
+        # (not using itertools.matrix() just for those trivial combinations)
+        for pod1, pod2 in [
+            ("pod006", "pod006"),
+            ("pod006", "pod007"),
+            ("pod007", "pod007"),
+            ("pod007", "pod006"),
+        ]:
+            output, exit_code = self.emulator.run(
+                f"podman container exec {pod1} nslookup {pod2}",
+            )
+            self.assertEqual(exit_code, 0)
+            self.assertTrue(output[0].startswith("Server:"))
+            self.assertTrue(output[1].startswith("Address:"))
+            # Busybox' nslookup emits one "Non-authoritative answer" per
+            # supported address familly: IPv4 and IPv6.
+            self.assertEqual(
+                len([line for line in output[2:] if line == "Non-authoritative answer:"]),
+                2,
+            )
+            # But only IPv4 is available on this network
+            self.assertEqual(
+                len([line for line in output[2:] if line.startswith("Address:")]),
+                1,
+            )
+        self.assertRunOk("podman container kill --all")
+        output, _ = self.emulator.run("podman container ls --format '{{ json }}'")
+        pod_info = json.loads("".join(output))
+        self.assertEqual(len(pod_info), 0, f"{len(pod_info)} container(s) still present, expecting 0")
+
         # Remove the offical image
         self.assertRunOk('podman image rm busybox:1.37.0')
         output, _ = self.emulator.run("podman image ls --format '{{ json }}'")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
