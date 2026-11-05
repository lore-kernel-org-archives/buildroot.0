Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73B8606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 21:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CsvDSiuJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jDO/g2Ps
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 959B18119C;
	Thu,  5 Nov 2026 21:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRLK5-Kk1Hpw; Thu,  5 Nov 2026 21:55:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 340028119D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793915701;
	b=POhaf46gShmHomey05zn+4wu9J6rreZFUq7KtpTUhimCpS3oJnhJY1kHRfQf0e0zhsX6
	 rXH+RHQCR7BDxuEANLQ4kBPssAkdWbWuPC+jgwVGWjMdwgNqwmPFMG4QKZQtswRL5qXru
	 tZPs2rkft1nbGIqpv6sBId70JuXyHqIcwHo4A/60p/LtNpkwBeYYjWt59wRR+Y8wwCQvL
	 YL0bQ9WXIOX6Q4VYLAIbeOLmXsS18JCSuB5Z2v3ssRPdALFweJyz/fxER7Q0NFdzQbR6k
	 Z4w3EKxCLATOYCexaLFMFNgTx8BQRuSEN/TScYL2ERrx/EC9wt9D+TVBE5gVf2rGJSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793915701;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=knIxP2OSTcnN2iUZwFrFD3YHUm3F8zBf96GkEY4zjZw=;
	b=FMDNK8FXzhrip0DKYOvVsuYslSjUIBtUbn/x0WzM0xrA9ElxMUbBIgdIuj0iwtjknb2Z
	 M0aGwc+3flWSKtWzphsTXomszBfBSOZhK9/db5glLTeyTKxXzrkB6rh5SsHDHwcLm2iBQ
	 oM9efVlO+jY3EpQDc1tDLb+v3dgUGsMtC7RMDepi83hLqKOfZ7LtBvQOdD5uVoiV+IdKl
	 We2csKheKp9D08kwR2iKNI/0b5HonTT7YvQ+5vDfcP5gJ8yg3iRqRKcTzs2Q1NVOUugUu
	 t59IXXmqpYVKtwWWEaDDNjAPFcH8ITlZEnXOXEWT7u1oxvcmrK1PcWCWJjm3ikxqPcQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793915701;
	bh=knIxP2OSTcnN2iUZwFrFD3YHUm3F8zBf96GkEY4zjZw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CsvDSiuJmX/uSMWHA0P9qH7t8EWgRS59BdKnBCK2NTAttpzj6Ag3/lyXu7OJ2QNP4
	 PTkb8c60przUXg8NuQ0igvLKp6A86ttuZA+RXFcngEqEP8YMhLQxpOj8sixbBZ2Srs
	 JIXM76L41c9B3Gi+1t/j5clX8UvZVXhKA49SPWCkx/dkdeaCql8NljxhT4EMCGM5kQ
	 fou2rDMm9lOS4+UuRR5yYdMa/AJl8wH1zbj/kS2MLOQt6HfzemqUkOuKyrXBypfCIt
	 pD6kP8X+QBJeWEVN/5xjPUohBiUBD0PzEWF7uLiPQbseMqoB05xH7L3x0fIBKR2BWp
	 9kyozYnyDl+aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 340028119D;
	Thu,  5 Nov 2026 21:55:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CCF3CB00
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2F28408E6
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8so1_fV_Xl0O for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 21:54:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BC350408E3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jDO/g2Ps
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC350408E3
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793915680;
 bh=4JGfM6pLVP3qCs4NQ48JLml7bys2rWLovTV6uh6JNgQ=;
 h=From:To:Cc:Subject:Date:From;
 b=jDO/g2PsHQHFi0GEpPgCrmxXkRww/ZqQgluo0KVHVyUwTYaxNb+z+OzKrVSjQ+ENE
 Go405Bf/cKd99MGtYIT4y2hAsrVG1p/Jx0AqBVOK2+p/Ia4bjAoHpfnsZkt5TH0T/S
 fB0Pg+OqrVwytFlG+zjN1tn5HdV1l7oC1ZUobsp0RVkXmAFjqP1iYfU93F2HNdGb4R
 Mc1SAFSpDIa4vxKZYjoykRlbjK4AdfiNKek8HtNBvfUWgOwIkMThwWzYE4h5tBFqyc
 zyVhFhyoPUVsCvXKNSpH7+8T9gl+sDWs8ly2JyShAPoIdqUBU7m9QT3HYWnKC20dT5
 m8Xj3AV5rxz0g==
