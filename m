Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91472D3A690
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 19:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 584FA80D67;
	Tue, 29 Oct 2024 19:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYPXxbCjM85E; Tue, 29 Oct 2024 19:04:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7506D80D54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7506D80D54;
	Tue, 29 Oct 2024 19:04:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDD9C494E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 19:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDAE480D5F
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 19:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTPkwAjmd5Il for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 19:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DACB80D54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DACB80D54
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DACB80D54
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 19:04:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.116.191]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZTmO-1tKjcQ2SwA-00RH3x; Tue, 29
 Oct 2024 20:04:36 +0100
To: buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Tue, 29 Oct 2024 20:04:20 +0100
Message-ID: <20241029190420.2381778-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241029190420.2381778-1-fiona.klute@gmx.de>
References: <20241029190420.2381778-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:LRh/T+TmQPQANQDQcu8xCLk1SCIG/ytY9mvjW3MM+M2ODL45LjB
 gKhTouWsVjCfaSVqywmLIiRnXfkaMnQNdxEvPEkMzQ6fOqgjfCq4Ejpl83ogDTXWk65pbjb
 hP63i97JlbgRE3f4WVouhahxODSHd/RxrVLEnHwYY1tJ1kJIBThaeEz5E28iQA/i43s6dFC
 OT8USMlvScJAeAclAxckQ==
UI-OutboundReport: notjunk:1;M01:P0:A9BQS/t4UV0=;V5x0mkwF/UryHP3+VgMk9vtjECm
 YcOq3GDPUFPKsydl18mMxotvm0k+qVzEiqbD/585+Jw8//9kOXtBN5plYZcHvwrDE1lYXbPOh
 1KWesH58ZqqWYKFz9SHfMOOhH2ApIzl0d0WArPJEODHKS6LNr6ZOy7PbzKNnhp0tLrjKXDb2+
 cV5ETwpMHAX4g77Vjoyf+xHe6tanksyn2rxwZnaOqqMgnvarsYf4oOQfBCWrrgx8+v/JCFeBb
 qF+rCVu40hGLnLf3co4Flm9yhksiyBuA8mWxmqBn8RuOb2JVicbswV/i6EgtL6cGNP4Izgavz
 n8xG2uDPXiBMTeZNeHmGuV82mvULRQBv9tmFQWguFAi5vHwqjB+5bbRl/v7+HCo9JJ5phfBal
 AqYQntO0RtSwO34hIcsfGPjKziXo0vxAp9/uw3VuWeTme+OVCWCTkLoqfwJ1roWrzLTSP9y+e
 lgg3vwj11MYsp27RXO/2/SIsyyaAZoKTzP8h7O0xY+8b00r5Gf9j8+tTAdYkfGVdY3AVoV+iB
 9fsVqALSlDuvildwvpgfCneN317zDqx5xUf56cjIWxP4Lr74OyNOlL0+YWOLphVbmGRQhewcd
 16AvcYjJdjSX5+IPfFWFlVZrvkAqsQ2nSHz/Ox3W2A5FPtJByMuX/eeiW3ipPvx45KzOWbvWm
 9B0l+GVfMmTv9Ioou7ZVa2lvbFp0/v4UFdgdu43uvrSiRQ4WirHVzTj0Co+yPdBAK5Vpqy3qO
 Ad7OYYJkAaCwuNFxB+oZ6PcK3296fj/LJn5t+Pf7HrsTXXV1unEFkxDyy/5Z4Q2HP83erxQZQ
 gcD8cZJuZFdf0IRSiEHwbK2g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730228676; x=1730833476; i=fiona.klute@gmx.de;
 bh=RiTGRWxPsIwCutziQNJ5Wofo1fWZR6SX8IsJyJpVrBc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rlpzYlgp2rPKRTujXvG58mAbsKYS7gA3m7VEMYoL9phTNymRGVlIwXou4lEqVsrm
 NQe4mZi5erTA5ipjGlhwh5ZRDXo6HFQ++BgmVbD7uapDrnXusVDyChduuCUmoH0Eh
 pVcVKkuhvgKsXJn0QVMI/8MnctQ28NyrSKtfcXvt/ZfALqeysXBPa3QdBYynCcTDF
 FcRkpqAlvjKtvKWGb6wdjFONsQeXd0h4N3hYAiTREVpTgCyvjnoZ/umyc//Awx0do
 SwWQtOawXD5M40v1+zO+grVfOdJ+GdhKzjH4iauaefG+7cXz33aHmBIQIkWZ/M+gT
 E7IjTu/K8mtiBsSOAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=rlpzYlgp
Subject: [Buildroot] [PATCH 2/2] package/openssh: consistently use $DAEMON
 in start script output
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

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This was already done in start(), but not in stop() and reload().

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/openssh/S50sshd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 7e5ccf079d..a5ff385acc 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -28,7 +28,7 @@ start() {
 }

 stop() {
-	printf "Stopping sshd: "
+	printf "Stopping %s: " "$DAEMON"
 	start-stop-daemon --stop --pidfile "$PIDFILE" \
 		--exec "/usr/sbin/$DAEMON"
 	status=$?
@@ -50,7 +50,7 @@ restart() {
 }

 reload() {
-	printf "Reloading sshd config: "
+	printf "Reloading %s config: " "$DAEMON"
 	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
 		--exec "/usr/sbin/$DAEMON"
 	status=$?
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
