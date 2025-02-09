Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63602C0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 21:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BAE1411F8;
	Sun,  9 Feb 2025 21:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTYAGdRgJCsd; Sun,  9 Feb 2025 21:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2C554124F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2C554124F;
	Sun,  9 Feb 2025 21:22:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A0D9C2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EBE3411F8
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFXspt11SkGM for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 21:22:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E67C841251
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E67C841251
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E67C841251
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:22:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9BDB44492;
 Sun,  9 Feb 2025 21:22:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1thEkh-004UrJ-2t;
 Sun, 09 Feb 2025 22:22:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
References: <20250206072321.677851-1-peter@korsgaard.com>
 <20250206072321.677851-4-peter@korsgaard.com>
 <e7c06d15-5581-4a26-abfa-5a826e181108@smile.fr>
 <87o6zfigx8.fsf@dell.be.48ers.dk>
 <a8708234-3072-4d64-a5d0-ede868cde110@smile.fr>
 <87ikpni1fz.fsf@dell.be.48ers.dk>
Date: Sun, 09 Feb 2025 22:22:07 +0100
In-Reply-To: <87ikpni1fz.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 06 Feb 2025 15:37:36 +0100")
Message-ID: <87pljq6cg0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefiedvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeetgfelveffveehtdevgeefjeeiudduledtffehgefgleekteektedutdfhleeiueenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 4/4] .gitlab-ci.yml: use Debian 12-based
 container image with curl / tar 1.35
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:
 > Hi,

 >>> Sure, how do we trigger a test run before merging to master?

 >> Last time I used my personal gitlab fork to trigger a new pipeline and local
 >> builds when gitlab-ci minutes was exhausted... but it takes a lot of time.

 >> I guess you needs some volunteers to tests this update.

 >> Is it ok to push a testing branch to trigger a pipeline for the runtime tests?

 > Yes please (I see you alredy did) - Thanks!

With the basic shellcheck and flake8 issues fixed I have now
rebuilt/repushed the container and applied the series, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
