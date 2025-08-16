Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7797CA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 19:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0F2182813;
	Sat, 16 Aug 2025 19:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qqs-s5-Dugp; Sat, 16 Aug 2025 19:40:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC29B82835
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC29B82835;
	Sat, 16 Aug 2025 19:40:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04669196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABE92614B4
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ltlu0ndq8PbX for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 19:39:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92004614AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92004614AC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92004614AC
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:39:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07E324451A;
 Sat, 16 Aug 2025 19:39:55 +0000 (UTC)
Date: Sat, 16 Aug 2025 21:39:55 +0200
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>, Ibai Erkiaga
 <ibai.erkiaga-elorza@amd.com>, Neal Frager <neal.frager@amd.com>
Message-ID: <20250816213955.72fad32d@windsurf>
In-Reply-To: <20250815152737.588503-1-ju.o@free.fr>
References: <20250815152737.588503-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejjeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdelteegveefkeffudduieeitdegjeefuddttefhjefgkeeikeevvedujeeiheeknecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdhgihhtlhgrsgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehjuhdrohesfhhrv
 ggvrdhfrhdprhgtphhtthhopehisggrihdrvghrkhhirghgrgdqvghlohhriigrsegrmhgurdgtohhmpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755373196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVLlP1c6cfJdYPNn7QjfrSaYv2zjIMGp6H1IipaS5SQ=;
 b=E1YT8UNBxSD/YgIch2LE/+ezMkEBzV2zGBaUFJ7S71ayb8dB1xA8qXz1O+ZduWPEVqPGrg
 g8A7tQsvM74UKi7bkqy2WL5OcbHeYOMK1kBj+RiB5nO6VT23e0GMeyvClE5RBV6cK1TTLV
 6AEd/BjiqPh7mwaosLSPbVY+y5U2fGx972cE55PtmvEYQ02F4D5DVy/wn7OzmoNJoNGd7w
 r86pXiSkMZldnatxRHmwl/IxigNIC3osafusieB3XDx9wmLEGPgbZmIBE9Wt5MRnQQlEEt
 nOzy/Esow7UBhg1w7OMfbUgPgL+8Z/GU7iwDH3Z3hvXArgIIZLrfchS+4i1SSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E1YT8UNB
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc-bare-metal: bump to version
 15.2.0 to fix build
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

On Fri, 15 Aug 2025 17:27:37 +0200
Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> Since Buildroot commit [1] "package/gcc: bump 15.x series to 15.2.0",
> gcc-bare-metal fails to download its sources. For example using the
> commands:
> 
> 	make zynqmp_kria_kv260_defconfig
> 	make source
> 
> fails with error:
> 
> 	ERROR: No hash found for gcc-15.1.0.tar.xz
> 
> This is because the gcc-bare-metal package reuses the hash file and
> the 15.x package patch directory from the gcc package (which was
> bumped to 15.2.0), but still defines its _VERSION to 15.1.0.
> 
> This commit fixes this issue by bumping gcc-bare-metal to 15.2.0.
> 
> Fixes:
> https://autobuild.buildroot.org/results/eda879fb8e1ccd696f01927087713b88a4b1a2c5
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11026775160
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/b1dd235ad0dd91e1919a167a17cc9cd20a3695b2
> 
> Cc: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
> Cc: Neal Frager <neal.frager@amd.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/gcc-bare-metal/15.1.0            | 1 -
>  package/gcc-bare-metal/15.2.0            | 1 +
>  package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  delete mode 120000 package/gcc-bare-metal/15.1.0
>  create mode 120000 package/gcc-bare-metal/15.2.0

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
