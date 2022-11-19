Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E135C4332F
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 22:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0642981355;
	Sat, 19 Nov 2022 22:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0642981355
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5kQh4aj4hJW; Sat, 19 Nov 2022 22:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FED581353;
	Sat, 19 Nov 2022 22:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FED581353
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46D9E1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 22:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E5694013C
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 22:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E5694013C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SGOjTGhEDRD5 for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 22:43:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08191400A6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08191400A6
 for <buildroot@buildroot.org>; Sat, 19 Nov 2022 22:43:28 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.43.158])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A33C9780333;
 Sat, 19 Nov 2022 23:43:20 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 19 Nov 2022 23:42:24 +0100
Message-Id: <20221119224225.589941-6-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119224225.589941-1-ju.o@free.fr>
References: <20221119224225.589941-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668897807;
 bh=DLsTtbm4g3zMOfQoeml3Q9tz8LQJw75nbogMOs4byMo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A/fPP26zuXvDaaqi4hJNTf1b9RLSj5lITOkwix+EG1gyN7p+g4x1neTm3bfg8AVa5
 TuqAskdMCPVYAb2O4FEfV7yZiLJnOiXibfX2DkEPxECwHMPPwPFfsKQ45OJ20Aw+ad
 dcOqSBAU8mP3yOPOBX/R6gDBv3M4DiZayJKdeRg9J1NgRKqP04qOXqO38jjjpWtT3D
 JoCKInXHQv9EhT9iTGHLLAKwg0U2O0ao395ax3cxPgwjyIwUCKmRqUkDiSehofWqOF
 A/HbU4GvruKtgEvzspqLOZ2nkkdSWpJ2WFnX/50fTu/Eriw+HvV7vWaXG1xgVuBsS/
 TTV7rv14cEpXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A/fPP26z
Subject: [Buildroot] [PATCH next 6/7]
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Transit Relay server for Magic-Wormhole.

This repository implements the Magic-Wormhole "Transit Relay",
a server that helps clients establish bulk-data transit connections
even when both are behind NAT boxes. Each side makes a TCP connection
to this server and presents a handshake. Two connections with
identical handshakes are glued together, allowing them to pretend they
have a direct connection.

https://github.com/magic-wormhole/magic-wormhole-transit-relay

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                        |  1 +
 package/Config.in                                 |  1 +
 .../python-magic-wormhole-transit-relay/Config.in | 15 +++++++++++++++
 .../python-magic-wormhole-transit-relay.hash      |  5 +++++
 .../python-magic-wormhole-transit-relay.mk        | 14 ++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/python-magic-wormhole-transit-relay/Config.in
 create mode 100644 package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
 create mode 100644 package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b49c58f8d3..86e68b3044 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1697,6 +1697,7 @@ F:	package/python-gnupg/
 F:	package/python-hkdf/
 F:	package/python-magic-wormhole/
 F:	package/python-magic-wormhole-mailbox-server/
+F:	package/python-magic-wormhole-transit-relay/
 F:	package/python-pyalsa/
 F:	package/python-spake2/
 F:	package/riscv-isa-sim/
diff --git a/package/Config.in b/package/Config.in
index ee0cf54b7e..eaf78b6bfe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1111,6 +1111,7 @@ menu "External python modules"
 	source "package/python-m2r/Config.in"
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
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
