Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56081CA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 19:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 229676149B;
	Sat, 16 Aug 2025 19:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmhbWr44bt1I; Sat, 16 Aug 2025 19:38:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A193614B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A193614B4;
	Sat, 16 Aug 2025 19:38:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E96C197
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50935614AC
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3X2Oqhgpfiyy for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 19:38:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BE09614BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BE09614BD
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BE09614BD
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:38:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC84144522;
 Sat, 16 Aug 2025 19:38:30 +0000 (UTC)
Date: Sat, 16 Aug 2025 21:38:29 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250816213829.36838480@windsurf>
In-Reply-To: <20250714081749.83051-1-thomas.perale@mind.be>
References: <20250714081749.83051-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejjeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfffgueethffffffhgeekkeejtefgfeevuddvjedvleevleefgfefgfegudetleevnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesmhhinhgur
 dgsvg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755373111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZWT98Tr94rHGLxaxPripBDSGu0FA6WbKVH6bwxyM1A=;
 b=SRF04uSFxxcRGlH0LXlKDgiyCGqKedZg+qLYqjyTtm5MCmTLC9OkVzaVQ9WPZ42hCmlUGb
 E/6zXpfsy44maP33O0MZuOqEiOUOeMfFfTxqaiXsAByb0ewlty6TXS7rw8r+VF1Dh/gK7J
 g37tlbZccLlJMYKKIsUGl+Eix5djJtYltNvXktmtG+mTX7zAM1nOdDwre1VOpDESvrHebe
 WzLuzdQM35MjePqzpjkJSuodRaSzMgjVpkvo4VK5AtVGen6xFu1JTcxWlcd4aftmhByqsR
 nXfEi1NM1DcOGLNvFdNEZfFAxsZ9yb/kseJxCtQmpR4ieoaEFlnaFXv1smAIoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SRF04uSF
Subject: Re: [Buildroot] [PATCH] package/libesmtp: bump to upstream version
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

On Mon, 14 Jul 2025 10:17:49 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> When building libesmtp on the autobuilder, the following error occurs:
> 
> /workdir/instance-0/output-1/per-package/libesmtp/host/bin/arc-linux-gcc -Ilibesmtp.so.6.2.0.p -I. -I.. -I/workdir/instance-0/output-1/per-package/libesmtp/host/arc-buildroot-linux-gnu/sysroot/usr/include -fdiagnostics-color=always -Wall -Winvalid-pch -std=c11 -O3 -D_POSIX_C_SOURCE=200809L -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=2 -fPIC -pthread -MD -MQ libesmtp.so.6.2.0.p/smtp-api.c.o -MF libesmtp.so.6.2.0.p/smtp-api.c.o.d -o libesmtp.so.6.2.0.p/smtp-api.c.o -c ../smtp-api.c
> ../smtp-api.c: In function 'smtp_version':
> ../smtp-api.c:1183:7: error: implicit declaration of function 'strlcpy'; did you mean 'strncpy'? [-Wimplicit-function-declaration]
>  1183 |   if (strlcpy (buf, v, len) > len)
>       |       ^~~~~~~
>       |       strncpy
> 
> This error has been fixed upstream in commit [1], but no new release has
> been made since.
> This patch update the package version to fetch the latest upstream commit.

Not sure it's new with this version bump, but there are still some
failures of libesmtp:

https://autobuild.buildroot.net/?reason=libesmtp-v1.1.0-14-g335ee8d2fa5cb7d30db7b818ec05563ad139ee2f

Could you perhaps have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
