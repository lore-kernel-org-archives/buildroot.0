Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540ACC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 20:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2369409D0;
	Sat, 17 May 2025 20:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWlSr6iPnPJr; Sat, 17 May 2025 20:54:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08BF44085F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08BF44085F;
	Sat, 17 May 2025 20:54:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE1DE4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F423681F4E
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcHct-W4Asl4 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 20:54:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFBDF81CA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFBDF81CA0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFBDF81CA0
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:54:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A35043A31;
 Sat, 17 May 2025 20:54:06 +0000 (UTC)
Date: Sat, 17 May 2025 22:54:05 +0200
To: nvd <nvd@nist.gov>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20250517225405.4d8fb0fe@windsurf>
In-Reply-To: <20250517220322.4da9bdb3@windsurf>
References: <20250517220322.4da9bdb3@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 49
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeiieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeffffeitdevteffueevjedujeekveefffettdefgfeiueejjeeguddtgefhgeegnecuffhomhgrihhnpehsohhurhgtvghfohhrghgvrdhnvghtpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehnvhgusehnihhsthdrghhovhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747515246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P2+iiL4zIn2cQMCxI2EG3SeqpcAChMIX3XAM94C6KVw=;
 b=JntxpBaUODw5sEvPJ5zU36PD17J71xzpj/nG2JUAMG+OFRPJEePdkHIIVPv8lCfiTqcgsE
 klZdJ1ukGYOoXKMyaFdKYHIMCYX24V4ES6LHYMBDOarTRghw5/8bOJHLEN3MilquWeObwN
 Rr/oYMXraX3XLCaC/knB4blO+VD51FBteTQXdVt9iL8PObEnsZ10wX3GXbS6qXWEz47TsJ
 h04oJ9i9nChsg8Sn7HgmOOW4Zb6AS1mNcy8mvy5hSK/JxZoeeMhIjA5V30p/92EXQV5QXM
 EvfQrbfQv3PaAvftH08j1OIMxccrx6nE9c+dvHbb4ucNcX8OkmTMKZxe0186Xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JntxpBaU
Subject: Re: [Buildroot] Numerous issues in CVEs for the "sox" project
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello (again),

I'm following up on this, because the naming situation is even worse as
I just discovered CVE-2021-40426 who also affects sox, but is using yet
another CPE identifier: libsox_project:libsox.

This further justifies a cleanup in the naming of the sox project in
terms of CPE identifiers.

Let me know if you have any questions!

Best regards,

Thomas

On Sat, 17 May 2025 22:03:22 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> I am contacting you to report a significant number of issues related to
> the annotation on CVEs reported against the "sox" project in the NVD
> database.
> 
> Naming change
> =============
> 
> The CPE ID used to identify the project used to be
> sound_exchange_project:sound_exchange, and then got changed in the
> middle to sox_project:sox. This is extremely annoying for consumers of
> the NVD data as they can't match against a single CPE identifier. When
> you do such renames, either the old entries should be amended to also
> have a CPE configuration with the new name, or the new entries should
> have a CPE configuration with the old name.
> 
> Regardless of this, the "cut" in the renaming is anyway bogus. CVEs
> with the old sound_exchange_project:sound_exchange identifier:
> 
> CVE-2014-8145
> CVE-2017-11332
> CVE-2017-11358
> CVE-2017-11359
> CVE-2017-15370
> CVE-2017-15371
> CVE-2017-15372
> CVE-2017-15642
> CVE-2017-18189
> CVE-2019-1010004
> CVE-2019-13590
> CVE-2019-8354
> CVE-2019-8355
> CVE-2019-8356
> CVE-2019-8357
> CVE-2023-34432
> 
> So it was used from 2014 to 2019... and then an outlier in 2023.
> 
> Then CVEs with the new sox_project:sox identifier:
> 
> CVE-2021-23159
> CVE-2021-23172
> CVE-2021-23210
> CVE-2021-33844
> CVE-2021-3643
> CVE-2022-31650
> CVE-2022-31651
> CVE-2023-26590
> CVE-2023-32627
> CVE-2023-34318
> 
> So it started being used in 2021... but that means CVE-2023-34432 is
> clearly bogus.
> 
> CPE identifiers with incorrect versions
> =======================================
> 
> CVE-2021-23159
> CVE-2021-23172
> CVE-2021-23210
> CVE-2021-33844
> 
> are reported as affecting version 14.4.2-7 but that version doesn't
> exist in the upstream sox project. 14.4.2 does and most likely should
> be used here. 14.4.2-7 looks like a Debian-specific version, but does
> not make any sense in this context.
> 
> CVE-2023-26590
> CVE-2023-32627
> CVE-2023-34318
> 
> are reported as affecting version 14.4.3, but that version doesn't
> exist in the upstream sox project.
> 
> See at https://sourceforge.net/projects/sox/files/sox/ the released
> versions of sox.
> 
> CPE identifiers should use version ranges
> =========================================
> 
> All of:
> 
> CVE-2017-11332
> CVE-2017-11358
> CVE-2017-11359
> CVE-2017-15370
> CVE-2017-15371
> CVE-2017-15372
> CVE-2017-15642
> CVE-2019-13590
> CVE-2019-8354
> CVE-2019-8355
> CVE-2019-8356
> CVE-2019-8357
> CVE-2021-23159
> CVE-2021-23172
> CVE-2021-23210
> CVE-2021-33844
> CVE-2021-3643
> CVE-2022-31650
> CVE-2022-31651
> CVE-2023-26590
> CVE-2023-32627
> CVE-2023-34318
> 
> pretend that only one specific version is affected by the CVE (14.4.2,
> 14.4.2-7, 14.4.1, 14.4.3), while nothing indicates that just this
> version is affected. Most likely earlier versions are affected as well,
> and therefore the CPE identifier should rather state that all versions
> up to and including 14.4.2 are affected.
> 
> Do you think you could address those different issues in the NVD
> database?
> 
> Thanks a lot for your support!
> 
> Thomas Petazzoni



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
