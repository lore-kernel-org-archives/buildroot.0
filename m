Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B7DFF886F
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 00:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFDE085510;
	Fri,  1 May 2026 00:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CPRgwrEF9Nie; Fri,  1 May 2026 00:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED10A8550D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777595035;
	bh=vj2jtuMKDRsjLy4W9qByrDRMO+fUxPS5F7N1Y0HMOHA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mcFPhuXGzaVjdVOLlN4opATYnDZb3h/QiuQh7BmSH/5j/EzIMJCxApLAEGTWX770P
	 C8JU+p7Wtmhlt/Tp/JknWb5tsRQbw2c4ZYy5XthMnGeKmDGeQC+KQNFYLiyu7yHA1y
	 HdKu3ttSP0Z7VdwBGuLfOhHhqu8GHoVysCzozgmmbr1/evyPZX7Ns+lOI7NSlUb710
	 biFRgDWAMRscTzzUtnJvvK7vAxSEuANHCBSsWTzHpyQlxjr8ntjBDR2Gr7y2us7Qcy
	 zY2fYse8xN/k8/zNi9G9G8zapJoz+9qzZMAvzqt61UPTqZW/JP2RFGNVYmFGoxyFgj
	 mv2k3plGxokXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED10A8550D;
	Fri,  1 May 2026 00:23:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21DCF127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 00:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0789B8550D
 for <buildroot@buildroot.org>; Fri,  1 May 2026 00:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhTsWmTh0WSu for <buildroot@buildroot.org>;
 Fri,  1 May 2026 00:23:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D07348550C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D07348550C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D07348550C
 for <buildroot@buildroot.org>; Fri,  1 May 2026 00:23:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N79uI-1vHfK42gcm-00xWWx; Fri, 01
 May 2026 02:23:48 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Date: Fri,  1 May 2026 02:23:19 +0200
Message-ID: <20260501002320.1761716-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501002320.1761716-1-fiona.klute@gmx.de>
References: <20260501002320.1761716-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:DxxrR4yjYrWD5DGo8YBaEuMO+p/Hqf+XBmaW0wefxQH5UNEVU8q
 RYFP7HYt/CRSj3pQLsEiVpbpDxfHi3aKjFyFEzDbmEHEq/vv8yi1D+/2mJnAYUUWiGQwkfQ
 iuCBznsVmDwh+9Ub9krsaOWCgj0VZMV+whHakd5GeDUGk6CpI/tA5dt6HOJ5GAz2RobE7/w
 rw9AvigDeBkm2F6wrdUGA==
UI-OutboundReport: notjunk:1;M01:P0:U7iqSN8eiR0=;ho35/Z2B8eX3Dyb1D+pvi/9bkKJ
 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
 uGPUnsGcIflDMtEjCKfvaMSXuku+GGJxXS70=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777595028; x=1778199828; i=fiona.klute@gmx.de;
 bh=mCDpn3kLBcJbO4OZAvv2pTRhXjDEoH+J7/k1O0UKLP8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Xeb22JJKx/5j/SN6rwvCJF77bVlD1dxTxRKMG6GYVoFEwOiDPlXJPAN0wrmQ7lWC
 MdkOyDt38zNGliEwmZiQnzunyAhlod0lyuU63qBGBe2EY0qJ+wDNm76Xa0CZbMz7/
 IiY98iFyaW8q1DwZKpMhGAcmzOnwB8eZAw2L5EXH++KkK4RhFAqPfnSOHuXjzPeR+
 AXzzELK2r49YTFqk1hXRHjd/EtFL27KJCOBNo9d0rVMAQXfHFmt38QVxQXxZr3oMh
 eqcyfVX8MAzF6ZEbSyJFQmc826oZ1roXHB0rUGEvf46+dJtrmCIxKUV7e6O4n7OmT
 StFMutwP8XTKwoNvsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Xeb22JJK
Subject: [Buildroot] [PATCH 2/3] package/watchdogd/S01watchdogd: immediately
 return if sending stop fails
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If sending the stop signal fails but the PID file exists the following
shutdown wait turns into an endless loop. Avoid that and return the
error immediately.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/watchdogd/S01watchdogd | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/watchdogd/S01watchdogd b/package/watchdogd/S01watchdogd
index 8f811ac0fc..316787c2ff 100644
--- a/package/watchdogd/S01watchdogd
+++ b/package/watchdogd/S01watchdogd
@@ -29,6 +29,7 @@ stop() {
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
 	# watchdogd deletes its PID file on exit, wait for it to be gone
 	while [ -f "$PIDFILE" ]; do
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
