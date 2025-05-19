Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9F1C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 03:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9A1380E81;
	Mon, 19 May 2025 03:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_EwBeIjyFgk; Mon, 19 May 2025 03:21:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF02880EBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF02880EBF;
	Mon, 19 May 2025 03:21:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0C2A193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 03:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD8F9410C9
 for <buildroot@buildroot.org>; Mon, 19 May 2025 03:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJ1A5NbmgTo5 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 03:21:42 +0000 (UTC)
X-Greylist: delayed 303 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 19 May 2025 03:21:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 960A140F5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 960A140F5F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.145;
 helo=fout-a2-smtp.messagingengine.com; envelope-from=iliana@buttslol.net;
 receiver=<UNKNOWN> 
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 960A140F5F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 03:21:41 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 6CAFE13801CF;
 Sun, 18 May 2025 23:16:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Sun, 18 May 2025 23:16:37 -0400
X-ME-Sender: <xms:lKIqaJp0Drzw5cbQ_BisiQc7YLGExkKsHlCy_2xoxw4-QkkyXX0mVg>
 <xme:lKIqaLod2GCCdxPHvKrDzeLI_pT6iaqok0blEkkDdCMK-OT7GrO5R5ErwXXFSUMjS
 96H3NkaZbigSbP3Q3Q>
X-ME-Received: <xmr:lKIqaGMckhGH3TSmINW5T8I4cqLGQ7nrVtr4rJjPpVm1iyRunKsbR1Ustpi_nl3ItxdpTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddtvdelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhh
 tddvnecuhfhrohhmpehilhhirghnrgcuvghtrghoihhnuceoihhlihgrnhgrsegsuhhtth
 hslhholhdrnhgvtheqnecuggftrfgrthhtvghrnhepueetiefhgefguefhgeefjeetveel
 ieelleffkedtffdtveetjeeitedttdejuddvnecuffhomhgrihhnpehkvghrnhgvlhdroh
 hrghdpsghuihhlughrohhothdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpehilhhirghnrgessghuthhtshhlohhlrdhnvghtpdhnsg
 gprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrhhnohhu
 thesrhhnohhuthdrsggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughroh
 hothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohht
 lhhinhdrtghomhdprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvght
X-ME-Proxy: <xmx:lKIqaE503gpaxMabj8KNdX9sDV9CrCn8sD3gHgBn0kIkzqQJOUCEgQ>
 <xmx:lKIqaI5dYZUCrrSp373NcmonNpPhl9cwac8aYvibYmlbARaODJ0vEg>
 <xmx:lKIqaMgFUfgg4aDH73ciZmAA6pvGGoaBO2qKJdGH4Y5Cz5xeiqe7zw>
 <xmx:lKIqaK63rrweuGAmV2bKdR9rgH4C03S81pG-hsrNwXI1r-advjpEgA>
 <xmx:laIqaBSDRYuCXVH7Bn2NOmJSdkkbpdyu-XOb3pJjK_f6UYa0SekV5WFg>
Feedback-ID: i86d947dc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 May 2025 23:16:35 -0400 (EDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6.1.9\))
From: iliana etaoin <iliana@buttslol.net>
In-Reply-To: <abf4bfef-d537-46e7-8d4d-68e934b7e8a7@rnout.be>
Date: Sun, 18 May 2025 20:16:24 -0700
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Message-Id: <185A5F74-35DD-4F40-B7C3-7AA39E06087D@buttslol.net>
References: <20250516114626.110630-1-thomas.petazzoni@bootlin.com>
 <abf4bfef-d537-46e7-8d4d-68e934b7e8a7@rnout.be>
To: Arnout Vandecappelle <arnout@rnout.be>,
 buildroot@buildroot.org
X-Mailer: Apple Mail (2.3731.700.6.1.9)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=buttslol.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1747624597;
 x=1747710997; bh=4Nr0UDiCYw/FEzomC81jghJliZoTmScVSNIw2w4wFDY=; b=
 FPQBT0TTZYlBr35OxCZAys/BDmvtov8nGxCl0Px3RGErJMkZPCIFORokXqm+GRG2
 8cP6zvJcEGeKJoyNvzI835kdpJhq5K8uF39KwKpKFboS4FlMPg0IQ/3L4OUIGEMp
 P4PzPa511Y9UHDH1MqQzyMKDRCfxSV2s6F8/Ny6hkPSc/1sWtOVhwjnBDsPNzw1T
 E3X4sQUxVee3p91ubPmLufcNQ+q1yAdK7XFq1Cp430iC7ogiWbqCjerb063rXskA
 hSHPeNXWJ3oYWlkuf8TWrEtphfCCtgpjwaUCYqVrGruTQCknlhkjLA45VXaPkIK+
 BkeI8XyjuxoUKy8Sju++9w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747624597; x=
 1747710997; bh=4Nr0UDiCYw/FEzomC81jghJliZoTmScVSNIw2w4wFDY=; b=m
 iFaG9ZCJsF6FGeqwn5h0Rtxxn0vItD0z8xVWCOBaxd8VglXyvG/oEnKhTJS+FxGh
 +yhTuyVSH/CtXrHZ62r6nwVR0n4kLibu+G6RAm2MDK4OA+gsoQy84a3PIyeoHj0G
 1Wx5CV5to7cogOQ4pAwOIhVOyIPQpBrDljrDPJJi2sbpa6WxzeqONuRFjqtWDBEE
 p3Pv9+V+4BqrgaHvEQ8HQxWY+8L+2J136AEcP1WHT9rfDcWTCtraOpyXsLjZnO5r
 /04Lx/uZ3W0VO4x2vQf6P2Dycgs7NyEXnQOlscGlxX99uEBtmNIgY1ctEGRBbl76
 FILIDlugn5qfXvNXGtbtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=buttslol.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=buttslol.net
 header.i=@buttslol.net header.a=rsa-sha256 header.s=fm3 header.b=FPQBT0TT; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=miFaG9ZC
Subject: Re: [Buildroot] [PATCH] package/libcap: backport upstream patch to
 fix build on Xtensa
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> On May 18, 2025, at 07:41, Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:
> 
> 
> 
> On 16/05/2025 13:46, Thomas Petazzoni via buildroot wrote:
>> Following the bump of libcap to version 2.76 in commit
>> e2eb2ee58b9f70ebb83231537cca19bd28fa48de, the build started failing on
>> Xtensa. The bug was reported upstream at
>> https://bugzilla.kernel.org/show_bug.cgi?id=219915 and was
>> subsequently fixed by upstream commit:
>>   https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=6cdd8cd72ebcedd6b1b6c989a7e5722d5d87f35c
>> Which we backport in this commit.
>> Fixes:
>>   https://autobuild.buildroot.org/results/b9ff9258f407898eeee80dd8cc4dd1d777f44c06
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Applied to 2025.02.x, thanks.
> 
> Regards,
> Arnout

2025.02.x still has libcap 2.73. I don't think this patch should have been applied to the stable branch; libcap no longer builds successfully for me in 2025.02.2.

iliana
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
