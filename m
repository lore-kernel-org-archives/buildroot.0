Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F217C5B552
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 07:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA38406F2;
	Wed,  4 Jun 2025 07:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5PIAMY40wTM; Wed,  4 Jun 2025 07:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A77D406C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A77D406C9;
	Wed,  4 Jun 2025 07:36:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28C7C1A4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 07:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A805406C9
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 07:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuKxoxSo2Sma for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 07:36:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0CA1A406BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CA1A406BA
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CA1A406BA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 07:36:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96215439AD;
 Wed,  4 Jun 2025 07:36:19 +0000 (UTC)
Date: Wed, 4 Jun 2025 09:36:17 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250604093617.3ceede2f@booty>
In-Reply-To: <20250603134812.2883296-1-neal.frager@amd.com>
References: <20250603134812.2883296-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudelueefhfeuheelfffhgefhuedugedvteegtdfhudekleevgeejffejleekkeejnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1749022581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzNBxYZePpoP4QHV+oIoYYsKpNCdGYTdYJU9dGPFc94=;
 b=RaR26raXiCsTCkmR3cgA4B20CEpuJbp1/FJ8IIOg1A/B4PdKMkM5q5HdaIc/0rIWYR+CUP
 Qf8Q4KgbHR1757L3vGLOqHoD/0fayjSvA56o0dXj+vq1SpW2rxIy2fSDWoyItfy2ouldYM
 9HkSQXKOHLPCIEjwWHJNgLZ+v4UkCXhya11vVY2vczitUAEXi2SDFH2RbNdQ/Eh6zK5+tk
 8NKjr/9lCy/gi0Fjrei1O7dTc2ldfOlO32J2x02Hyoj1mLzrIFk8ZxZgZH/VBlnQHYPedu
 +Cq6P33Pf1YRz66Dtn5czT3CS8LmBsxO3Dw90fPdlN5qUyYWdu8Jn5e6PKW0QQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RaR26raX
Subject: Re: [Buildroot] [PATCH v2 1/1] package/bootgen: Re-apply fix build
 on machines with modern flex
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, buildroot@buildroot.org,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 3 Jun 2025 14:48:12 +0100
Neal Frager <neal.frager@amd.com> wrote:

> With bootgen 2025.1, the directory structure was re-done.  In the process of
> doing this, the source files in the bisonflex directory lost the fix below
> which had been applied on an earlier version of bootgen for the issue below.
> 
> Bootgen embeds an old version of flex, but uses the system include syntax
> (#include <>) to reference it, causing conflicts on systems with the
> development headers for a modern flex version installed, leading to build
> issues like:
> 
> ../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
> ../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream'} and 'std::istream*' {aka 'std::basic_istream*'})
> 
> Fix it by using normal local #include statements by:
> 
> sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
> 
> This patch re-adds the patch to fix this to buildroot.
> 
> Fixes: https://autobuild.buildroot.org/results/056384322246877253cd8d0781717ce495cbe769/
> Upstream: patch submitted to AMD internal jira process
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Note this is for next, where the version bump is.

Reviewed-By: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
