Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA30606A320
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nS5HNrNp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=jw7O+Cqk
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73698813DB;
	Fri, 23 Oct 2026 14:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3QX5IerunEW; Fri, 23 Oct 2026 14:55:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DA112812DA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792767347;
	b=NRbOiXFcDQkgP6UglYAOUrtJITWEWbC+y+aq/ylcSGR2BgEU07YZAN2KeqFR1OD/k1Id
	 C83fKVZ4TSaEIkqA59hWw45Dj6euVxfx6Bz8DSjyizrFrnxWp7yoFm9fOt3JxZarNTeQa
	 /t2GFo29r6cptM0YCtvg8iu3VGo++7uAmpcjieRbB9V0bFO29Nr3hg9otQcoNWJwRp+6x
	 h1dH2OBqHVv3bEc2PQDwGCQ82DLutiwg39jR7PmyEKwbaQ5QkuDYbV0fa7ZjajIXkkGNs
	 EB8wTxix6qrvn0YGymRuVktr96Joj9UPAG70zaEi1kEn+wu1SOkx9Wb/o7z8o3ciSSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792767347;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0cCNiAbArrL4SJ9ao/s3v3R7ghSPzMIpcpxNOeXWj0M=;
	b=A5zynMmiHBZnar+/0IVLO1dUAhWxgCFejTZtYDVIA8+rSbzFIcylGgNvN6jiQ/GCqR9N
	 jGmzE4uI+8UTg46qhkclkqC0dgNMVQAcI1S8cJqDKzW6aeY+hQEE2Pvb4MplziXJMWNSv
	 2iY0rM+S7RTZGcEtMiCoPHVCChOEKDAovGozqCvchqYzsoEALfn12C3FWGGY2ZbPXQFjd
	 4dRmGxQLv1z2ihebbzNU22/nNUZLSdEFZmMAmGppKtZsmRTkGvDEMTqaW4dy4rr1TAT69
	 RuJiuUvn2inf51KAFMF0n3A36UV534HlsP0OkH2gUkokzYDwNBNylm6E45YwAgmb/AA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792767346;
	bh=0cCNiAbArrL4SJ9ao/s3v3R7ghSPzMIpcpxNOeXWj0M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nS5HNrNpPGCzT7Avamb4Tbf4bFRGxu9J9r3CkcZNdr5ynPKjBrGQCAxoVKczFTuAO
	 8tTkSZAE1+fRaRN8Yb/yZA2fNqsZcphUoq7aLaAX3/Vs48qEoQ1oJFG9OVlJ5J+CMI
	 FuzkfM3DDm97y5ZP6hMDwvPQL7ZIWEn2bkuImAl4o3bcUj4M0dgOSzowcTbeaw5qaX
	 DAkIuWMeeVMhDu7PFkeLyM3G8wwEQDoDcJ9LK7kfrFGLSSCZplEip0XL64pLNFiKNg
	 H0Ucu/z3CXGhTUCJo89lGhQLwPYxKOkfZYnNjta1gV3DB3LV9VoBJfmXqR9r3fztNf
	 IDcKyRExYWMWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA112812DA;
	Fri, 23 Oct 2026 14:55:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 491A649D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B39560629
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3lgIBx2YIyB for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 14:55:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9F4C660674
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=62.149.156.86
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792767341;
 b=o8ypvFbp1HQe2ShCwpGQg2I/M+iKCw7c3FKgFEgSzFiToPwaR/8FJSoeBHcChJnhwYp9
 csGISugcZC16oEtXhjSNPBCvhJ8BQ0GoRYbPgQZe7JfdrLRLMoD90u8uKV0VTKlvCISGY
 zKoua7rIm/DxgEjy+al2VY9jw0WL6u0X8YJKhC7aohj7zd8/kbvBiiCUYIe1cvyxJ6d8R
 bXOunqewPIVkczPI3mn9TTjIUPyE8QFQFMmhkJgabUciRRSilQMpJkR9bTlX2ExfKaIVa
 j+wqf0KGvEVczNQkYWgvnA6wmCzf1tIdcjSfKFvCViUGwKcFgC3QCGyc20adWvDXL3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792767341;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=6gyBqoXyd9o8H6lQnGjB77f6Xnf+Fs++pm2zhYNdiII=;
 b=Y2gxvHZsbkx+T7swFqJWaQvp8ranwNfTl6JM8JJ2bXI/ggUyjg1GPKldDUuwSG2sU0Vx
 +ROvxAZZopqLD62NEGddJ8jgzmW7ct9HR24BrWiQQVOHHb+pZcxR0DR7ahTMQHvaXzaIo
 /sJ3afwmM/xksRzzN+EQssFIMCzxzKXbPG5SdBjh5wAqDEGouzDlw21qbw7u2lXS9R9Rw
 Y+L6G5glfmIRc24amsyvzcY4Y9VIgcS7aSBsw1YwtS+lW2CgfU8XVerj0CNwZXuorJF5Z
 /EeLQeGCyh09Z50FahcwEkHdDCXTyOAzYULk1FK/Uq3q+x5ZDeSM8RonklEwct+dDxw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=jw7O+Cqk; 
 arc=none smtp.remote-ip=62.149.156.86
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.86;
 helo=smtpcmd0986.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=jw7O+Cqk
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F4C660674
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:55:39 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id KGgBxmCEGAFghKGgDxLdCV; Fri, 23 Oct 2026 16:55:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1792767338; bh=A9+vwlzS9UqGD06Mtq69xT74q/u4c2Q6QJSb/k2uJwI=;
 h=From:To:Subject:Date:MIME-Version;
 b=jw7O+CqkurYqTQmSFVGhsRItVtu4Sqr612Q0Eshgfsfvqj6KWPiikvgSVGUyhswc8
 XxD+t7BXqIdxVD7pVkRdBX3oAzLp6UJgXu5fhcQecSFyYp2sgVpu7YlvRe0xdTX/Ca
 ZKo/HVq8bBOjyagjeqTFkNLnKEuy6XyoeVOe/g5XblCHulIIlTR3BwA/zVp6qcYjIl
 KqG18Vag5nYVmUChqQNwAB/66TkjLoVpExwX4LycrEixbv+e3y+7Bcme7GBuK//WmA
 qI9XZOEMbJHP3NScYc4TA+anOm21wBm/24aKBG1BTgNI0rKUZHNDDC+gnQ46ZLSKXB
 a7mgxLtRAWfqQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Pierre Floury <pierre.floury@gmail.com>
