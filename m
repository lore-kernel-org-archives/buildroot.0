Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB723C54F32
	for <buildroot@archiver.kernel.org>; Sat, 24 May 2025 12:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 198C9408E1;
	Sat, 24 May 2025 12:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id udbBQlfto04v; Sat, 24 May 2025 12:23:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 157D8408E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 157D8408E3;
	Sat, 24 May 2025 12:23:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9C9168
 for <buildroot@buildroot.org>; Sat, 24 May 2025 12:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB46381349
 for <buildroot@buildroot.org>; Sat, 24 May 2025 12:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iq-PIxbT7V4Q for <buildroot@buildroot.org>;
 Sat, 24 May 2025 12:23:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9232D812F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9232D812F3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9232D812F3
 for <buildroot@buildroot.org>; Sat, 24 May 2025 12:22:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA9D81FCEB;
 Sat, 24 May 2025 12:22:56 +0000 (UTC)
Date: Sat, 24 May 2025 14:22:55 +0200
To: nvd <nvd@nist.gov>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20250524142255.36be5c43@windsurf>
In-Reply-To: <BY3PR09MB875642446D6D15414F985131ED98A@BY3PR09MB8756.namprd09.prod.outlook.com>
References: <20250517181815.02ce0393@windsurf>
 <BY3PR09MB875642446D6D15414F985131ED98A@BY3PR09MB8756.namprd09.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -6
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduudejudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucgfrhhlucfvnfffucdlqdeimdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeeffeeuheefjeffgfevvdekudehffdugeetfefgteegtddtfffggffhtddtkeevnecuffhomhgrihhnpeguohhvvggtohhtrdhorhhgpdhgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepledvrddvgeehrdduvdekrdduheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddvgeehrdduvdekrdduheegpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepnhhvugesnhhishhtrdhgohhvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748089376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7sfN/+UagBZBYgVLYjdGMPQUU4ng2xsdjZspPxORZwE=;
 b=gsRVsqe4acvDGWTSq2kBT2uEBmAfoJCxZX0jle21reSUmQoi1C/D7Jxn25zYBwG2GX0vEU
 tpLrJIxmzKdMxBxIeKMfoighJdh7DrmTcaJ8DrQ51prwLENbpI3EJltiJzQzLVCfPTCeQA
 BlMrW92gZg706A7AiS2oQB2Ec5JpRW8IjYjI9isBJooEMr6j4yhZxSF1Qit4rsX1DtoYqG
 SRrtZlFTNcBpIAO8J4REZYGixl6FK0I9ejV7NMqw5gfYYKCtbzOWQdNFarMXXhIh2oqr0X
 7cH7+QaH6c3O7hmhBAM7XdplmvwBWdrhmmlbxKNH0cQl5gWn7E+ZYrxcqG06DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gsRVsqe4
Subject: Re: [Buildroot] CVE-2022-30550 version range fix
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

Hello Benjamin,

Thanks for the feedback, much appreciated, and thanks for taking into
account the feedback. At the end of your e-mail, you said "For CPE
related inquiries we request that you send them to
cpe_dictionary@nist.gov", does that mean that some of my requests
should have been sent to cpe_dictionary@nist.gov instead, and if so
which ones?

Perhaps you are referring to my request:

	Subject: Numerous issues in CVEs for the "sox" project

 ?

Could you clarify, so that I can make sure I send my requests to the
right contact?

Thanks a lot this effort on maintaining the NVD!

Best regards,

Thomas

On Fri, 23 May 2025 16:53:39 +0000
nvd <nvd@nist.gov> wrote:

> Good Afternoon,
> 
> Thank you for bringing this to our attention. We appreciate community input in order to provide the most accurate and up-to-date information as possible. After reviewing publicly available information we have made the appropriate modifications to the configuration to list version 2.4.0 as the fixed version. Please allow up to 24 hours for the changes to be reflected on the website and in the data feeds.
> 
> For CPE related inquiries we request that you send them to cpe_dictionary@nist.gov.
> 
> V/r,
> Benjamin Wells
> National Vulnerability Database Team
> National Institute of Standards and Technology (NIST)
> nvd@nist.gov
> 
> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Saturday, May 17, 2025 12:18 PM
> To: nvd <nvd@nist.gov>
> Cc: buildroot@buildroot.org
> Subject: CVE-2022-30550 version range fix
> 
> Hello,
> 
> CVE-2022-30550 is documented in your database as affecting versions of dovecot up to 2.3.20.
> 
> However, according to
> https://dovecot.org/pipermail/dovecot-news/2022-July/000477.html, the fix for this issue is:
> 
>   https://github.com/dovecot/core/compare/7bad6a24%5E..a1022072.patch
> 
> And this commit is only in Dovecot 2.4.0, which means that versions 2.3.21, 2.3.21.1 are affected.
> 
> Here is some additional evidence based on the Git repository of Dovecot:
> 
> $ git log --format=oneline 2.3.21  | grep "auth: Fix handling passdbs with identical driver/args but"
> $
> 
> So 2.3.21 doesn't have the fix.
> 
> $ git log --format=oneline 2.3.21.1  | grep "auth: Fix handling passdbs with identical driver/args but"
> $
> 
> So 2.3.21.1 doesn't have the fix.
> 
> $ git log --format=oneline 2.4.0  | grep "auth: Fix handling passdbs with identical driver/args but"
> 7bad6a24160e34bce8f10e73dbbf9e5fbbcd1904 auth: Fix handling passdbs with identical driver/args but different mechanisms/username_filter
> 
> Which means that 2.4.0 has the fix.
> 
> Therefore, your entry for CVE-2022-30550 should be fixed to indicate that versions up to (excluding) 2.4.0 are affected.
> 
> Thanks for your great work on maintaining this database! It would be create to have a public issue tracker to report issues.
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training
> https://bootlin.com/



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
