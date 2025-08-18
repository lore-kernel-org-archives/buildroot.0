Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD4FCA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 14:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2AE160FBA;
	Mon, 18 Aug 2025 14:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7imamD8PEGa; Mon, 18 Aug 2025 14:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E5C60D9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3E5C60D9B;
	Mon, 18 Aug 2025 14:28:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF1A2E2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4D8B60FBA
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVfdEajceAfw for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 14:28:15 +0000 (UTC)
X-Greylist: delayed 335 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 Aug 2025 14:28:14 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 81B5660D9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81B5660D9B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.224.244.104;
 helo=mail-244104.protonmail.ch; envelope-from=philip@philipmolloy.com;
 receiver=<UNKNOWN> 
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81B5660D9B
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:28:14 +0000 (UTC)
Date: Mon, 18 Aug 2025 14:22:23 +0000
To: buildroot@buildroot.org
From: Philip Molloy <philip@philipmolloy.com>
Cc: Philip Molloy <philip.molloy@analog.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Philip Molloy <philip@philipmolloy.com>
Message-ID: <20250818142203.421300-1-philip@philipmolloy.com>
Feedback-ID: 9117015:user:proton
X-Pm-Message-ID: 934ec49b0fa92091f23b01dc9a6227b73ea8a5b6
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philipmolloy.com; 
 s=protonmail3; t=1755526947; x=1755786147;
 bh=OlrL1HstqivAEHNOI0hDf1NTiv/ZMamvx3GSDns+Alo=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=C7dnXdCAQysfETfGj3r8BnfuXdulPJSbBPCpMliyaCSMwElRjatEXddjZQbOJ5mGN
 8ZcFrCuPn/oIdCAvhnA69OobJBaTMIaGk57sdfVgf9MDrUE0eHetyOquOQLW29LIix
 ljljPiaWrwjqnNf3CmSAtcTBysD0wDr+iuDWtyTiJANq7Y51s/cHN+itizJvzSBjGp
 WntgN1M34Fo7ZagG+ki3q0GOvtXWsPSVomiiYSdK3Q5VGxNRmpmkEahR2bQDpB4P+0
 KOEOJINHbKTAygUCKT+gQeWXXOWhH7BCpZZwmI2Id0SkoXfSRxw9LCw9L5STtI/yFH
 F3CrobybgPdmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=philipmolloy.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=philipmolloy.com header.i=@philipmolloy.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=C7dnXdCA
Subject: [Buildroot] [PATCH 0/4] Generate ADI ADSP boot streams
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

adsp-ldr is a command-line tool that generates boot streams for ADI ADSP
processors. It is required to boot U-Boot on ADSP processors. This series is
the first step in adding support for the SC598 EZ-KIT evaluation board, and
eventually other boards.

Successful pipeline for this series:

https://gitlab.com/pamolloy/buildroot/-/pipelines/1989414592

Branch containing this series:

https://github.com/analogdevicesinc/buildroot/commits/staging/philip/adsp-ldr/

The entire series adding support for the SC598 EZ-KIT evaluation board:

https://github.com/analogdevicesinc/buildroot/commits/staging/philip/support-sc5xx-eval-boards/

Philip Molloy (4):
  package/adsp-ldr: new package
  boot/uboot: depend on adsp-ldr if needed
  boot/uboot: add ADSP LDR binary format
  DEVELOPERS: add Philip Molloy for adsp-ldr

 DEVELOPERS                     |  3 +++
 boot/uboot/Config.in           | 12 ++++++++++++
 boot/uboot/uboot.mk            |  8 ++++++++
 package/Config.in              |  1 +
 package/adsp-ldr/Config.in     |  9 +++++++++
 package/adsp-ldr/adsp-ldr.hash |  3 +++
 package/adsp-ldr/adsp-ldr.mk   | 19 +++++++++++++++++++
 7 files changed, 55 insertions(+)
 create mode 100644 package/adsp-ldr/Config.in
 create mode 100644 package/adsp-ldr/adsp-ldr.hash
 create mode 100644 package/adsp-ldr/adsp-ldr.mk

-- 
2.50.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
