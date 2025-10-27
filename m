Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8F0CCF9E5
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 01:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7198E611AF;
	Mon, 27 Oct 2025 01:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9aO_uKFYJr2O; Mon, 27 Oct 2025 01:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F0FF611A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F0FF611A8;
	Mon, 27 Oct 2025 01:42:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD9D3D7
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 01:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B90E24062A
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 01:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oa7pzoqfUQ7h for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 01:42:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EC7F40258
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EC7F40258
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04:e001:324:0:1991:8:25])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EC7F40258
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 01:42:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 049D76025E
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 01:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22894C4CEE7;
 Mon, 27 Oct 2025 01:42:02 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Date: Mon, 27 Oct 2025 03:41:56 +0200
Message-Id: <20251027014158.865598-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1761529323;
 bh=O2ACYCbUevBz3Cn5Y4BkTaqMa7UYjjYvzvmKUmoZhy0=;
 h=From:To:Cc:Subject:Date:From;
 b=YkkfBiJgNWBpjTDZPmI/IaDttPw3W+ds4UVUzvgocg23m04m1nEdEvWf8yzTZIHzi
 OEk7M3ZKxrPkl+lGc7HtMCwxovAWi8ltETuP4fN+MtqQdXg/uUARlZ7vZxm6O+6oxQ
 VS8Qkmw2Hnvw7R6ycuFZesZbI/wHVWHRfYSaTCiMPaaLJRYmIgSXFmHy7KnbC14+rb
 OAkLMLaZL1N9idh062SC0qfnLnJuuw6GjuoQHpcU2snvakkxKyOFXef1+AhlLH19Pm
 itZbRaQC6splx32w8jwbOcmKykURkBdIbUNWXyCynEcztpXJrQmrFQhU84KVEXACwR
 k267k8BCzCStQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YkkfBiJg
Subject: [Buildroot] [PATCH 0/2] Bump libtpms and swtpm to version 0.10.1
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
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jarkko Sakkinen (2):
  package/libtpms: bump version to 0.10.1
  package/swtpm: bump version to 0.10.1

 package/libtpms/libtpms.hash | 1 +
 package/libtpms/libtpms.mk   | 2 +-
 package/swtpm/swtpm.hash     | 1 +
 package/swtpm/swtpm.mk       | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
