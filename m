Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADAB606A326
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 13:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=shYTXqwM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FBB0605EC;
	Mon,  2 Nov 2026 13:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjzZKzy24nkg; Mon,  2 Nov 2026 13:33:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8A1D160658
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793626389;
	b=DLeyRb53fFiE/yPTmXqcAYRAIoLZur5kPaD2KDyUxT/72RDLwaNwNDFqF5q2q03u89j9
	 /HhWwhVaQYWzP27R1CH/FUPjNwXQtPz+4N8TTjaWALeWtgcIRZKcoqra9xIfEQI3rqxMC
	 NkCq9PCLNpRsYxzTWNtXsq3AQ7qL3qeR+McbySZynP9127w8fggnPVrKWDvPFgCf1jq3l
	 LBvJzmWtf5wXpIiKsr58S27Qm8HU2qag4HMpXjcMG/eG05aLUXguTF1RH/zjAdq420TNX
	 WYELca3f3EhrJsTeX5pakRgc8j8iXYPn3+HnWOqHnPhDhHp5qLFogfnQeciVUrxhNrA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793626389;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eTgDgmyrr5MZNNsP3/IwqDndop4cXV0wHfvgvcsif/0=;
	b=VnIvMlKuomnPH2y0qX3CaRvWkag8lhTR0hIKYTWHo7vYeTQlqFM1bp5JvGphyPIyoIEW
	 uiT7KnLKl4/+WWpxs46DdAVttO+t60cNji6DKBv6yNtsi8PA0iS6iT9Xm/Y/n68xCE1Le
	 2i0nhjiB8FmAWmJa3AyLKYPoB4TEK1w2YaQa/W4M4gQoEVk1gM1N7LX9vcMmPINAin54M
	 8z8z5GJ9l9nJd6fcIZSa9JTCR4Kg+jBIEy9HTp6PuRLqNmvFGhxtvj4VDqVNtMWdS6zDT
	 B270utFNVxhnJh4LmrpIfvRetZC5zXlZSG2JM9d42C0be8Yr5UJkNuXnm3Wm6GHdKRA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793626389;
	bh=eTgDgmyrr5MZNNsP3/IwqDndop4cXV0wHfvgvcsif/0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=shYTXqwMuKpfmuH85QdfcB+zZm7HDn+AwIIVOIlP7Ii4op/ZirLjInJO7r8SzaaO3
	 FHKp0egwwICPGCQOxd65sfa/OK5ZbksYn2x3Xurdb+q0cDE2JIG+NYDuooSliBr5Ro
	 EA0mL5p+JrYf+sx77I/oX/vxgcbvy55ZM5JFh7Evub6q13Jo44pEzQh3Swo3tiY970
	 t9V350nMFfekAo6/XZndyKnoApPtdY9VWdHuGgdZz1VUZq///Bs4VKJ90bXLttvH+P
	 SrADitzF1QEen20WD7l0TyzbF/ueKfAZoqnNA2o7i8MBgSw/5KNQK8wU/tKiFW1wFU
	 TVtT9GFelR2uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A1D160658;
	Mon,  2 Nov 2026 13:33:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4771A411
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B54A660661
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id he8OfVb5ag1g for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 13:33:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 718FD60658
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793626387;
 b=ZWXSTIg1OmG1lXDGsec+YvRIOLcYfSjpAPkl7HD3Z+5ANNyaJZsVFVQH/nR6/W53CSGi
 llVyS8RIlYoT2xAKTS+0/o916KgyjMrxHXs59vXfS6GF5KuSX+nKiOiuLZqAksFEHjF6i
 Vtl9WFA8rQd9Jez/PTnu3Jm/3ySGGjC/dKcdFjYBJlNQrC0Na1YK7Pmrmznd3k3P4/xrE
 /iZ8TzNyCNLcthgiIDlWi1Nt3bAl+BZXxI/tton2ZyAYABl2tt9UJgeKSioBVUih65Wjh
 fTW0Iot8jSxUD+2wcDlhWJdgUEtOhnr6U7NtqBhqMi2G/ZRnOjRyDSjyPzq+yV6HZww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793626387;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=TpuiwVcU9PvNZxpTPFuEeyMdvR/BfU2EWzCbotM5rp0=;
 b=nrqUXyqb5fGSmzk1wENJyQXAhLy9cXsENokYwzNuT6jEVUssNy54d/wxNssLM1xeuYBR
 gONVY5MO4rCesyFA6vkrjsgVWhRVgAZFjH95Ksdpexq+QzSQmiH3ebr2jMqMRg+fydYx+
 47PtcDpIordxEwrkTbxNQdNso06bqcmocA9kb3OG7C2vOwxYA5EuMHn1ZIjfLL7v+iAd4
 F60MucK3XUgAiAqtjsI67LX8sL710wdkgoGz9TFa+yhU0DBo92zqJTq3HyeAu1ZUMj3MN
 b/SqnvA83j1qVTrumGkZO6ks4vL/mrVkL+K3+k9YxhNqLbm1/9uZohPsZYjmQF7kx9Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.net;
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=sEeAc72A; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 718FD60658
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:33:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgNct-1wsewL3of1-00oTeK; Mon, 02
 Nov 2026 14:33:02 +0100
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 14:32:59 +0100
Message-ID: <20261102133259.214060-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:wPex8EEvq4vS9L1UXxra6mlUQa4PfdQAqxOWhAcBCN+X/ZA5K6d
 4u6gU7rNSjfLTQy3KOApQ/yEr77hUkJfSMW246tm27SdGlxieNfkkDO4LV7kiy6aCRDehLe
 sdc9EDCbxO1ipq2Bdip/MRKc4CphYwBjzJCz6/oE+oFVGuRAcFExrZC5PKDqNzIrTdAMo8y
 +MaSafE59GhYRx4rsrBIA==
UI-OutboundReport: notjunk:1;M01:P0:c/l9y7QaF1I=;5Oc+vinWpBwCDIdNx2nL0TGteQb
 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
Subject: [Buildroot] [PATCH v1] package/kmod: bump version to 34.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

- bump version to 34.3 (for details see [1])

[1] https://lore.kernel.org/lkml/auSsJsiiuE97DA_M@rpl

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/kmod/kmod.hash | 2 +-
 package/kmod/kmod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index 032f96adfe..c021efc1c7 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  5a5d5073070cc7e0c7a7a3c6ec2a0e1780850c8b47b3e3892226b93ffcb9cb54  kmod-34.2.tar.xz
+sha256  985554de49c21a58abd68c6cda2251384e1e5bb08b3b14c7f02b51f4c90c2958  kmod-34.3.tar.xz
 
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 4bd64f8456..a42b6daada 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 34.2
+KMOD_VERSION = 34.3
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
