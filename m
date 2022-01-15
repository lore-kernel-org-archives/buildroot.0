Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5462C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 15:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 385CE60ACB;
	Sat, 15 Jan 2022 15:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B80EGf1COiM4; Sat, 15 Jan 2022 15:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D54560A8D;
	Sat, 15 Jan 2022 15:37:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E42721BF95D
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2DAE60AC5
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VFQBiLYHG2lf for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 15:37:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BCA160A8D
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 15:37:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DF30A82B52; Sat, 15 Jan 2022 15:30:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 16:36:37 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 7b47598e7566fcc97d9819ffd745b936249ee0ee
X-Git-Newrev: 773d3bf98e7c0420ab45319355c460f62a72d8f5
X-Patchwork-Hint: ignore
Message-Id: <20220115153049.DF30A82B52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/xen: add XSA-385,
 386, 388, 389 security fixes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=773d3bf98e7c0420ab45319355c460f62a72d8f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fixes the following security issues:

- XSA-385: guests may exceed their designated memory limit
  https://xenbits.xenproject.org/xsa/advisory-385.html

- XSA-386: PCI devices with RMRRs not deassigned correctly
  https://xenbits.xenproject.org/xsa/advisory-386.html

- XSA-388: PoD operations on misaligned GFNs
  https://xenbits.xenproject.org/xsa/advisory-388.html

- XSA-389: issues with partially successful P2M updates on x86
  https://xenbits.xenproject.org/xsa/advisory-389.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c0932240fbd891528ae5d479f5df5229ed370416)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash |  9 +++++++++
 package/xen/xen.mk   | 17 +++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index e30db09516..10a778053a 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,12 @@
 # Locally computed
 sha256  a3dad76a772393a1875e8f44a6059a95fea4bde40f97b800966969ac6f3a498d  xen-4.14.3.tar.gz
 sha256  ecca9538e9d3f7e3c2bff827502f4495e2ef9e22c451298696ea08886b176c2c  COPYING
+# https://xenbits.xenproject.org/xsa/advisory-385.html
+sha256  831e86c3adfec532b1a48a0b967b7c58c37db3733aee8d78216eb9d535b34f12  xsa385-4.15.patch
+# https://xenbits.xenproject.org/xsa/advisory-386.html
+sha256  f2f83c825e249bba9454437b48bbd8307fe7a224f56484388a67af124dfd279b  xsa386.patch
+# https://xenbits.xenproject.org/xsa/advisory-388.html
+sha256  6917267482101a3f8f1d13905e14994344a0af81370c7a2b92275fb176b321a0  xsa388-4.14-1.patch
+sha256  d5886e046c69f34f98f7e1fc6ffcc36d92f8fc79242b9dc88412c39aa79b4ac3  xsa388-4.14-2.patch
+# https://xenbits.xenproject.org/xsa/advisory-389.html
+sha256  b243284679b32ab8c817a2e41562d8694d9781fa8096c268bb41b0cd91684baa  xsa389-4.14.patch
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index b635996afb..cfc166dc4c 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -11,6 +11,23 @@ XEN_LICENSE_FILES = COPYING
 XEN_CPE_ID_VENDOR = xen
 XEN_CPE_ID_PREFIX = cpe:2.3:o
 XEN_DEPENDENCIES = host-acpica host-python3
+XEN_PATCH = \
+	https://xenbits.xenproject.org/xsa/xsa385-4.15.patch \
+	https://xenbits.xenproject.org/xsa/xsa386.patch \
+	https://xenbits.xenproject.org/xsa/xsa388-4.14-1.patch \
+	https://xenbits.xenproject.org/xsa/xsa388-4.14-2.patch \
+	https://xenbits.xenproject.org/xsa/xsa389-4.14.patch
+
+# xsa385-4.15.patch
+XEN_IGNORE_CVES += CVE-2021-28706
+# xsa386.patch
+XEN_IGNORE_CVES += CVE-2021-28702
+# xsa388-4.14-1.patch
+XEN_IGNORE_CVES += CVE-2021-28704 CVE-2021-28707
+# xsa388-4.14-2.patch
+XEN_IGNORE_CVES += CVE-2021-28708
+# xsa389-4.14.patch
+XEN_IGNORE_CVES += CVE-2021-28705 CVE-2021-28709
 
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
