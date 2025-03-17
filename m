Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787F8C282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 17:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29C0060A99;
	Mon, 17 Mar 2025 17:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NC6k-KVreReV; Mon, 17 Mar 2025 17:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D3D960AA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D3D960AA0;
	Mon, 17 Mar 2025 17:31:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98F0212E
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BF63405DD
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3WOGLnWXxzO for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 17:31:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3022540A1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3022540A1B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3022540A1B
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:31:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 652564417C;
 Mon, 17 Mar 2025 17:31:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tuEJI-000LTe-2U;
 Mon, 17 Mar 2025 18:31:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Pedro Aguilar <paguilar@paguilar.org>
Cc: buildroot@buildroot.org
References: <20250316215400.6001-1-paguilar@paguilar.org>
Date: Mon, 17 Mar 2025 18:31:32 +0100
In-Reply-To: <20250316215400.6001-1-paguilar@paguilar.org> (Pedro Aguilar's
 message of "Sun, 16 Mar 2025 22:54:00 +0100")
Message-ID: <87ldt3a7ij.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfefgheefledvfffgledujeefiedvjeeigfffteevheekgfejfeevhfeiheehjeeknecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepphgrghhuihhlrghrsehprghguhhilhgrrhdrohhrghdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libunistring: Skip 'tests' dir
 when building
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

>>>>> "Pedro" == Pedro Aguilar <paguilar@paguilar.org> writes:

 > The tests/ dir gives different types of linking errors when building
 > under different archs and with different C libs such as libc and musl.
 > This dir is not necessary when building and it can be safely skipped,
 > so let's remove it from the building process.

 > This fixes the building errors reported here:
 > https://autobuild.buildroot.org/results/770ac5653ee832a9117a7cd288a193750dfcfe29
 > https://autobuild.buildroot.org/results/a31d608388b0ff28334f674baeb501b023bdb4bf
 > https://autobuild.buildroot.org/results/f5a833a3dcd7094290fcbc6b8989620749bc6316
 > https://autobuild.buildroot.org/results/b572db1524de16006d55a42dca43a0a500f78ed0
 > https://autobuild.buildroot.org/results/a155a54b30f6cb02d74687992088f543fa63cb74
 > https://autobuild.buildroot.org/results/dfe061ddaa9ef0b6e39b2da20858baa36ae1fca2

 > Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Thanks. How about instead adding a --disable-tests option so this patch
can be upstreamed?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
