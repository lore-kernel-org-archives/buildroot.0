Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF37C61CE7
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 08:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 062C4422A7;
	Wed, 11 Jun 2025 08:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBLIFrwU-Oiq; Wed, 11 Jun 2025 08:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A82342287
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A82342287;
	Wed, 11 Jun 2025 08:33:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8025B1F2
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 08:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 666036084B
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 08:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNCbLJauqMUE for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 08:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BEEA60760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BEEA60760
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BEEA60760
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 08:33:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42C87431DA;
 Wed, 11 Jun 2025 08:33:31 +0000 (UTC)
Date: Wed, 11 Jun 2025 10:33:30 +0200
To: nvd <nvd@nist.gov>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20250611103330.55726451@windsurf>
In-Reply-To: <PH0PR09MB8763C94ABBA656291F0FD84DED6AA@PH0PR09MB8763.namprd09.prod.outlook.com>
References: <20250517181815.02ce0393@windsurf>
 <BY3PR09MB875642446D6D15414F985131ED98A@BY3PR09MB8756.namprd09.prod.outlook.com>
 <20250524142255.36be5c43@windsurf>
 <PH0PR09MB8763C94ABBA656291F0FD84DED6AA@PH0PR09MB8763.namprd09.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -6
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucgfrhhlucfvnfffucdlqdeimdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueethfejhfdvtdegueefffelvefhjefgudfgtdelhffgffeifffhkefhvedtjeeunecuffhomhgrihhnpeguohhvvggtohhtrdhorhhgpdhgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepnhhvugesnhhishhtrdhgohhvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1749630811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fyq5+x9I6/yOuFsESwS8kO7f6v5smmPIipl362Zkay0=;
 b=GrL7e7GYSw/pvsC0FW9ub8WmBCNYXUOI5RYCpaStblqq2zBD8w1hRj4mRmz5bfZmSX+wWc
 qa2UF1fVoahvXFjUuGJmRhUHrX1JrQxN6HS08P1+Hr3jwQsFLdNMSiddeg9l6nJzoLXdxg
 lJ3mzpVwdzJ8+INhAk94iuBewcEEVY5lwyb2QjYFThjgOhflzJSnXT8T2azc4zNfPZXxgu
 50rVyN3Xs+pRNQlcyJ5H87sn2oFjCKphrKoiTO+JWztbV6qfe/TSjR0iwFAhcrLvcui7KX
 /MDxBDpYWwudMPIWDmxY6j22DQV2faIPvoJCGlC9FksnB5GfTvgkA1YN521ejQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GrL7e7GY
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

Hello,

I'm still not clear what are CVE inquiries vs. CPE inquiries. My
inquiry here was regarding a CVE, so to me it made sense to report it
to you as the way to fix the issue was to fix a CVE report.

Could you clarify so that I can address any future report to the
correct entity?

Thanks a lot for your support!

Thomas

On Tue, 10 Jun 2025 20:01:10 +0000
nvd <nvd@nist.gov> wrote:

> Good Afternoon,
> 
> We have requested that you kindly direct your CPE inquiries to cpe_dictionary@nist.gov in the future.  Thank you for your previous email inquiries.  We would like to confirm that we have received the same and will be addressing them as time and resources allow.
> 
> V/r,
> Benjamin Wells
> National Vulnerability Database Team
> National Institute of Standards and Technology (NIST)
> nvd@nist.gov
> 
> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Saturday, May 24, 2025 8:23 AM
> To: nvd <nvd@nist.gov>
> Cc: buildroot@buildroot.org
> Subject: Re: CVE-2022-30550 version range fix
> 
> Hello Benjamin,
> 
> Thanks for the feedback, much appreciated, and thanks for taking into account the feedback. At the end of your e-mail, you said "For CPE related inquiries we request that you send them to cpe_dictionary@nist.gov", does that mean that some of my requests should have been sent to cpe_dictionary@nist.gov instead, and if so which ones?
> 
> Perhaps you are referring to my request:
> 
>         Subject: Numerous issues in CVEs for the "sox" project
> 
>  ?
> 
> Could you clarify, so that I can make sure I send my requests to the right contact?
> 
> Thanks a lot this effort on maintaining the NVD!
> 
> Best regards,
> 
> Thomas
> 
> On Fri, 23 May 2025 16:53:39 +0000
> nvd <nvd@nist.gov> wrote:
> 
> > Good Afternoon,
> >
> > Thank you for bringing this to our attention. We appreciate community input in order to provide the most accurate and up-to-date information as possible. After reviewing publicly available information we have made the appropriate modifications to the configuration to list version 2.4.0 as the fixed version. Please allow up to 24 hours for the changes to be reflected on the website and in the data feeds.
> >
> > For CPE related inquiries we request that you send them to cpe_dictionary@nist.gov.
> >
> > V/r,
> > Benjamin Wells
> > National Vulnerability Database Team
> > National Institute of Standards and Technology (NIST) nvd@nist.gov
> >
> > -----Original Message-----
> > From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Sent: Saturday, May 17, 2025 12:18 PM
> > To: nvd <nvd@nist.gov>
> > Cc: buildroot@buildroot.org
> > Subject: CVE-2022-30550 version range fix
> >
> > Hello,
> >
> > CVE-2022-30550 is documented in your database as affecting versions of dovecot up to 2.3.20.
> >
> > However, according to
> > https://dovecot.org/pipermail/dovecot-news/2022-July/000477.html, the fix for this issue is:
> >
> >   https://github.com/dovecot/core/compare/7bad6a24%5E..a1022072.patch
> >
> > And this commit is only in Dovecot 2.4.0, which means that versions 2.3.21, 2.3.21.1 are affected.
> >
> > Here is some additional evidence based on the Git repository of Dovecot:
> >
> > $ git log --format=oneline 2.3.21  | grep "auth: Fix handling passdbs with identical driver/args but"
> > $
> >
> > So 2.3.21 doesn't have the fix.
> >
> > $ git log --format=oneline 2.3.21.1  | grep "auth: Fix handling passdbs with identical driver/args but"
> > $
> >
> > So 2.3.21.1 doesn't have the fix.
> >
> > $ git log --format=oneline 2.4.0  | grep "auth: Fix handling passdbs with identical driver/args but"
> > 7bad6a24160e34bce8f10e73dbbf9e5fbbcd1904 auth: Fix handling passdbs
> > with identical driver/args but different mechanisms/username_filter
> >
> > Which means that 2.4.0 has the fix.
> >
> > Therefore, your entry for CVE-2022-30550 should be fixed to indicate that versions up to (excluding) 2.4.0 are affected.
> >
> > Thanks for your great work on maintaining this database! It would be create to have a public issue tracker to report issues.
> >
> > Thomas
> > --
> > Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel
> > engineering and training
> > https://boot/
> > lin.com%2F&data=05%7C02%7Cnvd%40nist.gov%7Cf24def78fb57460b488c08dd9ab
> > db7dc%7C2ab5d82fd8fa4797a93e054655c61dec%7C0%7C0%7C638836861810040456%
> > 7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIl
> > AiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=M7H0
> > VkI9xtExvankInTYrtxX4bVat%2FPe0AfogQMt2bg%3D&reserved=0  
> 
> 
> 
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
