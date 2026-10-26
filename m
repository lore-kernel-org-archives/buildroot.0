Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FEF606AA3A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iWO7bhWD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=ChON9ZHw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78CF440742;
	Mon, 26 Oct 2026 16:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-_klh9NC6KG; Mon, 26 Oct 2026 16:30:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 965C94073B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793032251;
	b=Hk6An0mBCYe/hAnDYoTodpcGatTsm9UIEihVHloos7pogkO5/vY0QWHuKCx5ZRX5KLKN
	 lYVYoUB7TqmI6cbr07W8wfyfV4yOLKTUK5N4tTbk2TlhNGARdEjvyBuD1odpYoFbLBZJK
	 uQ4/B4JV7axnRCwmYA9ApGJzLQRn9CAHcHA2cXM2TDBETQXEC7H+5PjcoywPxCxWnemLq
	 oYSu5TYl03Ge3/D+n6HtNMoN0WFnB8G1M17Ouy6iCpkqUEn+3MvOVAAg/rB3fOYL+PC9t
	 LBh+sOiKwVsf/gL0wE2iJjKL/ofSAq5V3qrLY1jM8LxleKtk+DaIwt5K11sLYRDCtog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793032251;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XTmbrLSVL8M0VUtjoAoBY688QiZWEJU77IDbMyR2/xY=;
	b=n0JCo00/o7VRX6oZNwsi9ip7iA4gD+V/d76sw6HOB/0mC8YimDii4nBbpXZahuucSk5i
	 VJJ7C0ckUHFshLZxmEMATYbFcChwaBLhnZ1RmvVGvJDpd2Kf+NcXPdA6GWq9yIKuvYRVD
	 Srx1w1srBX7t8Fs/5xoxdQqhp6N36yKYdHA9J4CzjL5UPAOH7YlSt9EpvOGkk6UG2AuNk
	 keRlJ/UAwj/BPvy6bId3rLr9OP3dxVDAd0+5+g7QR1j+ZOZIV1bGsLAeEtzzwrbFhgU33
	 XvTp4Crkvdi8+fG6k5crC825rs9czb7rBPLRnNfL+/vQqYJLK7N7f70xc1jfYK9ra+w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=ChON9ZHw;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793032251;
	bh=XTmbrLSVL8M0VUtjoAoBY688QiZWEJU77IDbMyR2/xY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iWO7bhWDBTIIODpCtzq/b1DClDg+egFlF5GcLun9amgHNKrdtsqeiFobszC9M/fie
	 wHK5ZFg129S804i/82+2zMjmFwkmnP5eZ4w7Yhwk/nd3t+UpvnKFrqxgQ1dK0425UF
	 sCIiVmc+HLDk1QI5Q7SxSLSOQvQ5QZOo44TCOGYwNhXxy4UkI9M5OvjdAM5cyzy+uy
	 JHDyVrc3WZEWAduX2jSPSQwhOXdeaKEIDsMdg1bTX5NTNsoWzaR3kTXy2baWgQRrGH
	 6oSmw0JgFAlx9l2Wzxykk618KOMPaswLeFPeBsVNn4S1NgSKQwI6jhrgu3xGsyThHE
	 famGBVeCX8jfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 965C94073B;
	Mon, 26 Oct 2026 16:30:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D29D9356
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 16:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B899840708
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 16:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PA46m8YuWnO0 for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 16:30:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 362CE40661
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=62.149.156.71
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793032245;
 b=CFbjCEa4mUG8a+KBUdLhJ2ql7bhQMUJOvo+4Q2FV1cpbbIZwW8qKDw0fSdzHlJ9CgMK1
 b+WN5cj0kq+Bbo5HhdPzF0Gv9YV+N4o90p5F8ePb8EdHXTzpXI5ryC7RRbF1RSwvs+s8T
 O3eVafBBjo/jmU08m6o6LeX/dupNkZpQ13WcD6IBI2f/W7xEun3t3irv+M8y8fJaE9QW2
 nbU7dv2+CItwByCEY55E1b3XgwaOlsjzjExYObo8UGLyF9HyyW6C7W9Rl631S8jtYwLcd
 bPgOsrtzGOENexlz/l+/PqQpovs/iPeuqMqRDsKRK3AOFYpIV9EO+DRXmQuKg/NBMEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793032245;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=/tY4/WssO8iRH0u5n32rstaH3eezoDHL20Pl76eLWDU=;
 b=Aiz27rytH+1aAvUTYyZSoIhpG2o+3ayy9HKmlWqD+2XIB8NwnnUimr961BauMfU0u0lK
 X8+A15C58jiV/Iij58SfYZx2v6EVop14F98YFmmdSikmZz0s/9P5TZgk7SxdJGBrQPP6A
 U4k6fiDxr/pzqTvlJ2qZKCEiXKqlRep+53UxV6B1NNQKgbs6XPTlgTKqGO7XuV5fzzIaU
 oDsqklnxczYiQ1rmlQ/K5DyySKj8hjyVHY86uivTGBO512vlCK35W3VpUUW0X9uGotYGH
 UVEpJ/msc6fGEAT4S+j49RIoKrBtRqN5YTZCkT+TZGtGpYrkX8SA1cuYb6aTvkWouFg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=ChON9ZHw; 
 arc=none smtp.remote-ip=62.149.156.71
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.71;
 helo=smtpcmd0871.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ChON9ZHw
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 362CE40661
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 16:30:42 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id LNaqxB7Yx6WK8LNaqxS9K0; Mon, 26 Oct 2026 17:30:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793032240; bh=8+GFnr5DMHMztZtQU0QSTFMM3HBciW/jmi3mgMS0FjQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=ChON9ZHw0ZcL9Q1mEp2QHP6KY5u28hSyXhcR04rhXrgDQefJmphgxSX4yzITOX2IZ
 VKHLyu7p/I4PR9NM7pux3q5f1UeBKuR1SDjFcFaStpKOHbNcumUx8U7neQxblLz28X
 2x8FTpu3oO+ToPFpFSQB8fl1fSZ/Y6EklUBPDqa2BFRgxvtwC0StOvIZFzsgKsIGKf
 Psa7lsEaRyVPibJGvNTbCdseUGmgILq7WNBOd5kNjCmhaNa1Vnm9goxQRw8Q//49kP
 Jw0e6t0qYR80s9NMtOJxbXovaoHEPlooeCLgtb1e2cQyX0eT0c3Ax6DwGSegU8Z/XN
 s0SAU+uumXPWA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Pierre Floury <pierre.floury@gmail.com>, Julien Olivain <ju.o@free.fr>
