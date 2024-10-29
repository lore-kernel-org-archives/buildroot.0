Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4883ED3A678
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 18:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF2FB80F0B;
	Tue, 29 Oct 2024 18:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5htl5RRrXi1; Tue, 29 Oct 2024 18:23:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E9580F0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06E9580F0D;
	Tue, 29 Oct 2024 18:23:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E24D494E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CE3E80F08
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uA6YdFFZXEiz for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 18:23:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7DC2A80F03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DC2A80F03
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DC2A80F03
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:23:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11D611C0002;
 Tue, 29 Oct 2024 18:23:17 +0000 (UTC)
Date: Tue, 29 Oct 2024 19:23:17 +0100
To: Ayrton Leyssens <aleyssens@idtech.be>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20241029192317.4163496b@windsurf>
In-Reply-To: <VI1PR06MB8926480FA28C325114C6C20CAD4E2@VI1PR06MB8926.eurprd06.prod.outlook.com>
References: <VI1PR06MB8926C0355B067317D6675B37AD432@VI1PR06MB8926.eurprd06.prod.outlook.com>
 <20241023225534.34ed60ff@windsurf>
 <VI1PR06MB8926480FA28C325114C6C20CAD4E2@VI1PR06MB8926.eurprd06.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730226198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpMOBjYsi4SQ8Q/BxqZ/1sMPq1QxtL/AyuG/YIaegQg=;
 b=TcZKV/snc6Yujw4JNBXofnpPz/FNFtj+F2KeIkcw4Z0B5bAn7WPb+W6Y2pE7OJxNtB7Si/
 NIq8e+cjFMm/N81+seMTTAX2oakkfsLSW9V168a+9NLTX497n8q6FIlhQKelphIzLVk094
 otaCvoefrSaLMQZEXXjdr+IFoYKU0UBX8/X2aVyt0R1TbcIIklmA7z3kZeBxpk11qkBMf8
 FQV599GgHvfvqVVutAL8x3J7WuMKDczT9pBDK4cJCl9WfC3m58q967BduTQX4xa3eAUmYs
 DSOOXZAiqThtfuQEIIFY5S906u9u2eVkeNhHVcFz5tmi8kKDHHZ+gwNaXTd+Pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TcZKV/sn
Subject: Re: [Buildroot] [PATCH 1/1] package/certmonger: add certmonger
 package
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

Hello Ayrton,

On Thu, 24 Oct 2024 10:14:04 +0000
Ayrton Leyssens <aleyssens@idtech.be> wrote:

> > Also, are you sure all those dependencies are mandatory dependencies, i.e certmonger cannot be built without them?  
>
> Unfortunately, yes.
> Like you said, Certmonger is quite a complex package and has a lot of dependencies.
> It might be possible to make 'sub-selections' but this should be something implemented by the Certmonger developers.
> I am just the messenger adding the package to Buildroot.

Sure, if those dependencies are mandatory, they are, and the Buildroot
package should reflect that. Since they were really numerous, I thought
I would ask to make sure you had looked into this carefully.

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
