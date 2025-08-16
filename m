Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67300CA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C7B961547;
	Sat, 16 Aug 2025 20:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQg0TErRKBNc; Sat, 16 Aug 2025 20:53:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A4B96153E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A4B96153E;
	Sat, 16 Aug 2025 20:53:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BFED196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E4E3414CA
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id djcfaM-4FJJI for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:53:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4BD7E414C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BD7E414C6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BD7E414C6
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:53:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4E41442E5;
 Sat, 16 Aug 2025 20:53:14 +0000 (UTC)
Date: Sat, 16 Aug 2025 22:53:13 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250816225313.0b47323f@windsurf>
In-Reply-To: <20250812171825.1942608-1-thomas.perale@mind.be>
References: <20250812171825.1942608-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvddvieefheelteehveduhffhteevjeelgffhieethedtkedvueduhfetvdevheffnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghuihhlughrohhothdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrp
 hgvrhgrlhgvsehmihhnugdrsggv
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755377595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAA5DhavFSMphcsY4oeoGCKVrJvVmBezT8d9SDOLGXE=;
 b=MzGpsUhHsPlrdOGDqVejp4ycSX5e2vUabFUFsqgDhoidj0TaVYfFQDGft+KyswoOEzwdG5
 Ov/cRO/biXfZ+IJNoPMsPVnqPqBXyfVStFtCrTiBsj3LJbHP2vjkZxoVFmAWRvsjSdeMa7
 cCXWvFcTgoSXojnc9N1CemhQMp9DPLiThq7K0E4QuJ0f47ozFnbDYR1bfVfmwmg0FoAc4L
 Ef6DOQBoov/J0ow74HhL0Cg5xdfMx+/LbCpZJda1O4+89mhA82TS+x/+tN2mZhPwwTqaCZ
 ZuFZU2uUBhqnl/Ewkl6+41KYSEfWQ6rcOki8+TzhpUG0sXikDBb+O/wpun7wcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MzGpsUhH
Subject: Re: [Buildroot] [PATCH 1/2] package/prboom: fix build w/ gcc-14
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

On Tue, 12 Aug 2025 19:18:24 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> When building prboom with gcc-14 the following error appeared on the
> autobuilder:
> 
> ```
> i_main.c: In function 'main':
> i_main.c:359:10: error: assignment to 'const char * const*' from incompatible pointer type 'char **' [-Wincompatible-pointer-types]
>   359 |   myargv = argv;
>       |          ^
> ```
> 
> While this package did not receive any update for a while on the
> sourceforge mirror, I backported the fix from a fork. For more
> information see [1].
> 
> [1] https://github.com/coelckers/prboom-plus/commit/92d44b6383a3e053feac2c820b8114873fcd798e
> 
> Fixes: https://autobuild.buildroot.org/results/888/88846e3cb267b04da58bc17d92fd5dd385b65b5d
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>  ...v-instead-of-const-char-const-myargv.patch | 140 ++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 package/prboom/0003-gcc-warnings-const-myargv-instead-of-const-char-const-myargv.patch

Both patches applied to master, thanks!

It's another package with no release since 2008, even the fork you took
the patch from is archived. I would suggest we drop it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
