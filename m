Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6762DCA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 13:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F12960622;
	Fri,  2 Oct 2026 13:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwCmWM9FOMEr; Fri,  2 Oct 2026 13:58:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0164E60894
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790949534;
	b=IGv0NIyx5w/J3XV6nqyvxNabCyMJ1u1oLGIGllK+Bc5D/7ftCaheCynScctrp1grhlix
	 QtGqctBrBoRAGWqm41i2DTZDBi0Aj0TMGrNONr/6PQ4nMCOcKx9l40QDN6yhFotacnH4w
	 qkQE3VSdKFRPAjUwxzu5z4hfVXs5ouibkDS+FH0ZzSacC1bn4l5sfB1mPnoXpgmr/I3Ic
	 vNm19pwUBjYR51XoedgmUKOG9uC84lmodgt2NYkyKDfcRjShNI+8vQ0b1SiM/99raRDWk
	 yRtcROzIinl9LKhbxmfIv46Hp8gxxunB1LEX5DQcreNIPBa5iiqMqgoQ0O8uuNfehpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790949534;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HSgg1hGPEKDkEVBccaEpxfeXilSMW9kFtK7eSn3fo94=;
	b=efB+uTqDA8ENd1O7APrNaebje6Os+xxbD5JgwoEYT0QE3PWl++vO4pbzMxwYOQoRE3H6
	 7rwIxoIQq+ZXuJKxSGHqbHiz9p9GblqVxM57uUVmuzhmkKQTRGbf+IyTVQNmueKK6CUTk
	 fJeG+pC4b2sLodya9LEZuRopbA3gqqQRu+RO8a5InNK18oqMGeBdD4m0wREqkPrY0Hp5F
	 eXZnxn6nOLzPw+SYqorY1tWIaa34FnAGwUM7pQyAY5mb6Dw8UeuMzTcihXJMqptqn1xMS
	 mIVM0inJMVqq5H0dC30hsUp+VNl0TAbHez5SKBfxkwlEIbIZOhShWUVuJ66knn8vcnQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790949534;
	bh=HSgg1hGPEKDkEVBccaEpxfeXilSMW9kFtK7eSn3fo94=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=DyEeRUC3Fr5i5srqAJ48OML49w4xCXNCDXeLDhLRZe9KVgz95MtmdNMrIzsSQ07st
	 kv7XO8v+PNmLb7nlbvQAcLDk3Sr4mH/ucGwztM5npB8OiFsLlAAi9ZT80sbxkXNCt+
	 lGdqZzvY3bgBzmX24qNXVHhPUG0ywYTZWIZZdZ2RQnf2N8Tbw3Eby48VqCqafK60Pt
	 6CyaVZcUzZoo2drWADVAHiFxkIkMgRaPqdFOAK3Hsz0rBfXcMRHKWlReQju1zOApvT
	 u9NzEDXZQliAt+bebNe2Tt1ZPJk3u6jvt1Bcov+4XNk+aPgKY3RIKrfPhcvX5Gf4nH
	 fCDSFd7Fj0h6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0164E60894;
	Fri,  2 Oct 2026 13:58:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 519A7435
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 13:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43070404F8
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 13:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxiTdPZ8nMt2 for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 13:58:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CB4BD4055D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790949531;
 b=bklvfREqp1xE0LkH56+wZsoconLJHUG7dvQJoHSiGKJTRL2dBTxuZiQDWaYX/esJQYQu
 ev2Ot8R+X8NGS1bQxJw6WsmxkLQRRLmc4z0IKvwOSfkLioe1ctIApJFkA56vKfFEOGHSM
 F8flu5UmWdFoMgYJqwdhkbzDJ+1UnhQpf4gZGVg7PqvYrh78QMui8iWyY48mTV6Xoojlg
 bM0aOqXh9aH7HOb3pi5Pv5U1WHh7+gC5ex8sMz5yY16WvCpXuRZ5oEqqhtCrV+4Pr4hAK
 5S7r7OBTVcvtTYsrAgL8AzM89NZpi7CQr8NEY2eJFF3QAQWR2iTslizWmehbsDBKX+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790949531;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=MazkNiZzpaJQ5rut1i7pBE+Cq2R/nLwMis+3ODhlJDQ=;
 b=JDXpLfGtRQIgeOvMgqpAlC6Ga64PJdHWyj07lMsldTHlG32yv0CYn5x1EzGbb/PYQF4n
 SlibuCxw19F86I4ANPq+hBDbGJDO3/rRhtRnaY/BiJ0eo+vKM6KBrHUvODepCM0k8D4Yv
 gnfZmoPIKf9thOUyxmiNQ9KZlbgLBgtknyzmBdtgkin1Ebg7IcrXWQG7kSfIJAXAgur7K
 vzG5rGmWKEClRhGuSLdFyoQIVx72m909RKpmcgY0x2RM+XM33Z78vHJsUA8r1R1AeJ8u+
 vdfoUli4dqW6dosIjrWhXQ3Swh5cYgLH0G9a+KuRfu9mwzBm1cLq3f+nHWIVPss/Wgw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=q2DK1MTO; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB4BD4055D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 13:58:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4QsY-1wkUn817O2-016YWN; Fri, 02
 Oct 2026 15:58:32 +0200
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 15:58:28 +0200
Message-ID: <20261002135828.353207-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:b9AyE7Y9chMxBIngbTuZKcF4SqsasFuJ2VIeNr+jKxWKwfgk9y/
 HiHvE1KFpBbV8aK/3bcFefeA9JlkAShpUDlrjQ5fNqc6o8/auC4INLSPbQx32V36koAW5lm
 +gY5NzmlftprqrSMPtXjHIjGP7mRdWTqpUd2wbOIxVv+3UlVh+fhFC3EDaTsDkHRJGEjukw
 4DgzU3cxkEMXlk+E+IgxA==
UI-OutboundReport: notjunk:1;M01:P0:4nZVF7fLiHo=;CTsclvLP/VTSUTXK54GbVSbQwFM
 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
 iQxUtWTcptHFa
Subject: [Buildroot] [PATCH v1] package/libpcap: bump version to 1.11.0
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 1.11.0 (for details see [1])

[1] https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.11.0/CHANGES

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 87cc77338b..37d2a7553e 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.tcpdump.org/release/libpcap-1.10.7.tar.gz.sig
-sha256  0b394ac90dbc0a9838ff97468e05c9c9a3e873dec2514cd58db65d859d296e31  libpcap-1.10.7.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.11.0.tar.gz.sig
+sha256  596389bc8560ea027dff9db8aaf6c173d992366d9aef4baf5d7c6d180b4d49ad  libpcap-1.11.0.tar.gz
 
 # Hash for license file:
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index a501ce2962..615ec9e251 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.10.7
+LIBPCAP_VERSION = 1.11.0
 LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
