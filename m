Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AECC27C75
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 18:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E1740556;
	Wed, 12 Jun 2024 18:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcZx82kTcdcL; Wed, 12 Jun 2024 18:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 527F040654
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 527F040654;
	Wed, 12 Jun 2024 18:32:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5F451BF36A
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A19AE404EB
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qQU8dsGAJi0 for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 18:32:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE245403D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE245403D8
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE245403D8
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 18:32:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.113.102]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MI5UD-1sEQUL07TL-00DhaR; Wed, 12
 Jun 2024 20:32:06 +0200
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 20:31:35 +0200
Message-ID: <20240612183136.2145705-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612183136.2145705-1-fiona.klute@gmx.de>
References: <20240612183136.2145705-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:rt8vjjdUByYwl+KumRkLdUZOB+vow/FuYcuCMJPyYmvBJuYneOc
 3XNSSBHgRm3//HBd8MGZBqR6W0kQq/tXs+L6UrOlS/clL0LWG8it/WWOw9g3/KyRUNXDWIr
 a9v7w99TOg3j3srechmvilD2Kj7QiMjTKf1p2M7l/zMgxVXvyW1YJv6zrQJuMaX+cuCVqwK
 /qLkBjece3Fqpxiutatrg==
UI-OutboundReport: notjunk:1;M01:P0:Tw2NQxhNTYg=;ErDdFGZTHnRn2gcofxaYTZEhhTK
 Wn4MisKFciIorcuZ7mKg5nQnaaoO4/Zlrs7T+wImFT0+9VDf1wPpLAotwdVzR55wkUvOS637b
 r1F3nfdDJCY64L/uyHh6lj8Daykj9hVDTckXlC5wAdksm3KGbC5UHuz+e1MsWFy+gCiAZjLIT
 ipmmpfjDa2kiMNy3CYJGGUM3ypNwMSqSFonjY8j+Bqmu1mGcO8QO8B6ROmReruqLiUIJyPBlZ
 tsLV1oOhe5zXKq8SYWoDHaLFHmxPYUS+8waWQMV//g27GeNudbhF29wdRK4s1uj2amUXdjZ2x
 PEfd1r8zVAsuL8apzMrvut1ftGcsBPNZ5ccWwGhVncqNckYFi6DAs4dyEze4eaQhiTZiTMerZ
 o1nxYoyemWFNTWNIWW4UzqpxliCs6kD3WSjPilrtp40yGhd2MfQ3NJEpbcAq9hlHKFlwMfLa3
 qzkotZva+OBcFqtoxopD88+45IJeibNjyBzBHGTg1X24bOcNphJOLvqaKLw7ycmIzXJfZuYc8
 GK3vX7f7a2FJz+A1nlcemFOo1YMiGFv3ju8cVy4fpdSuAWV/g8IDkF5J9V0LkQaP+36IgEs5J
 RCBnNcYxeLk2kZ27MFXljOKcBRlk4JXAgBRtp/lvUHfs7VuuUkkrdYWEInzOMcOvsGkU+zlpS
 J4jVdus5lq2cxw7pblc/rYsaE2XED4/vvMewd6eehkqUDpn7n/Jk+eILF23NRxpwWJwDG+b18
 h9c2AKNZJUpiOFIMC30ydaByk9T4q/buiZw8Tms4vghTaS3jVAfE+X+tqFSIH6FHd5Zx1wLuF
 ab0bViJQkvHk4l5mmn3Sdj6CFqU5iCfldSY4nekg5dR2Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1718217126; x=1718821926; i=fiona.klute@gmx.de;
 bh=6KyHGqV3UPNO1u9pArJPQ/1vrqnnfUqsmxPgYf5EonY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=LOt3nLQi1sIA0Rqj1lCb5hBTVI5XLKGQXvzcWs9zO5qaiOFgzrBBGPpnx6X+ljAA
 IOTZ13OjyGZbHmnddEQ3NFAokPjftrGnuZLAI7/CfoDBCr0eI//3zPrC2CDqPBXRZ
 pXrqQdloTGWFmKxBPzL3m9ScsEiBrtl1nUBrSisWgHZkDwZqWCbdt2xcgrqJh6JUh
 2xynzzTfX3DNokV65HGGhTq5cI7AtgBBDmwbU6+Tbrs5yJoBjWYyTIwfq3d6dDMwJ
 mrxXAeVviF1jz4EE/+9LIHjUQXhqHODwcpIiQMrGTVgwIgUmivw8xd7ne6XOT4USG
 ya2DztwEr6Chu9/cyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=LOt3nLQi
Subject: [Buildroot] [PATCH 4/4] package/openssh: check running instance on
 "start"
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If there already is a running instance a new sshd fails to start,
leaving the old one in place. The init script silently ignored
that. Show an error message and return a non-zero exit code instead.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
 package/openssh/S50sshd | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 87430bbec8..59589bc863 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -15,6 +15,10 @@ start() {
 	/usr/bin/ssh-keygen -A

 	printf "Starting sshd: "
+	if [ -f "${PIDFILE}" ]; then
+		echo "ERROR: already running"
+		return 1
+	fi
 	/usr/sbin/sshd
 	echo "OK"
 }
--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
