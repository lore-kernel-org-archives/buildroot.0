Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E76C2BA1A
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 18:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C721605B7;
	Mon, 17 Jun 2024 18:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgBoq2jwfvFz; Mon, 17 Jun 2024 18:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86BE1605C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86BE1605C2;
	Mon, 17 Jun 2024 18:08:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5D611BF293
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 18:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E04F8605C2
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 18:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vojp3tJuX-hI for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 18:08:49 +0000 (UTC)
X-Greylist: delayed 478 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 17 Jun 2024 18:08:48 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B33CD605B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B33CD605B7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.241.56.161;
 helo=mout-p-103.mailbox.org; envelope-from=a.wellbrock@mailbox.org;
 receiver=<UNKNOWN> 
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B33CD605B7
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 18:08:48 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4W2yQ43zTBz9scd;
 Mon, 17 Jun 2024 20:02:04 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 17 Jun 2024 20:01:57 +0200
Message-ID: <20240617180157.3771298-1-a.wellbrock@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: 1wquid1f6guo9x1iqod9qb6tp4yuserj
X-MBO-RS-ID: 04880443dbbcf0a19f9
X-Rspamd-Queue-Id: 4W2yQ43zTBz9scd
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbox.org; s=mail20150812; 
 t=1718647324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KtJ2QfbCcjdT53fK1MdLRXM0xmVyhIoMYughl7NBEX8=;
 b=UH14cI2aWMQ8BnqmwZZeafcziQzw1mdYCM+wO33CfWBHvxHyxO7Rg+ZGRLhw7SAJnAgLkv
 l7A94RJpaDLTfZUbfUXIWsiD2/Z98NgEIYq0zCGTaiL0gnwi9xp3hwDp2SiTqFMj2FJJqq
 ko3N2ABNDAThJq2zCjmZiT+8bp/6mKJ++hCM+8AN5CuXrbI5fHwpHg8nEKnzgS4/1THyOT
 RCeKgFe25Jr1fIks+w0lInuMBbhNayICCc3VCpJO7DQHeMlQb2SU1AY1EQuj++8xbtE/UP
 SlaKCUvW8Vet6GEmK0Vnue6DqKg4xuBySh4+HDP0nmk9Bv4Fh2tBvoFbw53NDg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbox.org; s=mail20150812; 
 t=1718647322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KtJ2QfbCcjdT53fK1MdLRXM0xmVyhIoMYughl7NBEX8=;
 b=Hhz3cW/i0sLiJcNB8kgIcTT7mQZpp5d4msfv3ZKGJZRxvD6dEoz24lPQhKwzqomyFDdi3x
 PDPjVSIx9lGdOudigZ3jelYYErI9Fw3r11iPtkRf0JDy7RuePmArk3C6fkkuwZU1mEpnfX
 S0/r9EY66xtV6nIGH0DL9NQrwvD6NFx16LhLxZp14Tw07PxkV0vW+UHatH+LDqss+72ED4
 H3YWKVCObESdIexaVCY7QJWWtMyWPBhY09Vp+t/q8YUUdq22p3HP7trZF7LQtR+xoMfbLE
 MKL6SM5gCDsavJvbTabpfTYj7U1PK1XPJ9/LIAH83noVDI8R3HJa4Hg8KSvY+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=mailbox.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.a=rsa-sha256 header.s=mail20150812 header.b=UH14cI2a; 
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.a=rsa-sha256 header.s=mail20150812 header.b=Hhz3cW/i
Subject: [Buildroot] [PATCH 1/1] package/c-ares: update site url
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
From: Alexander Wellbrock via buildroot <buildroot@buildroot.org>
Reply-To: a.wellbrock@mailbox.org
Cc: alex <alexander.wellbrock@othermo.de>,
 Alexander Wellbrock <a.wellbrock@mailbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: alex <alexander.wellbrock@othermo.de>

Download URLs changed after hosting of the c-ares website changed
ownership:
https://daniel.haxx.se/blog/2024/06/06/bye-bye-hosting-c-ares-web/

This cannot be fixed upstream as github pages does not support .htaccess
files according to:
https://github.com/c-ares/c-ares.github.io/issues/2

Signed-off-by: Alexander Wellbrock <a.wellbrock@mailbox.org>
---
 package/c-ares/c-ares.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index c4441255a2..a75a40da70 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 C_ARES_VERSION = 1.27.0
-C_ARES_SITE = http://c-ares.haxx.se/download
+C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/cares-1_27_0
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
-- 
2.42.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
