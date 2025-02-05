Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F7CC02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 08:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AB0F80F7A;
	Wed,  5 Feb 2025 08:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKKzJIHylY8g; Wed,  5 Feb 2025 08:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F828330B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F828330B;
	Wed,  5 Feb 2025 08:52:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D387212F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C38A560FA9
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcZZF6TlCtP3 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 08:52:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B123860FB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B123860FB4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B123860FB4
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:51:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A49544390;
 Wed,  5 Feb 2025 08:51:37 +0000 (UTC)
Date: Wed, 5 Feb 2025 09:51:36 +0100
To: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, =?UTF-8?B?TWlxdcOo?=
 =?UTF-8?B?bA==?= Raynal <miquel.raynal@bootlin.com>, Vicente Olivert Riera
 <Vincent.Riera@imgtec.com>, Bernd Kuhls <bernd.kuhls@t-online.de>, Peter
 Seiderer <ps.report@gmx.net>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20250205095136.0687ecb1@windsurf>
In-Reply-To: <20241222-bump_elfutils-v1-1-970cdcc0669a@bootlin.com>
References: <20241222-bump_elfutils-v1-1-970cdcc0669a@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedutdffhfdvgeeuleduuefgleehieefueeujeejvefhteeujeetjeetvddufffhffenucffohhmrghinhepsghuihhlughrohhothdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhop
 eggihhntggvnhhtrdftihgvrhgrsehimhhgthgvtgdrtghomhdprhgtphhtthhopegsvghrnhgurdhkuhhhlhhssehtqdhonhhlihhnvgdruggvpdhrtghpthhtohepphhsrdhrvghpohhrthesghhmgidrnhgvthdprhgtphhtthhopehfohhnthgrihhnvgdrfhgrsghrihgtvgesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738745497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9WtxVr9ZR4Zc6HxkcOLGuFq1zZh3NLWT3j/PtmdeJRA=;
 b=pVA0JUP/kDjdZtou9yg71o/b/rjatV+qN/+VAhLGgEFdRuHY7HJBzlekj62BYtCm5tOpsS
 8715r9exMYITgLRvp5lnshdWe/ERftZV8+KAV0Zc0M5ZPDB02X3dATI4XnIYvYkUu7XBW/
 huwAEgh2IMM8e997CSVdd0v6DO6fg5UnRXvPKVgr97gOXvICIZrYOzvKJbuCen4GN0atly
 aHZwmnRe8l8OMCqf3Gh4w6Ky9TL+rwKo8SNBpNQwwyHpgPQ8ZuiAdWHXKp/npnCG7JGA8d
 06G/crhgSPun6XMg6gkD+jr7BJ6OQ1USvfro2ImZHNMCTooL3KdkIU2GZDtoGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pVA0JUP/
Subject: Re: [Buildroot] [PATCH] package/elfutils: bump to version 0.192
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

Hello Thomas,

On Sun, 22 Dec 2024 15:57:23 +0100
Thomas Bonnefille via buildroot <buildroot@buildroot.org> wrote:

> Fixes:
>     https://autobuild.buildroot.org/results/29502fe97a15e4926de7cf129b641505697de9cd/
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  ...d-a-enable-disable-progs-configure-option.patch | 22 ++++++++++++----------
>  package/elfutils/elfutils.hash                     |  2 +-
>  package/elfutils/elfutils.mk                       |  2 +-
>  3 files changed, 14 insertions(+), 12 deletions(-)

Applied to master after splitting up  the fix from the bump into two
commits. One commit backports the fix. The other commit does the bump,
while dropping the fix (as it's upstream).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
