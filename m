Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8F4CCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C2A83E8C;
	Thu,  9 Oct 2025 14:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKtCc2KGRBnu; Thu,  9 Oct 2025 14:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EE5A83E94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE5A83E94;
	Thu,  9 Oct 2025 14:32:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75AE7119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72975612C2
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzXHGEGekU4F for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:32:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 20911612B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20911612B5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20911612B5
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.1.172]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWzjt-1ummYS1yR7-00JVEo; Thu, 09
 Oct 2025 16:32:33 +0200
To: buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:32:12 +0200
Message-ID: <20251009143216.2282077-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:9T4GyeMRM/iZ8bNvtvr6d/IMR1UcJL2LuS1pJRiwaeoMPu8eAto
 YfkZu79vUoQZSx/vGWrgSMPeYhoRJV/8BOP1N3PszfmYkwxrkqdcjvKxODsZ8ErU/O7cuGk
 jqUw+XcbP72WiBrCfkthlut/4/OvCjymvUHBOYN75Hbx5C7HC243nzYozvfHZ+6OGi4C7Zo
 /mu9NsPtg8fyiZ3E93UzQ==
UI-OutboundReport: notjunk:1;M01:P0:h74ei6MyeW0=;IPtYSGWVAqbYdUQonuNecnRtxEf
 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
 UsaI2BoSb+EKkw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1760020353; x=1760625153; i=fiona.klute@gmx.de;
 bh=5Hllq8L/B2D9NsDYuPgd/53pUrjAZwuyvwsm8dAdV6o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UXU7b3HHuIJc0n9aPIVqRv4W3eM49Ydko0qS6gqfKJ6ciTDRT4HKehZ81bXfMnv2
 cFemEJhsHbTaSZJ1ffn3qbbUV1Zebk1Vy6plj+s18SoCN7H8XHkPKgoIiGu+uYGy+
 bK5ud4CdP9gG1mgqxENB8ihHW9tg1up2qP7RVFCrglSbv1Ic1xvrJ+3FXeCrMegCq
 BDgAw8g8x3KxhV8Wm3ff594GTOZ03vu1MX/Oh4jzvMOXiyJeK3Wx2sNHkyusox5KH
 GNUP5BEpx/hZyZlp+e5AgaxgLF6fbX8wzqrWIb70B6KIWbb3BPUdmPRmbblSZJ+cr
 bl/GhmUv/zErp3IwRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=UXU7b3HH
Subject: [Buildroot] [PATCH 0/4] SELinux tidying and debugging
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

these patches fix some small issues I've encountered while setting up
a build with SELinux enabled. Patches 1 and 2 and just a little Python
install cleanup, 3 fixes an upstream repository link in package help,
and 4 adds a build option that is useful for debugging policy issues.

Best regards,
Fiona

Fiona Klute (4):
  package/selinux-python: install modules to site-packages dir
  package/libsemanage: install modules to site-packages dir
  package/refpolicy: fix upstream URL in help text
  package/refpolicy: add config option for "enableaudit"

 package/libsemanage/libsemanage.mk       |  2 +-
 package/refpolicy/Config.in              | 15 ++++++++++++++-
 package/refpolicy/refpolicy.mk           |  7 +++++++
 package/selinux-python/selinux-python.mk |  2 +-
 4 files changed, 23 insertions(+), 3 deletions(-)

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
