Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ACCC369CB
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 06:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09823606C2;
	Tue, 29 Apr 2025 06:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTSJhaqcnPM5; Tue, 29 Apr 2025 06:41:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A739606E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A739606E2;
	Tue, 29 Apr 2025 06:41:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47E191C4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32E9680BD3
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PX3V54c-SH1 for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 06:41:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=20723122b=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 57AA980BC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57AA980BC3
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57AA980BC3
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:41:54 +0000 (UTC)
X-CSE-ConnectionGUID: bKa2xpqTRSaMBxsSc3vR0g==
X-CSE-MsgGUID: 8FECkLkQQxaxCNsTZWhOjg==
X-IronPort-AV: E=Sophos;i="6.15,248,1739862000"; d="scan'208";a="41007748"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2025 23:41:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 28 Apr 2025 23:41:45 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 28 Apr 2025 23:41:43 -0700
Date: Tue, 29 Apr 2025 12:11:26 +0530
Message-ID: <20250429-optee-4-6-v1-0-1cdb296ef7c8@microchip.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJZ0EGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNL3fyCktRUXRNdM12DFGNjoySjxBQT8xQloPqCotS0zAqwWdGxtbU
 A/t8MmFsAAAA=
X-Change-ID: 20250429-optee-4-6-0d332b2ad47d
To: <buildroot@buildroot.org>
CC: Etienne Carriere <etienne.carriere@foss.st.com>, Nayab Sayed
 <nayabbasha.sayed@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=nayabbasha.sayed@microchip.com; h=from:subject:message-id;
 bh=epouvwV+gx5/wheFa6koWvlwDCNiDriy6Rj96tXftgM=;
 b=owGbwMvMwCEmfMj/xNz7ei8ZT6slMWQIlCybXRpnvfLRpKn+35vEQ/yWhR9YvqGb4fDE+hDuo
 8YCqw5Fd5SyMIhxMMiKKbJ0b54/27DoT2fmT84VMHNYmUCGMHBxCsBENqgwMuzO0/jFH109pbzg
 USvvPU1xXZa9fwQmZHTVf3IyZnn8j5eR4ci6Rc+qHyxgnLZ/N6P4sX3XH32crL3R0j6DP3zibFX
 uekYA
X-Developer-Key: i=nayabbasha.sayed@microchip.com; a=openpgp;
 fpr=E108A58C09FB2280B0AB41DAE24318EF3B3861A3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1745908915; x=1777444915;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=epouvwV+gx5/wheFa6koWvlwDCNiDriy6Rj96tXftgM=;
 b=IxCq8I+T3dUFNDWawpreWAha/avmw3Sdw70cVaG9SjO+RXxISCJMipfv
 P9H10RFTLvmY3mOoMssk0gGkgmEMPiQnf8w14WjyqLpUrOnbfJdW7AgfW
 UGU+wuHLnFNZSbXkdIv60pe/WR9fQALQIFke43vnLyGLjrR7kArVyAE4k
 HzGLpmss+qnkXUSYa3j82lABi/v0LlJCNBzGkFhuratnnc546LcVpfjmz
 5miYu7JeP7CRlPdGjRpJsfrpsT6xq0IW+T9EANmQcCAHUOCD/FNJsCBhU
 PiB5lFylkKDvvP7tjERD1TFfVdHhLJyPGG2sBC8KTCbL6KjeV55Y1SAnX
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=IxCq8I+T
Subject: [Buildroot] [PATCH 0/4] bump optee-{test, client,
 examples} packages and optee-os to 4.6.0
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
      boot/optee-os: bump to 4.6.0
      package/optee-test: bump to 4.6.0
      package/optee-examples: bump to 4.6.0
      package/optee-client: bump to 4.6.0

 boot/optee-os/Config.in                    | 4 ++--
 boot/optee-os/optee-os.hash                | 2 +-
 package/optee-client/Config.in             | 4 ++--
 package/optee-client/optee-client.hash     | 2 +-
 package/optee-examples/Config.in           | 4 ++--
 package/optee-examples/optee-examples.hash | 2 +-
 package/optee-test/Config.in               | 4 ++--
 package/optee-test/optee-test.hash         | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)
---
base-commit: b6f33b248a677c91e05f4c670671b79ec5c6a05a
change-id: 20250429-optee-4-6-0d332b2ad47d

Best regards,
-- 
Nayab Sayed <nayabbasha.sayed@microchip.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
