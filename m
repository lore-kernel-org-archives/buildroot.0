Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B51A606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 19:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a7wKPg6R
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 079FA811F3;
	Thu, 26 Nov 2026 19:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnoPYgDOkNe5; Thu, 26 Nov 2026 19:25:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 17AC5811B5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795721112;
	b=gbV/DHJnt+3ydM4OE1Hvpmn3fuAJzMzsP7vVe2YFJsvCSGrJESa7z6vyf0AfEnwh82xF
	 ObVkkR0em6E9LtTf5EUxaGQk/uNTPB4+eUqbVf4R2elUbubOzLlxC5UDRntbDRd+fcXeh
	 eQ6CD1Y8wBlbWklzb1LhAMn3eRovNh7CH20AAGqtlNBcbHFRBXfyK9I1U54y2/ifrwKtW
	 IZAtBhQV/EuQiK1kMXNVoS4Hcph/FpISWOef+58DQ87HKM+OjBFy2vFy/YrKMrVAtgF4N
	 RSjVj27yL87i4T8VBT73K1BJ1yZV8BwTOJXPW3vF4jRPGW/EebmgRhtXTM8hATrrPgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795721112;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=YVRreQNMloEo0OCRYmEt8foNMCD9002DfetEB7eh2l8=;
	b=gt/wPWesOVQ3g1NBzDMb3uOscTc1bXcGIgTUbY1kvpTqP8Ivj8hHr3eoL3K4zWZanSNQ
	 Vo+UWIw1cO6xoeNoabLXTB69qbgIyysGddj7vimYyowUWReeenMrkfaS58J19pPpQCA8K
	 M3Z/fCNt9VnbiqVgk5ONoP6uGAPD4va4oiD5LR/IOZZXLyHmnqEABZg8WxL+DMNgDtIco
	 ciWUGae1W9046s9qggFFmRsztH2Bo5tSZsoNvFivNQlTs3iu6NNUfpQoMwO34RjuRE1wU
	 PQ5S5dFmnNBuw2bmRnrJzEjHJwbJCrKALYQ60QvRMPrgc0jtl9k+m3NXkgoAckCXbTA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795721112;
	bh=YVRreQNMloEo0OCRYmEt8foNMCD9002DfetEB7eh2l8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a7wKPg6RGV7s+GWxXn1mK6X80NszBn/J9Dc/+nNVUuLRHXotMR48XsaSbe8gazAxo
	 CUXvAG3wLDtSRwMU5jQNwt4kWIRAP6DqP+Pdkqo1flh9b45pbIMW2eo0lYYRwqdiUS
	 oCv6RUWaqheRuusBFtDFPiN86Lm4NNkJ/cMx5F4BKcCIJbIyt9Q3hvL0wu8Qfe2tMl
	 aDWU478OmilS+tcY6IkE62iLvQbefKc6UdqcRMEE78wUG1WXs82YyOejv8P4NW/Aa5
	 5rfjJSkkFO59Ft25eiXZ5P1PH2d6YuIwz/6am00cL7lNLkFgPofFIMivPP83vNuhyH
	 w4hnRX/Y9cQeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17AC5811B5;
	Thu, 26 Nov 2026 19:25:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 760BA22B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C8AD408EA
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isjH2DixJLLA for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 19:25:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2669640A08
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2669640A08
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:06 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795721104; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:UNNHsyXKgXEaCNxdIO/9yibRRDQk
 eHZTwCdn4HYmuAAbFsruw9oiLJhps0+mnAcxzhDD+ZZ/VdKA1om+Hw87uuQxy/x/niTXwIwD/nt
 ePBZlo7rmxmgYNlGR4SE1h5fbO81KTXMjvHE1/GfkSkgPGahf/3P1znP40K/j5XA5RKwUOYXg9m
 InEo+m1OJcsWdrTYuepINfZ+YmBPAq/JUisPL198exXcG++6334pHog/F9yrd6cj7opOpw70yIT
 2Qb+HOP3VRsjpwQdSeqQjDj7jHvirVS3Fs2q77s0Xz0MyJghnTBB2HnZ4+BkHEVev4g8FbIMWU8
 fcT5TrBUDTIijw==;
