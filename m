Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635DFC5CFEB
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 14:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39A4460B1C;
	Thu, 13 Aug 2026 14:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISr6K4q-OwI9; Thu, 13 Aug 2026 14:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B09736085B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786631683;
	bh=XvJB05HHbbsby8TE2LRuRXpv6QPXn7DvUz5OOSKuN6I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=fg60cOsL/V8psrYOwwrns61uoku2XXP9yp/phsrMRg0YagdKqxjTwj19uMgeMDNch
	 wI6WU0dNSvVruR88z9v0+MmJ9MxH/Fa5qsAyAljNAXelYzlxhSoMxRO4PmRQY89kmb
	 X8wRmA3M7jQqi9ffxyWYjrcxAGGz1u89dmNdvmExAlYxpEn+27u7kYzsu8npxRmSl1
	 do1Ny/dtp2a8I4Ub+pW6SrwXXkSJ+3IWcOLklRC3lBHiHR4d737mcbu+eGtjXLHaXI
	 kVV146g6OBI5INJckK0Ry9Dm1eKNYy3PVCdZAgaAYrdadpH5DOGCC5UNKXp9ksCQ2q
	 c0nzI4YAJtKaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B09736085B;
	Thu, 13 Aug 2026 14:34:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48F6C198
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 14:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AAE96085B
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 14:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 046arhyRAZxX for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 14:34:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9DAB6085D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9DAB6085D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9DAB6085D
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 14:34:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmDIu-1xKom02tv6-00hNRl; Thu, 13
 Aug 2026 16:34:32 +0200
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:34:03 +0200
Message-ID: <20260813143405.2868517-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:KBf/vkkYasunYh8IhVXugNFdffhO6m54qELgo317ZkdUuvGtS7s
 HEzWulDGEfLSMUkLUsTj1nsGv+yNFvLit653Al+V2nj6Yz+idAELM8ML8Zm/5fCmusK9rnT
 D6aKiawIMXI4fct4z+vYACf++ut5D2EiS/f1pEHHw5UKVwzjp+hn0cNCBjG0+PMCTvgSFcf
 9CDx4eEm4U3VkwPAR90pg==
UI-OutboundReport: notjunk:1;M01:P0:Uma4uzBAnDM=;IwUEjXGCtJtZ+uoUolYBr5Ms88K
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1786631672; x=1787236472; i=fiona.klute@gmx.de;
 bh=QVLP7pL79PTDuz/ohGyDRzv5kUqCBapfkDCrIBLZEoE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QWg9GWw5vVNxpz1tmNwHUUkjNez7RxabZVXxGavh1KX5bgDwvDe7C8dHKF7rBsUe
 2uyB+2jYiPmXvzcfdHXadcjyJmDW3B8t3jQpTkOKUDssPUWrTbNlfhgOPt/vQxJ34
 rY6cOUnEDf8kzMYMRY0xXredq2EynaHOPLxGqJXgdHFnQZtCc7NpccE76RRZObekC
 3kMUcLaewivwsIcwWhu1sLW0kS+DxU1rzpsVLut6q6awOVMnvNmwcn1tR2GIF7MSt
 OclESveSKy6LXgkQlMyz6yAzhzUaUBD8fbJWu2CXYj8M3XORChcPSkNHTPXxz/2Kp
 nEXNI6mFgG7UovzaQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=QWg9GWw5
Subject: [Buildroot] [PATCH 1/3] package/dracut: security bump to version 112
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thierry Bultel <tbultel@free.fr>,
 "Fiona Klute \(Othermo GmbH\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

Upstream changelog:
https://github.com/dracut-ng/dracut/releases/tag/112

The changelog lists multiple "security related commits", though only
one mentions a CVE: CVE-2026-6893 [1], which allows a malicious DHCP
server to inject code into shell scripts.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-6893

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/dracut/dracut.hash | 2 +-
 package/dracut/dracut.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dracut/dracut.hash b/package/dracut/dracut.hash
index 1b5b3dce55..3615c2af14 100644
--- a/package/dracut/dracut.hash
+++ b/package/dracut/dracut.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ca949190692e91611ef16ea3642c0f764f63948860f3f742524310728c991493  dracut-111.tar.gz
+sha256  839d21eb4bd27bb0ee40d74c9da46df088c2e1425fcd8c3ea62b7e3a3dd28a91  dracut-112.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 3a1c1567e8..0bd24d49f4 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRACUT_VERSION = 111
+DRACUT_VERSION = 112
 DRACUT_SITE = $(call github,dracut-ng,dracut-ng,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
