Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C3DC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A971B409E8;
	Sun, 18 May 2025 08:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFC8u6KgYdkA; Sun, 18 May 2025 08:57:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3FDA40B3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3FDA40B3C;
	Sun, 18 May 2025 08:57:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2829EE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C09B60D5C
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ef2EEsjH7tAz for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8749660E37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8749660E37
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8749660E37
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 97E09432FC;
 Sun, 18 May 2025 08:57:35 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 May 2025 10:57:07 +0200
Message-ID: <20250518085723.23020-15-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
References: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudektdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetgfdufeeijedtvdeguefggedvgffhueevuefgfffhleffuddtuddttdevhedvnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrrghphhgrvghlrdhmvghlohhtthgvsehmihhnugdrsggvpdhrtghpthhtohepthhho
 hhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747558655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MkY/cbkLzkjNgrwUCFDkOB9NTflpwnOzTLs8Gz6Bcuc=;
 b=ndlwtJOirA2hA3qMTRXp+bDL5uCEFYFwWr78SsX1L+10blVYbGk6rNxHXmLN4qf30uSZNJ
 EdRB+iEqapis3DEIVGQRbdIdfItJ4ZRvSuDs8y/FKN9jOR9fpieXC1SZI3fPEeQtRDYDxP
 GhDs4JMRfeiVpg9OTF7UWFsVW7WXqlU7Ns4RyBu9afgKRtPBjJgBG43zwMOnXDVerA/N7H
 4Um8t+BwQCeUy2sYuJWMwDHAdWiJRjn1FV6+2qjjLaFizTqigEqmvhiVLsjDzNem8clfHN
 +nS4/gnPu+IgSKPUV8yPxA+1Qxek1tS+ggKbJlq3fC9DAWv7ol2Cwu0sX8mrEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ndlwtJOi
Subject: [Buildroot] [PATCH 14/22] package/sox: add ignore CVE entry for
 CVE-2019-1010004
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

This CVE is a duplicate of CVE-2017-18189, according to
https://security-tracker.debian.org/tracker/CVE-2019-1010004, and
https://security-tracker.debian.org/tracker/CVE-2019-1010004 also
points to the commit that also fixed CVE-2017-18189.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sox/sox.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 8922f98d5c..d8a0d7d1df 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -41,7 +41,8 @@ SOX_IGNORE_CVES += CVE-2017-15372
 SOX_IGNORE_CVES += CVE-2017-15642
 
 # sox-14.4.2-13-g09d7388c
-SOX_IGNORE_CVES += CVE-2017-18189
+# CVE-2019-1010004 is a duplicate of CVE-2017-18189
+SOX_IGNORE_CVES += CVE-2017-18189 CVE-2019-1010004
 
 # sox-14.4.2-38-gf7091126
 SOX_IGNORE_CVES += CVE-2019-8354
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
