Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66119C28B28
	for <buildroot@archiver.kernel.org>; Wed, 12 Mar 2025 10:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DAAD82EBA;
	Wed, 12 Mar 2025 10:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVqmXzqEtJle; Wed, 12 Mar 2025 10:07:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2045982ECF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2045982ECF;
	Wed, 12 Mar 2025 10:07:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19D2B1DB
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 10:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F15E660E08
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 10:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9GHrPDeDXhN for <buildroot@buildroot.org>;
 Wed, 12 Mar 2025 10:07:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6595B60600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6595B60600
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6595B60600
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 10:07:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A676043288;
 Wed, 12 Mar 2025 10:07:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tsIzk-0068Kn-37;
 Wed, 12 Mar 2025 11:07:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
References: <20250307143212.144351-1-buildroot@heine.tech>
Date: Wed, 12 Mar 2025 11:07:24 +0100
In-Reply-To: <20250307143212.144351-1-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Fri, 7 Mar 2025 15:32:09 +0100")
Message-ID: <87bju6ftpf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdegjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepledthfeguefhteffffdutdehjeejvddvvdetleelveffueevffeugeekueevkedvnecuffhomhgrihhnpehsqhhlihhtvgdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepsghuihhlughrohhotheshhgvihhnvgdrthgvtghhpdhrtghpthhtohepsggvrhhnugeskhhuhhhlshdrnhgvth
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/sqlite: json extension enabled by
 default
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@buildroot.org> writes:

 > Since SQLite 3.38 [0] the JSON extension is enabled by default.
 > A new Option was introduced to actively disable the extension. [1]

 > I chose to deprecate the old option and replace it by one to disable it.
 > This should avoid breakage for setups where the json extension is used
 > but was never actively activated.

 > - drop BR2_PACKAGE_SQLITE_ENABLE_JSON1
 > - add BR2_PACKAGE_SQLITE_ENABLE_JSON1 to the deprecation list
 > - add new option BR2_PACKAGE_SQLITE_OMIT_JSON

 > [0] https://sqlite.org/releaselog/3_38_0.html
 > [1] https://sqlite.org/json1.html#compiling_in_json_support

 > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Good catch! Having a negative option is not so nice and the JSON support
is quite small compared to the size of sqlite so I instead just
unconditionally enabled JSON support to match upstream:

-rwxr-xr-x 1 peko peko 1470368 Mar 12 10:50 output-without/target/usr/lib/libsqlite3.so.0.8.6
-rwxr-xr-x 1 peko peko 1530232 Mar 12 10:46 output-with/target/usr/lib/libsqlite3.so.0.8.6

E.G. a delta of 59864 bytes or 3.9%

Committed with that change, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
