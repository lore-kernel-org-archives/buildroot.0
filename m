Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822C9C28B2F
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 17:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BDAE60B05;
	Tue, 11 Mar 2025 17:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXy1m75Z2TNp; Tue, 11 Mar 2025 17:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4374060B52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4374060B52;
	Tue, 11 Mar 2025 17:50:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F107A1C8
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 17:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E05E08193E
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 17:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-NJjvR4WpJ3 for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 17:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF35D81948
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF35D81948
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF35D81948
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 17:50:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A4664428D;
 Tue, 11 Mar 2025 17:50:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ts3jw-0040iH-20;
 Tue, 11 Mar 2025 18:50:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250310204745.417175-1-ju.o@free.fr>
Date: Tue, 11 Mar 2025 18:50:04 +0100
In-Reply-To: <20250310204745.417175-1-ju.o@free.fr> (Julien Olivain's message
 of "Mon, 10 Mar 2025 21:47:45 +0100")
Message-ID: <87tt7zfodv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeehuedvgeefffdvkeekudekjeetvdetffffgfejudevieevhfffjeegveeutdelueenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhgihhtlhgrsgdrtghomhenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH next 1/1] package/fluidsynth: bump to
 version 2.4.3
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > For change log since v2.4.2, see:
 > https://github.com/FluidSynth/fluidsynth/releases/tag/v2.4.3

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested in:
 > https://gitlab.com/jolivain/buildroot/-/jobs/9366614500

Given the regression fixes mentioned in the changelog I committed this
to master instead, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
