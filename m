Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F32DCAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 10:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51F038114F;
	Wed,  8 Oct 2025 10:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4wRXx-pSxuM1; Wed,  8 Oct 2025 10:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A4268115C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A4268115C;
	Wed,  8 Oct 2025 10:16:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BB84226
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 10:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41D1060D71
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 10:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dM9CkL_-q7q7 for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 10:16:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CEE5260D5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEE5260D5F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEE5260D5F
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 10:16:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.21.12]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbRjt-1uZqI20faj-00o4dK; Wed, 08
 Oct 2025 12:16:31 +0200
To: buildroot@buildroot.org
Date: Wed,  8 Oct 2025 12:15:28 +0200
Message-ID: <20251008101535.51154-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008101535.51154-1-fiona.klute@gmx.de>
References: <20251008101535.51154-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:uUs8qFzMX7N4BjZ5XEtKgcwefxzanS8kZ5itdcCM0A/3ni5DYTT
 ZqrysBu3vqHHbvZfwz0tSf0X9QEPbbVu9l04NuGrWUJydoR+n8pai9qI/yZY7J3sqaKE8/g
 ERoXNb8cnMtE0MjmJyXfbkm6/bf6kafPiXIbCOZwIccIM2CaeSxjxdvbuvb7Xv+yBwPB2XO
 Af6Ys9BuemmdAsieUzmbw==
UI-OutboundReport: notjunk:1;M01:P0:CdIFh87L1mc=;52q/gMHM1a3Git/asP3fYNRnrbs
 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
 Hbr8rF9SkJrQgKNxHCbd4cnkgg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1759918591; x=1760523391; i=fiona.klute@gmx.de;
 bh=X4h8839t1MpmwDXhs3WOEPy+oLkisX3k4uWdoO7zXXM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QO9GE6+Kz2hxk989IWMm+RZnU1ynqZb1OIOpfszCs63QZDljfOrwPkmeZ0/v8Qiy
 2WTu7XUu4Pz2Ny+iBgMeipt3Amx9kUOnVwMdGx9E1mwo4jdSKr8H3rFtoino6Dz/l
 tGmc4nu5BHEeFHfuFHac60A1qpppqmPS5XqkP6Y4W3LVdUe61GFPk1e9hXdtxcZVi
 aal8R4rox3NVDvUoOjlfVOeXscfEhyv4t21+Sm9VTEGPWV1rAVjvasaEMUHBqCdoF
 mK7bX+KTG1PX13ltoVIKNj35AaYAtgGdQlgyWb1OZ4FHsXWecbFfDy62q6SMkgTcv
 U2EHoTI80mlJ5G5EfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=QO9GE6+K
Subject: [Buildroot] [PATCH 2/3] package/audit/S02auditd: fix path for
 default rules
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
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

/etc/audit/audit.rules is the path used by augenrules,
/etc/audit/rules.d/ should be used for snippets to be combined into
that file using augenrules.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/audit/S02auditd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/audit/S02auditd b/package/audit/S02auditd
index 97c43bc66f..a660ca921a 100644
--- a/package/audit/S02auditd
+++ b/package/audit/S02auditd
@@ -28,7 +28,7 @@ start(){
 	status=$?
 	if [ "${status}" -eq 0 ]; then
 		# Load the default rules
-		test -f /etc/audit/rules.d/audit.rules && /usr/sbin/auditctl -R /etc/audit/rules.d/audit.rules >/dev/null
+		test -f /etc/audit/audit.rules && /usr/sbin/auditctl -R /etc/audit/audit.rules >/dev/null
 		echo "OK"
 	else
 		echo "FAIL"
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
