Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BD2C88E53
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 12:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AE3780DD3;
	Tue, 15 Sep 2026 12:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qund3Vy7RcT5; Tue, 15 Sep 2026 12:39:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1719F80D18
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789475984;
	b=VQ/8T8kOkO9JHTC4lt3US2j+d+GbfXx/tM/lz9bsyfQOv/qbzxBEeN5bmCfguCJa9qbb
	 5NqrcX+/Fx0DOy3Ur0q7yJSVW2rPfEJTduOhdMOHs4z0HH4f7gfYRaDLIYGyxUaq6vmpu
	 erZgirDgftokSSJ2MvhFZq6MJXQX9g8Szi74hC7BlDL9iuSI8lp/xqDcxbbDnEVUjTAla
	 7dycbZTOsGM4tvB5EUp9Py01ewjmBAn1NijR1L5MIWN/9apIdB13Wev8byR1tiYu44Tb3
	 CaYSIvJ/9wnPIcYJ8VokRMlg17GeuENwrnCmRQ6H6fRZdRUT/k7fKjesTo6oFquAaBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789475984;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=IbRcoWuG4GGF1SOsvo3k4r9DTVLhoO0akLdrpy1skvU=;
	b=DIfuElY90XHqHB05k0GQCIzwBon8aeommd1OliGz3tpxaWvXNWc0v35OP8FqdXJV8MV0
	 wlUNInNQfzxtjBVTdgyJ+WbYNHmToWDpLUXKJenK9twvMIiPl6bVRlID5KrvrwzSzlZ9C
	 SJFYivudAa4N8k1LMxuqt7Wn2GTWWF7Ujozgz+8LjdOX9wKiRzBdvw2ROHXVzjd8g+CYq
	 7aCRcMUK8kXKJK9zD5uR3wROMTyBUn6clJrzafQwDHCGRdi9vgn6ckrQqqdDvs/dun9OV
	 Xab1mb71dUIYhwIURiY3je+MRm107cLgsspSLreHTV1DZiAM8/qu/vG/t1RykTPpDqA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789475984;
	bh=IbRcoWuG4GGF1SOsvo3k4r9DTVLhoO0akLdrpy1skvU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=fB2hlxltrPSDw1bpqwkLnh5kVSrNhZjT0YmPTcQcnfr+PHYYivRKhooS0x+E7H5dL
	 pwoqAuJBebtrKnp8bB87bfx9zFvl7+lrIMOkC4V4DYM1WWjXBZM7AR3iyJTOnOzE+8
	 kFI0tDRxMd+y4B9PuKbIjviFW9kMcTiHreY4nZEFqcWn86iEeLYQmLnG3fXCPlXZXd
	 9SQLYlqdZ9m6IVtFrOBUjc6nYSd/pJnB+jGam+oJKFfo0ltZSgTL8oGz6q00ZC+mnL
	 UsXvI5FqUGve3HUp4aaSJEUJxRn0n+VRvDxMHJztpVK+PRVPYOCA2mMdwR4rv02U2/
	 RtjCuPnGDN4FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1719F80D18;
	Tue, 15 Sep 2026 12:39:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 840F4493
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ACD16074D
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Jq-zS0-wQJA for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 12:39:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BDF7E605E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789475980;
 b=dPE2k9QHb/wqBuBAP92kC4DSMNdflmUi0467n3mG3czcIdAsOFqcprSBUNXiS9PNXFH9
 ykwr/dKhwuyMapkiI/j0mxIO+II+voUVjZIxZSlHnTsz+RGsTIFXsxfqhEepc6oNK02iL
 Qa0+Fq+fRZQ5AgcH4qwpn6xIME16vG/oEtTPBoUbx9qrxQZYouG2xKVB7y8mslEBM+LOF
 9jLi9agpI/DA1FbFcP8z3SSt8ael1Jjc7UDHaFw2Zgcp26J13RrthXtgtMO6bgKjkSKes
 udZ3nFzYR+53ipG0yBxaLI1Dj+G+WvsW8aJDbwU0pQ+8zkXMdqa2SF3TViyEpSF5yuA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789475980;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=jnQYcDjMetc7Lyn+7E2R1y6dJE8MtrhCM02vPgcxP6U=;
 b=iw81k70pp6tVl62OYJB7VLHu+SN55g4XIuR+iGwxg20XGkSnipQQd5riun3OA8K+dGOA
 xOQZsQBWJFayRLfI3jHfetLfoIq9QgXAtHOOuKv2F93XH3ZOiMA9nlaajL3Y4e1CbMwm3
 lfrCdsaRBEtupmy//H5gj1RFrB5VAmRicIe8y5I1W0tDeqAURPLmv9Qh9TxmFCgpLCeK2
 R5DqLnsK0w4bwPg9nTEhYRcKWVQ0ywd7hMlEX77IgIh/Jy2ae5f2lkoWm8BLwzbxC2MHk
 wG+AZxhhR2MwW1T+b3D6Ai3ujKDQPIeHXs0a5D7xTK3RQWI2QzxIW4cYsaiw851J+VQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UVNviEkh; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDF7E605E5
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:39:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 50CD11A0815
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:39:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 258FC60498;
 Tue, 15 Sep 2026 12:39:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2629311C782B1; 
 Tue, 15 Sep 2026 14:39:34 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alistair Francis <alistair@alistair23.me>,
 Neal Frager <neal.frager@amd.com>
Date: Tue, 15 Sep 2026 14:39:30 +0200
Message-ID: <20260915123932.1956884-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] package/xen: harmonize
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS select
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_XEN_TOOLS needs the full blown version of bash and
coreutils, so it selects BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, but it does
so only if BR2_PACKAGE_BUSYBOX=y. Which kind of makes sense, but is
not aligned with the vast majority of other places where
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected, where
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected unconditionally. Harmonize
this with other packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xen/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index d63a3f6002..47f9dfa6e4 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_XEN_TOOLS
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_BASH # runtime (scripts)
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_COREUTILS # runtime (stat)
 	select BR2_PACKAGE_QEMU_XEN
 	help
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