X-KAS-Sym: v3:f51bdf72230551df:oBFdRS2G8zfHBKRj6bG8Ba8AHJg7PXKupIQoU300YtD6J
 tzNbxyL69nUvBs0dh9dS989O1obLAFF6Hdf4ZLvvNkOyCHBtxzmxbHsHJBRDGOBayWkDMwH9NDD
 LQePK7osGqt2/g/FFH5/ja14WOBlEiEsA65gV8U/TFcLU/BUSQIV5BGXWlamtlPQFlpjMtWmzeN
 hO4BFtEMIEZ9r0iQ7LMNU5Z2+bNVKkVtYsbJxkV5wyr6okmE94aIwxIuLG+ZI4v+xmGRMuJdvmn
 pPNBFV2kRJ65+8CckieQVnIGJcS8hhT5jSeM+ux2U5EJdmruwawqxEhHVVwh5kCcKPfGu7DQ==:
 NC/INRbkbwTi7JcZ6S9G4zpS16TMJLVdl4GyDfIuYKLemx1YyPmsVN+UhJpULlnmzD1BLdWVCIR
 +91ZozJTCZLcBmOZVC0LcB5LFbgbLbqFMKm2+kQ+8tnC3VvqCxAMphempnaTkuS94xYIUfTxVj0
 ZnKbmX1x2bdxK33eME1F1QAtX7kMCPnxSt8ieejm2LzqtIMKLKRmlrugCllAVpwXdAtDHvu6T1O
 GEJOaRRXS9bJo3abucB4jQJU2ITQruXyviaNhkN2StWEKIEeDjiYvpxiIarke3m0AjYt5dOWdo1
 Qf3wvE8pNuPccCv6Ur17BAn2/qGl52PXUmStJ1IlR2CSunb5Uet0ciQ4C/gd0rGLIaNoiLuMUx2
 P3OIW4HZtYvcHHqsYeI1yV84cIkkOKQSdPcOC4BlgY9k55oMmBMZ0w8UWHFHh/Ej4pnotwNg3Kp
 c3rREyo2lt5qG3oEvkJapLLFC60BrSkIW8C0lzLIX0D/kOXU6Q9Cmkms42PmLb3b+UaY4B1LElY
 6GDzwJK9+GW5v3/lt46wmZa77YqApapyLjpIJyBbpNkOO0Jbhpxad13cOaXRX9C2WqJmTlYQUMn
 0L/2msPZ
Received: from fli4l.lan.fli4l (p54a1b33d.dip0.t-ipconnect.de [84.161.179.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A6DD0A4C38F3;
 Thu,  5 Nov 2026 22:54:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36894)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xP5Ps-0000000041R-27TK;
 Thu, 05 Nov 2026 21:54:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 22:54:38 +0100
Message-ID: <20261105215440.1613885-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/3] package/docker-cli: security bump version
 to 29.9.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://docs.docker.com/engine/release-notes/29/#2993

Fixes CVE-2026-116587, CVE-2026-116591, CVE-2026-115538,
CVE-2026-115539, GHSA-2fqp-xg6f-v7gj & GHSA-w26x-xg27-7qjc.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 67f4c1195c..76a0bab4d1 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3b1fab5e2ee2d6b63b8ce0e8bbd08d6f54c0537c470332f2c345ab997233409  docker-cli-29.9.2-go2.tar.gz
+sha256  23d7472c80bc7483e57655085d687c631b398837bbc92535528c4582fc17e95b  docker-cli-29.9.3-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 563f4c851b..904f7ab150 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 29.9.2
+DOCKER_CLI_VERSION = 29.9.3
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
