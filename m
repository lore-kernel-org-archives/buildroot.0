Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B94C02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 13:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90CD142501;
	Wed, 12 Feb 2025 13:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4i4HpeeWdBh; Wed, 12 Feb 2025 13:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 852C84250A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 852C84250A;
	Wed, 12 Feb 2025 13:17:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B6A6194
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3C3A81EF9
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_VPo__NmhOw for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 13:17:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1ED8981149
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ED8981149
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1ED8981149
 for <buildroot@uclibc.org>; Wed, 12 Feb 2025 13:17:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 454DD581A98
 for <buildroot@uclibc.org>; Wed, 12 Feb 2025 12:52:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 941AF43302;
 Wed, 12 Feb 2025 12:52:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tiCEF-00AmH3-30;
 Wed, 12 Feb 2025 13:52:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Scott Fan <fancp2007@gmail.com>
Cc: Bernd Kuhls <bernd@kuhls.net>,  buildroot@uclibc.org
References: <20250210022648.1634973-1-fancp2007__48543.0357208074$1739154457$gmane$org@gmail.com>
 <pan$2c183$bf7fddbb$580230b4$48c2eea8@ID-313208.user.individual.net>
 <CAFkzVZas4H_PYmmSkhVAiQjBfzZzdSF8EcgAVEn=6JE_bVv1yQ@mail.gmail.com>
Date: Wed, 12 Feb 2025 13:52:35 +0100
In-Reply-To: <CAFkzVZas4H_PYmmSkhVAiQjBfzZzdSF8EcgAVEn=6JE_bVv1yQ@mail.gmail.com>
 (Scott Fan's message of "Wed, 12 Feb 2025 14:04:21 +0800")
Message-ID: <871pw31g18.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfeelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeetgfelveffveehtdevgeefjeeiudduledtffehgefgleekteektedutdfhleeiueenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehfrghntghpvddttdejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsggvrhhnugeskhhuhhhlshdrnhgvthdprhgtphhtthhopegsuhhilhgurhhoohhtsehutghlihgstgdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/sqlite: bump version to 3.49.0
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

>>>>> "Scott" == Scott Fan <fancp2007@gmail.com> writes:

 > When I found the compilation error message, I immediately changed the
 > patch that had been sent to patchwork to the Changes Requested state
 > to prevent it from being merged into the mainline, but I don't know
 > why it was finally merged.

For the future please send a message explaining why this was done. I
asked around with the other co-maintainers and ended up with the (wrong)
conclusion that it was marked as changes requested by accident.

Have you had a look at how to fix the issue or should I revert?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
