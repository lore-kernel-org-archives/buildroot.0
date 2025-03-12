Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E6FC28B28
	for <buildroot@archiver.kernel.org>; Wed, 12 Mar 2025 18:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FC6881D2D;
	Wed, 12 Mar 2025 18:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pdyni3NJuXqh; Wed, 12 Mar 2025 18:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE64D81767
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE64D81767;
	Wed, 12 Mar 2025 18:15:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 305671DB
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 18:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14B4F40E21
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 18:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYlwDriEVmU7 for <buildroot@buildroot.org>;
 Wed, 12 Mar 2025 18:15:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A00140874
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A00140874
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A00140874
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 18:15:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C224D442BC;
 Wed, 12 Mar 2025 18:14:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tsQbZ-007nyB-1K;
 Wed, 12 Mar 2025 19:14:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Daniel Palmer <daniel@0x0f.com>
References: <20250311101153.3567108-1-daniel@0x0f.com>
 <87ikofamtq.fsf@tarshish>
 <CAFr9PXmah3aNpH_LNf34QpkYxF7r2YD4yYRosFRid+5B8S4YTw@mail.gmail.com>
Date: Wed, 12 Mar 2025 19:14:57 +0100
In-Reply-To: <CAFr9PXmah3aNpH_LNf34QpkYxF7r2YD4yYRosFRid+5B8S4YTw@mail.gmail.com>
 (Daniel Palmer's message of "Tue, 11 Mar 2025 20:01:02 +0900")
Message-ID: <87wmcudske.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdehjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfefgheefledvfffgledujeefiedvjeeigfffteevheekgfejfeevhfeiheehjeeknecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepuggrnhhivghlsedtgidtfhdrtghomhdprhgtphhtthhopegsrghruhgthhesthhkohhsrdgtohdrihhlpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/musl: Add upstream patch to fix
 building strace on m68k
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Daniel" == Daniel Palmer <daniel@0x0f.com> writes:

Hi,

 >> You should add your sign-off and an upstream tags here.
 >> 
 >> See the manual:
 >> 
 >> https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches

 > Ok, I'll look into that and resend.

I took the liberty to fix these things up myself (including your s-o-b)
and applied as I would like to release -rc2 today.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
