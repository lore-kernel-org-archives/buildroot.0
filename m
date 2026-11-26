Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F331606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lMrtjzGQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21A7660A8E;
	Thu, 26 Nov 2026 19:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsvGnTQX4SaW; Thu, 26 Nov 2026 19:25:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2C5FA60A9F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795721103;
	b=bTdbad7miGdnLoNAv4MwWc2LKanXZdDk/OSMS7SwrWvixinpVd7hcmzPlrk0jwY+C2Jt
	 vPqeeHxhZ+IlBEjzEwdwKERjbW2XS2Hk+/GYoPF3lv3XqkijeL2gjsMLG+wpBamdJdSme
	 3zpfvCX72znJg9qr00TCNN/tHY4wpgTTSDuq1IbY5hZ029gEgeahiwi1v+m7XT/g12YBl
	 PK1n/Kg2jw0AMAW3CPMx1bFQPmFwuf/j3E+3R6p9pWB1fMZey6boB71H9zil4l3FAHzD3
	 7tT3bCqbYZjMLdRi9K1cBwRGrHgSLavohdzyovDj4qMvvyLEoYNDiuMCihIArldWTtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795721103;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=ey4AfucUbHi1M17tCVolB84CpWUS9b70OfGfLvGc9Yc=;
	b=MCYCGI91gHoZEuXtj9HiXT5Hv/LxcVpVjtCycnPo6lKA2Rr+OjCYAyxG5ET8D4UJ2i4j
	 DbPx1cBoZTcc630DBkvAr6QVMZFmtPYvzVIqVfjZglLMLutobMglYnnhSNntfQNIBuz+m
	 g40pcLfsRzbi6R2f0K+ez0I06pUICsysrPGUuU7uXVgks8k9pwQA1L/jTW+C1M3+8hI+3
	 gB+MUdUPWjVV+3kLbtDGs9aaZLWCh1c/FsbyZeXZmZpKPDJMllAxFtKGjkqF9haopTnb6
	 0Hft5ZVRyMUnNvlG8XegKOoOrjCTJCe5wFxMFl8vkuMe1kr1g/DiWdvWuszDwFgqPqg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795721103;
	bh=ey4AfucUbHi1M17tCVolB84CpWUS9b70OfGfLvGc9Yc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lMrtjzGQhHA8a+Q7tyvSqxs48puHdTUppBxEuX+2/7XHdTfmfOTWoJB5sIFwI3Guy
	 MuG9JFMFg7YPofgIOJN+3RxYS2gF2089HbkqxuMcWdYJjvepYMqfRR6H3AJH0U/+G+
	 bivLDyRb/nQcIooVH5IPfsq/p7+q75tIpjARIU3C6UCPXM7nMLN+636OFgPCYhNG/T
	 bgAfW+BWv0F1682hJ/9s8WZoFmOPknqkRSv7p0n8YAC3zPVfhUrWaBjIQM62LeCYVC
	 I/jg9ooeas+ucxcjkc9vOcTPK1Ane99OrcvczFRxFR9+d/nHR1pT8H/01fJPQE1Y10
	 se7mTJ7tgWYHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C5FA60A9F;
	Thu, 26 Nov 2026 19:25:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C7BC32D
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7227B60A9F
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_zWzoKSKGoZ for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 19:24:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 092E760A8E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 092E760A8E
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:24:58 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795721096; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:tmxTIIvSJa1UEOyhteN/WPNxuE8B
 znTEIVyNJCGrgsgrYRRcrs8HQDWaORml+xzn8Z6dXWFldzOObx8NSJHBLWcVdLNsXTGdgQcl5dh
 zTrdDdoLYTsd5wp630VFFgxV9J1oTeLK07dRPh47DKXvThuoQMdZpCFZdD/IsyoouWw+nDpRLf9
 MWqPTJ8kGssxRaNccv5A0bUoZuTzdCsBVuqgJEIyUX8QVrEwxAjFdSOMuD/kXupOWtztZhpJEfu
 0zmyvUdWLkRdl4LqfvNyR0sL3JIjLV+TbvmfIeOjYmTEjf9fhxiPO8P6XDjIGSq9IWOEX7UGcZO
 8rPKpgNkyAQNHw==;
Message-Instance: m=1; h=sha256: k1NsnE/dT93TTGucXwJwbyEQ1dkNuCDxChS7px3U08s=:
 5UPmPvlqWhSLG1ALlcrSun4LnTvlunv31NbNHdEJuHI=, sha512:
 Qwt9i//rgTn3td0sWqPWoaSky52sfbbG3kqWSqKCF3go9mf7GwnY/lgWOHb50GtHHY+oOrHa4j46mPW5b5CdnQ==:
 D73Nk4ZO8gEweE2vdf7VhDG0lwPRXnY3YaFQN8qpJ8zJ74n5K9/loGOYGtJmY8s777YDgYfvyvlxJsOKzcB4og==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUXpK-1xxACW121Y-00OCAK; Thu, 26
 Nov 2026 20:24:56 +0100
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu, 26 Nov 2026 20:24:26 +0100
Message-ID: <20261126192435.1826415-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126192435.1826415-1-fiona.klute@gmx.de>
References: <20261126192435.1826415-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:B80/t6XGJl4VmSSpcYsjjOwWxl9GWmIkVJgDg2b832KbzZLGkMi
 bnfdnuR+3DqWkgLJtlWc1vlq9Pw03LPfV0mA1WELiBPEgHye2zUspczbKGtWUOAoklWc1YU
 mY/vlVeeVfcErunGnqtc8mHi7MPyOkIaHzbyauUfrWL9C8/jJ6YSLcmMTEgOqcnM5pKQiuF
 gCM6k21BvFun4K7JlMePg==
UI-OutboundReport: notjunk:1;M01:P0:loFYqQtPiAw=;L0CgtmlgaCJt8zI8eBDBGgEddRN
 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
 /Brxkrpl9G+RPNIWtlxoiUqmL2QObcGZx
Subject: [Buildroot] [PATCH 01/10] fs/cpio: set DRACUT_ARCH to target
 architecture if using Dracut
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

DRACUT_ARCH is documented as an environment variable to use with
--sysroot [1], if the sysroot architecture is different from the host
(default is the output of "uname -m", which is usually not correct
with Buildroot). Modules mostly use it for building library paths, or
checking compatibility.

[1] https://dracut-ng.github.io/dracut/man/dracut.8.html#_environment

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 fs/cpio/cpio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 00ab6a8f82..9c33c62fc2 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -83,6 +83,7 @@ define ROOTFS_CPIO_CMD
 	$(foreach m,$(ROOTFS_CPIO_DRACUT_MODULES), \
 		cp -a $(m)/* $(HOST_DIR)/lib/dracut/modules.d/
 	)
+	export DRACUT_ARCH="$(ARCH)"
 	$(HOST_DIR)/bin/dracut \
 		$(ROOTFS_CPIO_OPTS) \
 		-c $(ROOTFS_CPIO_DIR)/empty-config \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
