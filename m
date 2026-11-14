Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50248606A323
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Bu5jhSz3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=Pvb/U9VN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ADF5810D1;
	Sat, 14 Nov 2026 21:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5e5VCTN-HLJx; Sat, 14 Nov 2026 21:04:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E9948810D9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794690298;
	b=aCRJU2F+wl50BpsTuw+O2ji2Q7reGS1/94iFn96mQB0hydJT9DdDVjtVT6yri5p0Et1m
	 oVEeuxAY2alr2m2pLFNGyL8LWyyJvM+qz2C3khBrRYwRmP5kcRgEHObYsRVUEGXaRL9OM
	 Grnjcdq4wyhyX9xA6AHK59rbLRbvc1YdLWANqSr89jz54N6yeH87aFkY7sP0S+qyrZ4pE
	 TlbNfds2U8T9YnyV+xA4vzKpHlvdZDjtAncl3MmFkdawh95kLt+FsD3Bx9Obxgc3+lsGR
	 I2+iwVZl0T4P3FD+7p+WG5DzfBL7l69o0M/4gNqZXlY1+Xdpzy/iFjwlgPF1ZtSGhUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794690298;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EYpMYVWFa9YoB7AuYiOQnL7s5hUeq7LhUENqx0UUfKE=;
	b=d9v4GE/Je5OhHw0B6lfcJ/H8oxEmZBo2Rj2heTMi6W2YzBJYHOpNXTW5B3HfCyfVG0ey
	 eGWUNoUX/lV9UqY6Mhwn/D1LDgIrh8CFcDZYJ/1DEOvu1Xpldv9Ul/9Bfdfn9kYibcWB/
	 4oogrhJaNPThX09oBXIAZRrF3yafdYgUDUIdgn6Lioxl/YUzoBbQEZaJ2HMfKkg9bcmrd
	 tRT9ER9i90/htL1todFC2H9WUsyou7Xwh/aGY1m3fRFXrlhjVWgIjkPOGt7nV5lAPsyAn
	 m1idp/7TOwrdlj8FF2AjUNYJNWjs8rgWVISbMlV8ZLPtPXiRKckroKMTpTORalnDoQw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794690298;
	bh=EYpMYVWFa9YoB7AuYiOQnL7s5hUeq7LhUENqx0UUfKE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bu5jhSz3KklOwqjT70+CQXixmpJ8UBsWJZ2W4GuR5Lj1+sSWrgaUk5/oX94BMW1iA
	 YHnJZ0D8nMqBk31OHvRjcC8pJlIoFl6/aSGodXV3umSHmPGaORWTU8JwpxexcGLnE7
	 82ob3idynbTgPrDEgNv7Bo6fhofKkUnwvc6JdNRkslVWtfbf7fRxezopXY9klPQyz9
	 gotamUc1r2+y+dGAAhIyyS88a7tz4IBb96+ZOdX1MXu11wA8ARycU/a1JsUwj5ccK9
	 bRlGn+z6KOjDCSdIuAk3tyv8aRASia9nLcBrmUeSN6oF0t1sZ+Lv+cVeT1HKIgJehK
	 9MWLEgAJ3dbsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9948810D9;
	Sat, 14 Nov 2026 21:04:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C23CA0C
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A90F60653
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MegRXYLzGN4L for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 21:04:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 06F7E6062B
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.132;
 helo=smtpcmd04132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Pvb/U9VN
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06F7E6062B
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:04:52 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id SKvZxXcqqtleFSKvaxL3kS; Sat, 14 Nov 2026 22:04:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794690290; bh=awvgCMW3B2hYKWqilGXRL50qr2Vin28FU4zihC7W2Jk=;
 h=From:To:Subject:Date:MIME-Version;
 b=Pvb/U9VNysSJzHuaJwceQ/TkJ72T+ZVnN+ydFQgsVvh8Eaph79uWa3khHkuSb5WVo
 NYkJElj3aG8i5CLzHq/3HOm0GCYzBkPULM9Z3Lew/vGkmqrqVG4TCPX14tAj21jtVb
 UCHsU9gbYoTFPVl3sPiup3OdW4KhsMfZ8juOq9tzpYaMfqfeBSKCXF2pz/CQGGWLuq
 eYh7Z1RjnJIG/SnMUSdnhViHOuGyGNLaxJMbJbiFLS246I3/+MCEf1XZEwanpTC5xK
 FlZ/ne5PXjah0m6tbuoYQzVx+PamCZmE4muYIxmoV+YMF312BXsw07e6U0Oxjk+/hT
 rAonWMH0rycZw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Marek Belisko <marek.belisko@open-nandra.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Sat, 14 Nov 2026 22:04:49 +0100
Message-ID: <20261114210449.1550804-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114210449.1550804-1-giulio.benetti@benettiengineering.com>
References: <20261114210449.1550804-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFImFfR9Ywv1VYwl9ywaDwkJuX8y5l/9irJqyNx2iBal/a/nxK+rpb53OGBsldvmt7Gjb+rex77mJ1omh8XOr9x3n+YBpB2N31pse7J9Qlwyn7CE3SNy
 e/azBxG0ChMop7jfo3QOJl3kxwCfcUAz0pzPJEtbkd7ZFWv+yU2UCsMiIQ0znXBqAEjMyXtgrUIPk38O+G59+QaBrn6J4y43iK9LDtUOCQ0BscFxjfQc3NKl
 hIEv/beJDsM7JS3fHdRjVlb986RZJPrN/HtcSfgEuw0zijmv8DbGlQgupo4R7YPxIFoTvZawFAXHKtPFob6/SQ+i3A2VS1KXsa6yittaQH5ugW/lKsqgOhoR
 UwHdd59F
Subject: [Buildroot] [PATCH 2/2] package/udisks: bump to version 2.12.0
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://github.com/storaged-project/udisks/releases/tag/udisks-2.12.0

udisks 2.12.0 requires libblockdev >= 3.6, which was bumped in the
previous commit.

The hash of COPYING changed because the copyright year range was
updated from 2007-2011 to 2007-2026.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/udisks/udisks.hash | 4 ++--
 package/udisks/udisks.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index f9ed24c823..df8836524c 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  18630a8aad806bea0bc626ce97e71e50ec82c742956ac1c834a4275f8f22207b  udisks-2.11.2.tar.bz2
-sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
+sha256  dd709167fddf07b14f8175dbb3ab0c372147f66b437cc2341a9f97d79303c71f  udisks-2.12.0.tar.bz2
+sha256  ab3f14453ec92c176e414ce0efccab82bd8e8e51b5e533d9a11dfb87e6b12f10  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 0203d037cf..a9aed89563 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.11.2
+UDISKS_VERSION = 2.12.0
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
