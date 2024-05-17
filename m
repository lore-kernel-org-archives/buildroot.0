Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB5DC04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 13:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ADCD60664;
	Fri, 17 May 2024 13:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPkYCG_bZBSZ; Fri, 17 May 2024 13:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6693460772
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6693460772;
	Fri, 17 May 2024 13:20:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A514A1BF3F0
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 917386076D
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rv6w1Qa47mP8 for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 13:20:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 523AA60710
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 523AA60710
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 523AA60710
 for <buildroot@buildroot.org>; Fri, 17 May 2024 13:20:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 88CD161A7F;
 Fri, 17 May 2024 13:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4FB8C2BD10;
 Fri, 17 May 2024 13:20:50 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 16:20:36 +0300
Message-ID: <20240517132039.7124-2-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240517132039.7124-1-jarkko@kernel.org>
References: <20240517132039.7124-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1715952051;
 bh=7q+HkyVUEfN4qjoC4VSN2BMGCtRnCFi38aMZJKQEnzA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C+/ZDJlRL0d18ullVzfneqtLFMltwj/6utsLfzoxBHXKjDSTSDJzkXEy1oxJO5a7j
 XUKU8qsBMeKVDQiFEo2UPW0ABM7oqRIUw9XXrCP1MSUfUuEWaqu+LRpC2ahN733+Xo
 V7vXSVaCGyfMDskKNN2QVVtn08Sucs4S6hBSC5xoKsFavyLZXp8aqB+PH541mteoBJ
 sEU6kQBVuIq4bwasISEFZscyuzmOqxrDD2On/+hnHbJ2div/sGIMeT6LjdQryLutM3
 ojVS9VrlrD7yMnRiXC9PaIAO4UC0ZXf70EwUtbfMZgmDMPiGq0Nuxwomxj6+3YwSmF
 QLL+vDhkOB31g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=C+/ZDJlR
Subject: [Buildroot] [PATCH 1/4] package/quota: Update DEVELOPERS address
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a9deddb343..52c9b84a9d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1518,7 +1518,7 @@ F:	package/zip/
 N:	Jared Bents <jared.bents@rockwellcollins.com>
 F:	package/libvirt/
 
-N:	Jarkko Sakkinen <jarkko.sakkinen@intel.com>
+N:	Jarkko Sakkinen <jarkko@kernel.org>
 F:	package/quota/
 
 N:	Jason Pruitt <jrspruitt@gmail.com>
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
