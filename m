Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2FCC87FD2
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 09:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D92C83D8A;
	Mon, 11 Aug 2025 09:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 91t3E8RS-MOL; Mon, 11 Aug 2025 09:23:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B79483B90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B79483B90;
	Mon, 11 Aug 2025 09:23:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7A9D138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B93EC83C01
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNLL3Q5WxsQC for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 09:23:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8AC3A83B90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AC3A83B90
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AC3A83B90
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:23:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1128336917; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Aug 2025 09:23:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ulOk7-0082Wv-2f;
 Mon, 11 Aug 2025 11:22:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  "Frager, Neal"
 <neal.frager@amd.com>,  "romain.naour@gmail.com" <romain.naour@gmail.com>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,  "ju.o@free.fr" <ju.o@free.fr>
References: <20250728045145.132333-1-neal.frager@amd.com>
 <20250804214047.5cfcf471@windsurf>
 <SA1PR12MB5615611A10ADA56A9816AAB7F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250805100953.380f13df@windsurf>
 <SA1PR12MB5615E2ACED00D66546CC13E7F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250805125846.31c941c1@windsurf> <20250806221745.03c267a0@windsurf>
 <SA1PR12MB5615011C2D74AFE14B29CE08F028A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250811101209.001faf6a@windsurf>
 <SA1PR12MB5615BF7BD79B49730E8E7CE8F028A@SA1PR12MB5615.namprd12.prod.outlook.com>
Date: Mon, 11 Aug 2025 11:22:59 +0200
In-Reply-To: <SA1PR12MB5615BF7BD79B49730E8E7CE8F028A@SA1PR12MB5615.namprd12.prod.outlook.com>
 (Neal via buildroot Frager's message of "Mon, 11 Aug 2025 08:33:48
 +0000")
Message-ID: <87jz3anrf0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=UcTdolZE8whi4sULR//eof1PrkfIVxl2q6wmY+qxK6Y8ac4exkR1lsAHbOMn2OdaAy6sZKtw8jrM4iyt/pRaD01NSwYPO0mYPG2/UFbRXDZk+uZFgfHQ/w2kmKcnr6aMudW8xg/zsqtjE0EDTgMV5U4s6/swR5w4LuyjbPAemn8ej2D1PpXFZxk3CzTJkq1VOzkEk4RDaVIPe/pXzIDktKZeWIthNg4EeiMg3KXk7+xujeADd4NklfFue62P1jgBBu4VHSzZkV+F6m8ZtfiCk53N50jlTx9dXs+86nfnfnlLLW446y3+bLw/WOgBERRK30zp8kneOJlSUd9jRsR6DA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=H/8Yz4noa9wM6wvvJfU5H33JF0DrJC5WHMTW/XMEWPg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=UcTdolZE
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze atomic
 support
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

>>>>> "Frager," == Frager, Neal via buildroot <buildroot@buildroot.org> writes:

 > [AMD Official Use Only - AMD Internal Distribution Only]
 > Hi Thomas,

 >> You guys are amazing!
 >> 
 >> I was planning to start working on this today, but you have not only already
 >> created a work around, but have basically shared everything the gcc team
 >> should need to fix the issue correctly.

 >> Well, not yet. They are still waiting for me to share the irq.i
 >> before/after the problematic GCC commit. So we have for now pointed at
 >> the issue, but not actually provided enough information to fix it.

 > Ok sure, but the hard part is done already.  You have narrowed the issue down
 > to a single c file which by chance is fairly short.

 > If one of them wanted to, they could create the irq.i files and handle the
 > rest.

 > I am still impressed!  Great work!

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
