Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E33C36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 11:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C417981343;
	Fri,  4 Apr 2025 11:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hadh_SB2lJ_s; Fri,  4 Apr 2025 11:15:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A797881289
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A797881289;
	Fri,  4 Apr 2025 11:15:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E4391C7
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 11:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13C5340668
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 11:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWEZzQWPYFzF for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 11:15:40 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 04 Apr 2025 11:15:40 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0ECF740208
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ECF740208
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=18212901c=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0ECF740208
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 11:15:39 +0000 (UTC)
X-CSE-ConnectionGUID: OD9/7JEtTm6INTpKo/nToA==
X-CSE-MsgGUID: NDb4JaxSSIiMj42fGCLb6w==
X-IronPort-AV: E=Sophos;i="6.15,188,1739862000"; d="scan'208";a="40101906"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2025 04:08:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 4 Apr 2025 04:08:02 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 4 Apr 2025 04:08:01 -0700
Date: Fri, 4 Apr 2025 16:37:52 +0530
Message-ID: <20250404-optee-4-5-0-v1-0-704dadae3f5b@microchip.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIm972cC/0XMSwrDIBSF4a3IHfeCr2BxKyWDqNfWiaaahkLI3
 isNJMP/wPk2aFQTNbBsg0praqnkHuLGwL+m/CRMoTdILgeuucYyL0SocUCOLrh7NOSNVAr6Y64
 U0/evPcajK70/HV2O8TItO0Wn0ZccUZoYaIrKBUF2FTDu+w9m9wKSnwAAAA==
X-Change-ID: 20250404-optee-4-5-0-bdb8f7ec7233
To: <buildroot@buildroot.org>
CC: Etienne Carriere <etienne.carriere@foss.st.com>, Nayab Sayed
 <nayabbasha.sayed@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=nayabbasha.sayed@microchip.com; h=from:subject:message-id;
 bh=rnG8A+GUqqX9BpgHmx+GS+4SlnHYxoXu/iuw2WZ2Oi0=;
 b=owGbwMvMwCEmfMj/xNz7ei8ZT6slMaS/3zvh5XbvVJugf5pXdddPieOuiJ/0v9iQlTNVfYmAo
 s3XMqHpHaUsDGIcDLJiiizdm+fPNiz605n5k3MFzBxWJpAhDFycAjCR18cYGRZXpj4KmMFS8uFq
 b5OjCtcu6QvsOj/2TLGcv2/Bmn5VAWlGhu3OLzvKdCYG7he/aJB+tK5o9dzW6eGr7EXl/7TMKt/
 Ryw0A
X-Developer-Key: i=nayabbasha.sayed@microchip.com; a=openpgp;
 fpr=E108A58C09FB2280B0AB41DAE24318EF3B3861A3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1743765340; x=1775301340;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=rnG8A+GUqqX9BpgHmx+GS+4SlnHYxoXu/iuw2WZ2Oi0=;
 b=gX9l0eKeqJU/33/5CiwIiWoiLepu9N0zbrVngayCSfCbec/pW0sfP7R7
 0cqma0bS7DzMBgb2SBC6bjpk0q7ADWl8dqhFh6jfRvwjxVbaOBtYB9sgh
 jmarAV/izjABnkYiwwJRvt+z0RcptEE8BGELWzsPLOiuymhM1AJoTIwT2
 Lz16EIeXHvxlmh40HzgB1PZJ40ZV3S0a6hwRnbNzlKgMm0DfTRoWKuzhT
 rY4e8l0L8glOpSWSlNVpehpGfEJoHE2+33PsN1oF4B7+mFwnNlVt7e9nX
 PMLI0QkZujM/5SFkIDfJigqRm1uM9J03VLdyKPARo3vhoMy7yOX13zS8Q
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=gX9l0eKe
Subject: [Buildroot] [PATCH 0/4] bump optee-{test, client,
 examples} packages and optee-os
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
From: Nayab Sayed via buildroot <buildroot@buildroot.org>
Reply-To: Nayab Sayed <nayabbasha.sayed@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
Nayab Sayed (4):
      boot/optee-os: bump to 4.5.0
      package/optee-client: bump to 4.5.0
      package/optee-examples: bump to 4.5.0
      package/optee-test: bump to 4.5.0

 boot/optee-os/Config.in                    | 4 ++--
 boot/optee-os/optee-os.hash                | 4 ++--
 package/optee-client/Config.in             | 4 ++--
 package/optee-client/optee-client.hash     | 4 ++--
 package/optee-examples/Config.in           | 4 ++--
 package/optee-examples/optee-examples.hash | 2 +-
 package/optee-test/Config.in               | 4 ++--
 package/optee-test/optee-test.hash         | 2 +-
 8 files changed, 14 insertions(+), 14 deletions(-)
---
base-commit: 74dc2f78ac78543467865be2cce39cd008c974fa
change-id: 20250404-optee-4-5-0-bdb8f7ec7233
prerequisite-change-id: 20250404-b4-conf-27fdeaf3bd1e:v1

Best regards,
-- 
Nayab Sayed <nayabbasha.sayed@microchip.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
