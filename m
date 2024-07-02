Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFACFC3065C
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 16:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F756410E4;
	Tue,  2 Jul 2024 16:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RlMw05vrJOG; Tue,  2 Jul 2024 16:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4D9F41548
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4D9F41548;
	Tue,  2 Jul 2024 16:57:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2E5F1BF366
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB6E8414DE
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKxflIDuNBWH for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 16:57:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D870E4147E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D870E4147E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D870E4147E
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 16:57:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.121.108]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZktj-1stEcI0Rjb-00YI9M; Tue, 02
 Jul 2024 18:57:21 +0200
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 18:57:08 +0200
Message-ID: <20240702165708.3796162-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702165708.3796162-1-fiona.klute@gmx.de>
References: <20240702165708.3796162-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Bmjo7e0vkaiXmD3Cbvc2RF8LxZb96cH2Xmf9mR/aNpN11/nn4qr
 1iumgo3Jp/FYezYxnjfjX75jP125bkw78dh/AEjJTC8YlHG6FaIfgersVt4UYDlLzLYkGcg
 h15I3MX/WajN/WA0DXWEh5OwlaTbMNvA11Hdbm5SMC49bs6FltD8f6s6GP6tX6fV/uO1vLc
 r7m2bxzaDCEnE01njVMOg==
UI-OutboundReport: notjunk:1;M01:P0:rSYx9g+D2tQ=;Y/LICorR+WAYEjjmjYtIwALah3k
 Mn9MwJg7MkppiL6KGaSDXVUm9xNRZoN1EB56Zqc9pPHGfVUj4r/BaBkiOn/JTxjIXFFkIkqNT
 XzLN1FM2Ln313RDM20tucIf3JdnMRu5/mqy/bLqrHeSz0o4/LNJnRdrZQ6Pz+mXn1u7+oDyS8
 9EOEQzDB9AVgDJMzcxkkYuGCLwGPaGcLOb7fGW0agwt2sjqR9rzRDVaKPcJ7+LSx80v8pSwSD
 mHineGH98lAk8A+i3kqyzt3Av0hasLyMbVl7U9F6VrmPj1RUDEbd3ZcrxqaK3OGaAYDuhe9gF
 DGjrIZxfMAZKy7TAz1j6pqhh8yaClFh0pEb4Hx+Ip3lWt6+X0FPvj8zYYyEtdRgedhNuKzsWc
 ANpfUrgXGHG/7nq/qvPHB7w/bYB/upsp7+qQz+/FZtUnPnb45z7XhNQ4DTJhlXJNPdU+oByeW
 2PQfILcHhc62HORuRh4lHeqUSvdhp0pMZbnSCV5uGo63NOWtWdLmzWvXNihAP65aehcM4eWyq
 lmDyBka87yYJsBndtLP4uwvPN4pdl8cOZ3xS4HsCx3dpqBuoci7HtdD9kdK2qXY0CW4TRd/zv
 aXLRc9Ctu5z9l42UJk2eUygK+PhE4litFyy1xM62hCe6gcBbFE7IsU7dgyEAh6yIt3CtjG3DP
 haXWlBtMH6qRkg3ydffKB7vLfMG7Q55cMSfj0GezLzRWx/8B5eAQiDBe7W0hw05YsCkDHtvyF
 6631ILvlCcCqQsc8sF9a/IMExEYy8pEjWCRo5CklGGh58fQckpPZ1LOBEur2BcM/LAaMbcgd8
 umIBLKpqrQm7h9rVsUnXIgUjfQlQXFDXXEIzhoFwt4M/8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719939441; x=1720544241; i=fiona.klute@gmx.de;
 bh=P0tVKq83+h9DRMmTDmsrjZa8hfBnJbi4VbPW4k1MCvY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=h+9KtaKnppRnVMzervjqkZy6jre5zNU4LGYO9PGwTcX9pBeUDLdY7qCovseosvgc
 NT7ZxgB7MY/zJU+j/sq8xwCy510co6r9ZAQqpZCaog8GwizAHcgDDXkmduySk0k+s
 tX41s7IzevfVgLu17xRBQ8NarYu6w2CrxN+bRW6C4MSfesCzaVMmYdXUYIyN03acQ
 i3HnziEOkZ+PVUi73xK+INALWKpaqSJN6ttGmOZx/q2UdaZABk1DwOXVxcoGGj5Me
 k8ZHGOo1PyYViZQBeHfKIsJH1uEkA5/rz4CwqGZUnQNZI3lK9VgkxANBjfJpNsSyv
 q6jQ7RSdq1W46jCjzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=h+9KtaKn
Subject: [Buildroot] [PATCH v2 4/4] package/openssh: check error conditions
 on "start"
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

If there already is a running instance a new sshd fails to start,
leaving the old one in place. The init script silently ignored
that. Show an error message and return a non-zero exit code instead.

Also check the return code from sshd, without the check "OK" still
appeared if sshd failed to start. Now the init script returns a
non-zero exit code if start fails.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Check sshd exit code on service start

 package/openssh/S50sshd | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 87430bbec8..a677327378 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -15,8 +15,16 @@ start() {
 	/usr/bin/ssh-keygen -A

 	printf "Starting sshd: "
-	/usr/sbin/sshd
-	echo "OK"
+	if [ -f "${PIDFILE}" ]; then
+		echo "ERROR: already running"
+		return 1
+	fi
+	if /usr/sbin/sshd; then
+		echo "OK"
+	else
+		echo "ERROR"
+		return 1
+	fi
 }

 stop() {
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
