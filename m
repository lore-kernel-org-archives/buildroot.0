Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D7DC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 06:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15EDF813CC;
	Sun, 18 May 2025 06:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gymEVTQxjUhc; Sun, 18 May 2025 06:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55BCF812BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55BCF812BE;
	Sun, 18 May 2025 06:32:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9E521C9
 for <buildroot@buildroot.org>; Sun, 18 May 2025 06:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFC8E812BE
 for <buildroot@buildroot.org>; Sun, 18 May 2025 06:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRUA-C8H8wmJ for <buildroot@buildroot.org>;
 Sun, 18 May 2025 06:32:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BB7281296
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BB7281296
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BB7281296
 for <buildroot@buildroot.org>; Sun, 18 May 2025 06:32:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10B70439BB;
 Sun, 18 May 2025 06:32:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uGXZM-00GIRZ-1U;
 Sun, 18 May 2025 08:32:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
Cc: <buildroot@buildroot.org>,  Christian Stewart <christian@aperture.us>
References: <cover.1742563913.git.yann.morin@orange.com>
 <4f04943a9577907f282808c70b4a5d62df2ff32b.1742563913.git.yann.morin@orange.com>
Date: Sun, 18 May 2025 08:32:20 +0200
In-Reply-To: <4f04943a9577907f282808c70b4a5d62df2ff32b.1742563913.git.yann.morin@orange.com>
 (yann morin's message of "Fri, 21 Mar 2025 14:32:09 +0100")
Message-ID: <87iklywhsb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudejjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfefgheefledvfffgledujeefiedvjeeigfffteevheekgfejfeevhfeiheehjeeknecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggshedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohephigrnhhnrdhmohhrihhnsehorhgrnhhgvgdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheptghhrhhishhtihgrnhesrghpv
 ghrthhurhgvrdhush
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/4] package/amazon-ecr-credential-helper:
 new package
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

>>>>>   <yann.morin@orange.com> writes:

Hi Yann,

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Christian Stewart <christian@aperture.us>

This is causing some build failures, E.G.:

https://autobuild.buildroot.org/results/3281c05ff5b98ab6381093076e4a8cfb5f9ff8b0/

I noticed that you had forgotten to add yourself in DEVELOPERS for these
packages so you are not notified. Care to send a patch to update
DEVELOPERS?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
