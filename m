Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF14AC001E0
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 14:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E02B4031F;
	Tue,  1 Aug 2023 14:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E02B4031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sBR2M0v1jGxd; Tue,  1 Aug 2023 14:20:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D922404B2;
	Tue,  1 Aug 2023 14:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D922404B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26F5F1BF2AA
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 14:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50872402FD
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 14:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50872402FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lojOLVIRBfvI for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 14:20:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A852F408AA
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 14:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A852F408AA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82CC92000E;
 Tue,  1 Aug 2023 14:19:58 +0000 (UTC)
Date: Tue, 1 Aug 2023 16:19:56 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230801161956.00715a06@windsurf>
In-Reply-To: <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690899599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NQK6SGSgd1E65yIhEIxmdRElb4UixS3U2btLRk0XsQY=;
 b=Y/vSzHkhfnL28w/znv+A2gpYzhsRYwrl9oUXeG+izD/sNth8e0nXZXzbAoRYS8+o0Ylecx
 DORIuPeHmCtQjjtiF73+tByogZXPJRWulC1ycdsb0qyCe7qcJAqo00gSYhvMhXa1dT/Rm2
 d9gw4EUkc+/xgoA9qYjbxlyLdHZaOScNwdvO02p6fp32eMKu5mMH8fPomTr3mK1JfhtLUL
 KmIqXNQF5U6QpMbch48fJQMrGJcPjpS9pfI4Yydz1iefj75qia/0qaISD48CLUneyaolTM
 tz0+ETT+VXugqlfesY02YJTZGzsxaA56beAZmT2q2bZb9Rcamctnk/tt8oXzFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y/vSzHkh
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON
 version 2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Daniel,

On Tue, 1 Aug 2023 16:13:03 +0200
Daniel Lang <dalang@gmx.at> wrote:

> > Wow, thanks for working on this! Is the storing of 200k files workable,
> > or do we need to consider some other option like a local sqlite
> > database or something?  
> 
> From testing on my system I can say that it seems to be workable.
> Generating pkg-stats for all packages takes roughly the same time
> 
> old: ./support/scripts/pkg-stats --html old.html --nvd-path dl/buildroot-nvd/ --disable url,upstream,cpe   252,39s user 45,10s system 100% cpu 4:54,85 total
> new: ./support/scripts/pkg-stats --html new.html --nvd-path dl/buildroot-nvd/ --disable url,upstream,cpe   250,04s user 46,24s system 100% cpu 4:53,72 total

Nice!

I see you have --disable cpe. Is the CPE database unchanged on the NVD
side?

> I did consider a sqlite database given that that's the approach yocto uses.
> In the end I decided against it as I wasn't sure how future proof it would be.
> The current approach means that additional information (score, description,...)
> could be added or used for other purposes without having to download again.
> Whereas I thought I had to make a selection for the database.
> In hindsight I could have just added a column for every information available.

I'm not sure if trying to map all fields of the JSON into sqlite fields
would be relevant. In fact, we would only need some kind of key/value
store, where the key is the CVE identifier, and the value is the JSON
blob.

> If there is concern I can see with I have the time to also implement a database
> approach for comparison.

Not sure it's needed for now. The filesystem is also a good database :-)

> Not sure if updating would be faster with a database. It takes ~1.5 seconds
> on my system to save the batch of 2k CVEs to file. But I guess the main bottleneck
> is the API given that the initial download took upwards of 30 minutes during my
> test runs and only ~2.5 minutes are spend creating files.

OK.

> I did. For a 1:1 comparison the sorting on line 185 has to be changed to
> for cve_file in sorted(os.listdir(year_folder)):
> Otherwise CVEs within a package are sorted differently making a comparison
> very hard.
> Running pkg-stats with this change generates identical reports:
> 
> diff old.html new.html
> 57505c57505
> < <p><i>Updated on 2023-08-01 07:34:14.594976, git commit 22e476d7886163484d233803b42a2a4c2b588a5b</i></p>
> ---
> > <p><i>Updated on 2023-08-01 08:40:33.290711, git commit 22e476d7886163484d233803b42a2a4c2b588a5b</i></p>  

Excellent.

> One final note: I'm in no way a python expert, so any optimization or
> general input is welcome.

No problem, I'm also no a python expert at all :-)

Pending some feedback from you on the CPE question above, I think I'm
going to do some quick testing of your proposal and push it.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
