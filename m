Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A67C02183
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4A3A4052C;
	Mon, 13 Jan 2025 20:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkQMGVznwkQK; Mon, 13 Jan 2025 20:05:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C46A40505
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C46A40505;
	Mon, 13 Jan 2025 20:05:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D5A5940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B377810EF
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjrwfVxAbxjs for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:05:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B32481067
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B32481067
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B32481067
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.64]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhlf-1tfNBW19XD-006X9H; Mon, 13
 Jan 2025 21:05:29 +0100
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 21:04:53 +0100
Message-ID: <20250113200454.3108562-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113200454.3108562-1-fiona.klute@gmx.de>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:6DIzg9evT/pYmDSb6iiayFq3npc/sNPtd0qj2qSDH3DDFNnmX4k
 Oi3O+X1pEP4Lcfnu/3Ch3i7evpvCCnD7X6c3k3VmUjclbYJ19nWAX3IIK2bDszIFjsg1OIy
 jv/D0U3tRDws/BcxVWuph925PgbCyEWQ8EM+65pyFDemg6n4CPtKj9VxRAzgBv4/Huo0Cnl
 VoX1lIa7Gogfva1yjLAfA==
UI-OutboundReport: notjunk:1;M01:P0:ot6VfSAYR1k=;O2LwwhNI/5CHQOQbO4cO0OaKdVd
 W+eCPWQEhCMFwiicEtlfD40pl76Zrx3rCW46OWrNhexfxcqZHfk6RIlU/RiNR7Im4uxdTzRvY
 VWJEav+93OQYK5eWQe9o0zsFpbWd4ktRIKA2osv5ca9JyxASqnLqIcIW/6e6cIbgit9tS6NEa
 GsVIjViAEf7L5224ozuvv50mCY7ie/mikF8d1tSWGamzAqRn75eMgI4fZq2r7B3w6pkvcZMXl
 0/flsxIQn7LKTBywIi1+WlsB6GmXMFIY7C4RPJ6U5zY045uJSfZtw5lR5KLLx0M05+DW9T5s1
 OwIKZGkpsKExZCKMRRyoJ7YbXMtDOJWdpWVFtdTdD1Gi+S+NsX+cVhfNIto2uYeqA27RcKHVn
 jUA5Qip63AzAh2CHD0YsMSfb+H0WCsPY9F12P1EfSnHrfrb1g1jj0OgaU3IAzyIfiIiZrAJsR
 lE6pbLCOAnrdwnZYWBpAnj9qsUfcqxd9VoFViDBWcECZMcQJXiiKb7LO8pACQ5lAKRBgElZKE
 JFkPMET1c2YwbtYpXcKXWiRn/oslkv+iDePNhsKyLoHkqsHUihRXKTJ78KBvdy6LSxA21ELar
 NoNtg7FtNlcygVqoOLd9B/Ww/vI2gzUDcGfep59HzLXCIcJGqGRdeaprUscfGnNfQRytVbu6H
 1fKgZ5ji7fzNKjSQF4fgH2L3IVwnaUQGdr7by/ktZ2lVI/BxyGvswDAsEG+JETePGricWQRxZ
 dUzMJxXyzy7IBTi9/SOu3C942fL4Lvmz9kx2Gp5As0gcqayJUJ/nagc/6139Ok0Cg9WNHJA/a
 fcU4qblZR7QVoE1gEthxdhcIAGhm1ku011bOpaAnt5UNyLHDuT8xQi3NxqwM+KNOoUevvz4yo
 7u78Ym3suTjTcknXNGF2bMoOidJqJxk6Bm6MmZCLrtAK6FKFjgVvWhGdEv0dFdjqEZzHV3UCs
 hqFoBNQIHCHQ0wBCVRzp3Z+YXFsgoNyVt0sBCDNju5ragh8b8lp1Jc4y0BtObvF4msYFmY38b
 Dg8m2KhfD+twgLpmw75W9Da22mWF6nmmKeP7zuMjNCc2+h5gyZHDaXqaPEww/ImV4EVpBRbKl
 pABx4eUxmoy93hePKs/oDcZeQpAaN3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736798729; x=1737403529; i=fiona.klute@gmx.de;
 bh=Zu8T+NcIdpB7IpdTsu0EdIdorzeDVOZpf4d/cVmPpFo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hCmOIOqYCFaCS5ldykSQOKTHMyrLqyUUwOtIlhb3GF7FsBRntVHqLFkisPMLWJYp
 erVN30vC3ezF9xDX5ZWSxSJW/vO0rWWL5DtiwdwiX3i1NtLMB4FrfRHREGo9pkgLa
 SLlnjX/nPEh9l4XCMjPLTQClV4F8j6a+jt3D1dmfgTehV5lS24BqOhYGsVgaNqryT
 pU/iy7z8DcucwXr4s0umKpZtjk5TboRde8A3QsVyrIyKdCQTNtwYPpS9e25nzZjI8
 vV4SJDzILotF2rNM/2SB1Pq3Hkq8xKpNW7G/jf0VrFLThz9MeZ/464bbEoVvq2Jux
 +FE2pxT03FHBy65Obw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=hCmOIOqY
Subject: [Buildroot] [PATCH v7 4/5] package/network-manager: optional
 gobject-introspection
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Introspection gets enabled if gobject-introspection is.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/network-manager/network-manager.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 8349b6c79b..785976a0aa 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -26,7 +26,6 @@ NETWORK_MANAGER_DEPENDENCIES = \
 	util-linux
 
 NETWORK_MANAGER_CONF_OPTS = \
-	-Dintrospection=false \
 	-Ddocs=false \
 	-Dtests=no \
 	-Dqt=false \
@@ -50,6 +49,12 @@ ifeq ($(BR2_PACKAGE_DHCPCD),y)
 NETWORK_MANAGER_CONF_OPTS += -Ddhcpcd=/sbin/dhcpcd
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+NETWORK_MANAGER_CONF_OPTS += -Dintrospection=true
+else
+NETWORK_MANAGER_CONF_OPTS += -Dintrospection=false
+endif
+
 ifeq ($(BR2_PACKAGE_IWD),y)
 NETWORK_MANAGER_DEPENDENCIES += iwd
 NETWORK_MANAGER_CONF_OPTS += -Diwd=true
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
