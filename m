Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED50C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 04:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D0D58002D;
	Thu,  6 Jun 2024 04:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnilyXpZE69j; Thu,  6 Jun 2024 04:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3158384A34
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3158384A34;
	Thu,  6 Jun 2024 04:53:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 753C51BF955
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 04:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62D576073A
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 04:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTmJja03mvNA for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 04:53:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55;
 helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 86DD3606D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86DD3606D9
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86DD3606D9
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 04:53:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C9F7DCE1A54;
 Thu,  6 Jun 2024 04:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B64C2BD10;
 Thu,  6 Jun 2024 04:51:13 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 07:51:02 +0300
Message-ID: <20240606045104.21332-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1717649473;
 bh=Pc5lv0UQxauw58dm2cwlS/GjEL9fgYwvFa+pGEnv4rc=;
 h=From:To:Cc:Subject:Date:From;
 b=TIV+96oQI6kCtJVC1FH/UzguaaCiDVHW8cs1rhsJ8TRNzy84kWC5Ud5u8mi7vbEuf
 WVN6OdZoO2mcZ1VnVm4tX6+3RtIERv3ZkVr2Meh+YylJPAcO7HYQeyFrOly87uqQYc
 /lob3OUiMNPFasbURtwARao7/zquQ/VRvqW1N4Zan4qpDOdlBrMsD4T4Z9AOpKbWtN
 WXeICt35dBLoyNZd0Q1DXRIsyeLvSMZ1ew59RIgo3iHRyI/ZEdT0ffnOpzgZ+wAGRZ
 6wOnUEzyp2uPLl6K6kaWa8KKC/rVx9Fn6LUbrZneVzXqaQrbcSwMIBtU/kwKvYBFG8
 zIP4sPNxozZ0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=TIV+96oQ
Subject: [Buildroot] [PATCH 0/2] Bump the versions of systemd and tpm2-tools
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
Cc: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
 James Hilliard <james.hilliard1@gmail.com>,
 Erik Larsson <who+buildroot@cnackers.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>

Upgrade systemd to the version 255, which is the last one supporting System
V init scripts and cgroups v1. In my use this particularly important
upgrade because I benefit from being able to do kernel testing using the
new systemd-pcrlock tool.

Given that 256 will break a lot of stuff also 255 I'd figure that BuildRoot
will for some time stuck with that version so better to start maturizing
around it fast (just a guess).

tpm2-tools 5.7 introduces tpm2_encodeobject tool, which is used to get PEM
file, which can be further processed into a DER file by using openssl's
asn1parse subcommand, and eventually get a loadable object for trusted keys
when backed by a TPM2 chip, and also for the upcoming asymmetric ECDSA ad
RSAPKCS1 sigining keys (crypto/asymmetric).

Cc: James Hilliard <james.hilliard1@gmail.com>
Cd: Arnout Vandecappelle <arnout@mind.be>
Cc: Erik Larsson <who+buildroot@cnackers.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Jarkko Sakkinen (2):
  package/tpm2-tools: bump version to 5.7
  package/systemd: bump to version 255

 package/systemd/systemd.hash       | 2 +-
 package/systemd/systemd.mk         | 2 +-
 package/tpm2-tools/tpm2-tools.hash | 2 +-
 package/tpm2-tools/tpm2-tools.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
