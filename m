Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A27C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 373DD4F0DB;
	Tue, 21 Feb 2023 00:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 373DD4F0DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eogaYZp00jA1; Tue, 21 Feb 2023 00:28:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A53F24F3E1;
	Tue, 21 Feb 2023 00:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A53F24F3E1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2AC521BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84A8D417DE
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84A8D417DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ukxKrJksPouN for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81448417CB
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81448417CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BEF08648F; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 13:56:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9244052f28d87d6d85b73402e7d15f730eb66c4b
X-Git-Newrev: 037dbe64d861e3d5580ecac608bd278afc9bbcc6
X-Patchwork-Hint: ignore
Message-Id: <20230220205252.6BEF08648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/python-magic-wormhole-transit-relay: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=037dbe64d861e3d5580ecac608bd278afc9bbcc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Transit Relay server for Magic-Wormhole.

This repository implements the Magic-Wormhole "Transit Relay",
a server that helps clients establish bulk-data transit connections
even when both are behind NAT boxes. Each side makes a TCP connection
to this server and presents a handshake. Two connections with
identical handshakes are glued together, allowing them to pretend they
have a direct connection.

https://github.com/magic-wormhole/magic-wormhole-transit-relay

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                |  1 +
 package/Config.in                                         |  1 +
 package/python-magic-wormhole-transit-relay/Config.in     | 15 +++++++++++++++
 .../python-magic-wormhole-transit-relay.hash              |  5 +++++
 .../python-magic-wormhole-transit-relay.mk                | 14 ++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index afc079a609..5776d6d7a5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1696,6 +1696,7 @@ F:	package/python-gnupg/
 F:	package/python-hkdf/
 F:	package/python-magic-wormhole/
 F:	package/python-magic-wormhole-mailbox-server/
+F:	package/python-magic-wormhole-transit-relay/
 F:	package/python-pyalsa/
 F:	package/python-spake2/
 F:	package/rdma-core/
diff --git a/package/Config.in b/package/Config.in
index 2ef403168a..b5418c56f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1122,6 +1122,7 @@ menu "External python modules"
 	source "package/python-m2crypto/Config.in"
 	source "package/python-magic-wormhole/Config.in"
 	source "package/python-magic-wormhole-mailbox-server/Config.in"
+	source "package/python-magic-wormhole-transit-relay/Config.in"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
 	source "package/python-markdown2/Config.in"
diff --git a/package/python-magic-wormhole-transit-relay/Config.in b/package/python-magic-wormhole-transit-relay/Config.in
new file mode 100644
index 0000000000..1a743c10fe
--- /dev/null
+++ b/package/python-magic-wormhole-transit-relay/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY
+	bool "python-magic-wormhole-transit-relay"
+	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	help
+	  Transit Relay server for Magic-Wormhole.
+
+	  This repository implements the Magic-Wormhole "Transit
+	  Relay", a server that helps clients establish bulk-data
+	  transit connections even when both are behind NAT
+	  boxes. Each side makes a TCP connection to this server and
+	  presents a handshake. Two connections with identical
+	  handshakes are glued together, allowing them to pretend they
+	  have a direct connection.
+
+	  https://github.com/magic-wormhole/magic-wormhole-transit-relay
diff --git a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
new file mode 100644
index 0000000000..f131477a40
--- /dev/null
+++ b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/magic-wormhole-transit-relay/json
+md5  aa575a4e22b3d5099674ba88b136a9a2  magic-wormhole-transit-relay-0.2.1.tar.gz
+sha256  cb4801b46890eaff97286e0e3fec62d1d52ffe317d140083b6336a1fb4e8fa5e  magic-wormhole-transit-relay-0.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  d70f6469bb210c2aa4c0dfd74f498ef5f0467a137d8296479088e7243c5884eb  LICENSE
diff --git a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
new file mode 100644
index 0000000000..e4ffe6e7a6
--- /dev/null
+++ b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-magic-wormhole-transit-relay
+#
+################################################################################
+
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION = 0.2.1
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SOURCE = magic-wormhole-transit-relay-$(PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION).tar.gz
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = https://files.pythonhosted.org/packages/21/c9/be25bb30e327037e009657960fc594d089b118c0d81cc6a200cad1bb3852
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SETUP_TYPE = setuptools
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE = MIT
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
