Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A02CC282C6
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 19:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4798581110;
	Mon,  3 Mar 2025 19:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRi6I9e_Dt59; Mon,  3 Mar 2025 19:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 643DE81111
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 643DE81111;
	Mon,  3 Mar 2025 19:49:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02C73182
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 19:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D229F404C7
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 19:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDwrETPIykRl for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 19:49:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 518A9400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 518A9400AB
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 518A9400AB
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 19:49:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A7424433F;
 Mon,  3 Mar 2025 19:49:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tpBn7-00Dwuu-1K;
 Mon, 03 Mar 2025 20:49:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
References: <20250303144047.268530-1-yegorslists@googlemail.com>
Date: Mon, 03 Mar 2025 20:49:29 +0100
In-Reply-To: <20250303144047.268530-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Mon, 3 Mar 2025 15:40:47
 +0100")
Message-ID: <8734ftnbcm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddttddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeetgfelveffveehtdevgeefjeeiudduledtffehgefgleekteektedutdfhleeiueenucfkphepudelhedrudeivddrudekhedrvddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudelhedrudeivddrudekhedrvddupdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeihvghgohhrshhlihhsthhssehgohhoghhlvghmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/ncftp: fix
 incompatible-pointer-types error
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

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Use only stat, fstat, and lstat structures for the correspondent calls
 > and let the C library macros to pick the right structure and call
 > depending on the supported file size.

Do we have any autobuilder errors from this?

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 >  package/ncftp/0003-fix-stat.patch | 27 +++++++++++++++++++++++++++
 >  1 file changed, 27 insertions(+)
 >  create mode 100644 package/ncftp/0003-fix-stat.patch

 > diff --git a/package/ncftp/0003-fix-stat.patch b/package/ncftp/0003-fix-stat.patch
 > new file mode 100644
 > index 0000000000..8581cf546b
 > --- /dev/null
 > +++ b/package/ncftp/0003-fix-stat.patch
 > @@ -0,0 +1,27 @@
 > +Use stat, fstat, and lstat structures and let the C library handle the
 > +related structures and system calls.
 > +
 > +Upstream: N/A, unresponsive contact email address.

If upstream is dead, perhaps we should instead drop the ncftp package
given how little FTP is used nowadays?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
