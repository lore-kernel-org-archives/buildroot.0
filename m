Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31576C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE704813EC;
	Thu, 24 Sep 2026 18:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hf6RfLwD0Vm8; Thu, 24 Sep 2026 18:59:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F1C6B813FE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276347;
	b=gN2FZDmImnmISsMMkDBjBRknRn7XUDXCmRL3848Etjc6x9QrpaXKDtbQqe1aWjP7kFSf
	 Rmu+cwmayf3ASPH9sL52rmI8IvvmQrT/YAYe6/JSBIGtbfutJpiMEDdbHbIAlooRVbgI8
	 n1RpqI17pLx/5xWKqenHWlpIhI13QcR02y6V4RniHu8v/2utsRhwKhX64vy96arFsoTxp
	 S5T+2E3K8drSiZXFu5HdJMnxTM43A0qu7l6db5/Yfm6RaO3gU2RPU4UKzmFN28YBe8WSk
	 r6M/yCZaaTYZPcPPUkqU7JAQr06ILltW1TKOsjzt4G99Uk5TktbaJ1kiRLOZ79MPZCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276347;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YzvBlzP9Mxxrv1CfUWjlNU2c3rCm8UsQ2lnQ8kDEFPM=;
	b=LWntCrB3jamVXUlC4sPb8Zdfwhr+22+cZcWbgZoKig109ce49UR48PtxSfS25+7TYF61
	 LbY3n4c0mm9BQAWg5lAo4PrVYiqNr+KTponpFVw3C7cZjBrD8StraBeqGR2Xb3rl9c5CY
	 pCHV4UGWZFNvtKodLSQt51B2DHe8oLZG2r0GmHymRxWHUl/9E2auTx+MKU8oidH0OODfJ
	 DqtfuXL9RUKNlFrQpwTAR/KAPE/Y94Obp3oR2zlDctpFzdgnXWORFzX8QilP4hxNZky05
	 rw6iGW5g/9q2p7ZiSlbFJcl2r8Vmy00OlilNrSg17rqvdOHWdXzPeeK8l/Q7WmaVjig==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276347;
	bh=YzvBlzP9Mxxrv1CfUWjlNU2c3rCm8UsQ2lnQ8kDEFPM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MReRWpyaCrB5wC95SCLG4U+Jx1p8X7R4PzXccscmSA+NNJ9Tovbm8UXzCma/K/gVV
	 M5giNmyXe4/uaTb1Kz7+RfuQsPNRS+Lb3MZJAoGIZ8pDRIZyE17vnAe2eP7Rkl2if0
	 5ymu0jkz6tE6D94Ggs564r4l9yFG55J3o/KLDsWI5b+lGLb3V/wOjRxuw19pWEgihI
	 5DOq7Xped83yE0OdlQuKhZpCrvYyVQd8KOJ7C4EbjZRnRRMRLzyoSV7Y1RLT2aL675
	 fKHTrcrrgp2WgnN8OVIcdpLOc8vJwuYDiJgWYV190eiPUdOpDEVNfcxm03EMpbvn0v
	 Rx1YeGNcLYPBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C6B813FE;
	Thu, 24 Sep 2026 18:59:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E49E7332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C89DC8121E
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UgTG8gsih8zc for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F39E181235
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276212;
 b=Q4MqWu0oC7dRHPqau9huInJ1or3K5UGT+w0qQEtXVEFgRWH6VqFEzvxHiHbvFdX8vOHK
 EFifzL+rtg5qKvHkgDWmvYe2Zj0HK/QfnDN4wRxtuTNVfN8SaPghauFHH/hrr38i1nJj1
 j9oWQgyqxiMWKHz3vm0dPXxxOR2smJ2mFYUxGuJZtUXfGg53zpkG69l5v/WiKsKWpOO/8
 YP3XQiMr/EYAO1Z725aF9m9L6cCrI3YjY5XRBz/2z+GXF12gTW8AusNmVwW/sCRo7muYq
 JLVOpjzzkAxcPgYSIckAeS5oxV91kChDuSMFFjrRgy1zGEhM7CUcVgXVRewQOc+INlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276212;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fiB7ZMMvXd9XuDGv6SoPVqFXuIE4xi8Yh9qkP0/yyeo=;
 b=Q8rzngIMmd1xs0NoKMAQPs9P4Mip4uTzMGi3B9RwO4elsHk5dqScvsdycFMM32HaTHUD
 eJ174EvlLsjv0jx107JMFd9/YtiBwizzFam2Pc5tYpUzZSpIPCTGkNtzyaBV6zVlGMu0F
 4Cyb9sJO0otGaKc3kvh51uRDfxhCpoXUwK8SeZeCkHKKSU3FxGO1JCKUqDBLKHDifaKnA
 71rSFVafiyf92ai9gUA30INMjfTXDSbyjMWWU0Aop6aY1Foa4kipaJPj/iGqRZKUD5Lax
 6+duiOoE50rJgPefQdYq9WT+kHBtA3lLxN12SQdj3Me27RmFGYvem8hmg7dmkp9Pmnw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F39E181235
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 971D39832E; Thu, 24 Sep 2026 18:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:14:02 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2e5b9f12fa07a186bab79973cc3a1467b966150f
X-Git-Newrev: 93123f25f3da4db2200146e65e608ad525288893
X-Patchwork-Hint: ignore
Message-Id: <20260924185541.971D39832E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/bind: bump
 version to 9.20.27
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1198319804171149020=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1198319804171149020==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93123f25f3da4db2200146e65e608ad525288893
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://downloads.isc.org/isc/bind9/9.20.27/doc/arm/html/notes.html#notes-for-bind-9-20-27
https://downloads.isc.org/isc/bind9/9.20.27/doc/arm/html/changelog.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bdd74f011f88fd1a3d7dc4c2a93a54ed7ce7286b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 36ff7b2d0a..2131f51978 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.26/bind-9.20.26.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.27.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  55248def0f870c4c46b3de72978ea972615131516663188a4564dca1d20bf350  bind-9.20.26.tar.xz
+sha256  145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0  bind-9.20.27.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 172bbf79b5..2b42e87d62 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.26
+BIND_VERSION = 9.20.27
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES

--===============1198319804171149020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1198319804171149020==--