Message-Instance: m=1; h=sha256: pDi9m7Qzmwy1yL83Jjnc6IB0VjSO9rdq78Sz5rwcbWM=:
 SwrCcj2s9Iphb2eqfLO/mIFCBY0NH3h+YzC7jpddIeQ=, sha512:
 +LI3zJcEZKkuWIu6V5vm7aBO8j17yypcu3WltY7I5hDR2iTAopvRCINltX4zIbSUunVscL/ccwUFQIxBZBkNYQ==:
 ZooHmuIWbWss5gMwW4bDfWW3Ojj8su5WUQoOiZ7e5fIQRDqYwyISiRUoXX4uEwql2iabgUtDd0TDwO4BNzJJVA==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MG9gE-1xioiN2zUK-003CIu; Thu, 26
 Nov 2026 20:24:59 +0100
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu, 26 Nov 2026 20:24:34 +0100
Message-ID: <20261126192435.1826415-10-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126192435.1826415-1-fiona.klute@gmx.de>
References: <20261126192435.1826415-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:XMcmeX2lDjeN4R1xTKBBD1SQSYcZQqY/W4OHfwOMVZcxvlXZwaH
 zJgf9hIxfXIloJoui9RLpCCPyKAmsDd9Pw3qcaGtYqeVlqHcJbvypmDFF4jnpxjvEWTPdWB
 uIk3AkVbveigWLK7Lf8ZsSayUxJnM6qNWu9c148YAFi0x6EXdHjiAklMJGiXsSgiSzINJEu
 /hUY5g/DOMvtX5b7X037g==
UI-OutboundReport: notjunk:1;M01:P0:lu3bnmPAhdY=;OJwccXo0vaAcxmDPXHlDs112HuD
 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
Subject: [Buildroot] [PATCH 09/10] package/dracut: install components for
 systemd exitrd
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

With systemd, dracut can optionally restore the initramfs during
shutdown, e.g. so the rootfs can be cleanly unmounted and
device-mapper devices closed. Systemd calls this an
"exitrd". dracut-shutdown.service will prepare the exitrd if
/run/initramfs/.need_shutdown exists during shutdown.

Install the required tools and systemd units if BR2_INIT_SYSTEMD=y.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/dracut/dracut.mk | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 8918eebfae..0533862d18 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -9,14 +9,12 @@ DRACUT_SITE = $(call github,dracut-ng,dracut,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
 DRACUT_CPE_ID_VALID = YES
-
-DRACUT_INSTALL_TARGET = NO
 DRACUT_INSTALL_STAGING = YES
 
 # dracut-util has no dependencies beyond the toolchain, and does not
 # require running ./configure first.
 define DRACUT_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) dracut-util
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) dracut-util dracut-extractinitrd
 endef
 
 # dracut-util is only needed in initramfs
@@ -24,6 +22,22 @@ define DRACUT_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/dracut-util $(STAGING_DIR)/lib/dracut/dracut-util
 endef
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+define DRACUT_INSTALL_SYSTEMD_EXITRD_TOOLS
+	$(INSTALL) -D -m 0755 $(@D)/dracut-extractinitrd $(TARGET_DIR)/usr/bin/dracut-extractinitrd
+	$(INSTALL) -D -m 0755 $(@D)/dracut-initramfs-restore.sh $(TARGET_DIR)/usr/lib/dracut/dracut-initramfs-restore
+endef
+endif
+
+define DRACUT_INSTALL_TARGET_CMDS
+	$(DRACUT_INSTALL_SYSTEMD_EXITRD_TOOLS)
+endef
+
+define DRACUT_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/modules.d/77dracut-systemd/dracut-shutdown.service $(TARGET_DIR)/usr/lib/systemd/system/dracut-shutdown.service
+	$(INSTALL) -D -m 0644 $(@D)/modules.d/77dracut-systemd/dracut-shutdown-onfailure.service $(TARGET_DIR)/usr/lib/systemd/system/dracut-shutdown-onfailure.service
+endef
+
 HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-cross-ldd
 # Dracut is not a real autotools package, and the hand-written
 # ./configure script does not preserve LDFLAGS for make.
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