Date: Fri, 23 Oct 2026 16:55:35 +0200
Message-ID: <20261023145535.3038864-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023145535.3038864-1-giulio.benetti@benettiengineering.com>
References: <20261023145535.3038864-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDN+iwZzcykWwkhkCBK25OWlzQizypjh8MHpGZFnu0Ep1JAhKKYBStgIMk+AJSt1yu1sO6cQ6SGAKidPij8dGqjeWYKIJwzU0xU8YF3j7MSTM1LvX8Ff
 y02H3pf/6Qd7Lky2Dj+6zHis5H6J5k5gTDXiX7oAbh4J0ZvDL0z9ZGaCVDI7i+mFIH87e2GjIHrVNeKXw9CJ5O7hpZyILGLOjh609VGg/mnZFoIwXmAhld+n
 WaQpKVBuVg6x8u2uTIZ6P8Mrp05bNyp665/YKR5nFC8x19VdxDTc3fRCiwEw9OBgldLx8alE9OPI5peoDzhXPYmpkUmecsM2+FSEOyWzeurYlfmANWMiFBpt
 zfAAVIxH
Subject: [Buildroot] [PATCH 3/3] package/trace-cmd: bump to version 3.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/tag/?h=trace-cmd-v3.4

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index fa61654fd5..ee63bdc55e 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8ed41f61010998e4a1ba54778f9077ee7afb5311d38dca9781d7a397dd70c9d4  trace-cmd-v3.3.3.tar.gz
+sha256  604085ab395cc2cb84397dc3d209ea0d0b15ae506f8ea91ff45c86e5a050213c  trace-cmd-v3.4.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index a1b17289cd..f976176a5b 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = 3.3.3
+TRACE_CMD_VERSION = 3.4
 TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
 TRACE_CMD_SITE = \
 	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
