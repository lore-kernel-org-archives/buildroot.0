Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95F0C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96AA561253;
	Fri, 16 May 2025 17:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-egodegfhId; Fri, 16 May 2025 17:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCA9B60C13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCA9B60C13;
	Fri, 16 May 2025 17:54:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C34113D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F56660C14
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZAcfbsySUt4 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:53:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 905D360A69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 905D360A69
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 905D360A69
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:53:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 9BE19432FC;
 Fri, 16 May 2025 17:53:55 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Fri, 16 May 2025 19:53:50 +0200
Message-ID: <20250516175351.308323-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516175351.308323-1-thomas.petazzoni@bootlin.com>
References: <20250516175351.308323-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefgedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeettdeguddtgffhteeflefhtdetvedvledukeekiedugeejhefgveduueduueethfenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747418035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ex/rnHkoB6QbRFIQ7MHMEq5wQMwViEivoyoO43oy7As=;
 b=BhKHCXsrYQNXSPKESDXOEStA6bF2m5CseddOUodNagF4/66R9idflUWwcMv4gzxX5RwtEp
 kQJ3W50PSoulgAhrPUhQq5hxgmQiyCHel9AenrIiJOmqk0Etg3kuJDQ849pmHGkKfqpI+S
 KD2LchlKgbXvzJUlKXnBgkbxdqo8nA8JU7uJ2Hx2fQd2Y6TNOYyUvFSLDxPCIB1syyit0V
 ZwVAd4TJS79PcwpbwTblBZdo5yoGibk5LMkbDuMuZ7Gs06TC5DvvBVpFL40jnwk5btH8LC
 MwevwUCXv3wP+EMxYE/3sidpy55vcdUFHu1OkMulT26HCgrHwxtHQL7AZwaSrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BhKHCXsr
Subject: [Buildroot] [PATCH v2 3/3] docs/migrating.adoc: document the
 tarball suffix update for Cargo-fetch packages
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

We changed the suffix of tarballs for Cargo-fetched packages, which
affects out-of-tree packages, so it makes sense to document that in
the migration guide.

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/migrating.adoc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 1b55bc6173..ac40197147 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -209,3 +209,9 @@ or with a startup script.
 Note that systems using systemd are not impacted: systemd always ensures
 that `/run` is writable. Systems further using systemd-resolved already
 had a `/etc/resolv.conf` that pointed into `/run` anyway.
+
+Due to the update of Rust to a version greater than 1.84.0 making the
+Cargo.lock file mandatory and the change from +.cargo/config+ to
++.cargo/config.toml+, tarballs generated by Cargo-fetched packages
+have changed. Therefore the suffix of such tarballs has been changed
+from +-cargo2+ to +-cargo4+.
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