Date: Mon, 26 Oct 2026 17:30:38 +0100
Message-ID: <20261026163039.664191-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026163039.664191-1-giulio.benetti@benettiengineering.com>
References: <20261026163039.664191-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGjCWGsj51h1AKzdm9qXoHKawtUDN/P2ZwYYU2a4SeZEqLZu1laVuzEm1vHPfibLF3859+nOoWFAG+mh5jRG8+KD/1hx+vVFba6BdLX5/Dcpu/fvZGH2
 4zakjOtEbTAGFFFp3C8YpqivJ96MT8U+Cktt3bl13JTpQa2nJRZd3BiTZ+JGs0L7VO+ciD20qZApJdXYnSXZ31i0B7qxaCi//90sG7Q4SpZTMRMhM5XvgQA9
 OIsLREm7n0w/lFlYaDM5kUQTL/fFTzoy5pxxPusG3HF55UhVjCo9B13iFJPMaXJ3bci9kACFOlu1d+Z0q8FxY+Epzd5V4Cti851K9bZ7RLBCUNvUMzw5Y986
 ys2lyZO3ZC+05JvM1q8VGCe4Rvtjog==
Subject: [Buildroot] [PATCH v2 2/3] package/libtracefs: bump to version 1.8.4
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
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tag/?h=libtracefs-1.8.4

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* no change
---
 package/libtracefs/libtracefs.hash | 2 +-
 package/libtracefs/libtracefs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
index d4f6b95094..18e6631367 100644
--- a/package/libtracefs/libtracefs.hash
+++ b/package/libtracefs/libtracefs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  a9cd9cbae81b7fff71b3f72d2b819e49cec0402529e5f252e1d9319a62a356cb  libtracefs-1.8.3.tar.gz
+sha256  75187bad93e622c94c4a691173e45f08948d38b9a28e9b855b54a3e956d289a6  libtracefs-1.8.4.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
index e9e577d985..16507ced21 100644
--- a/package/libtracefs/libtracefs.mk
+++ b/package/libtracefs/libtracefs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEFS_VERSION = 1.8.3
+LIBTRACEFS_VERSION = 1.8.4
 LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
 LIBTRACEFS_INSTALL_STAGING = YES
 LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
