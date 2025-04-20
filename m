Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF45C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 21:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0321040575;
	Sun, 20 Apr 2025 21:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMfJm7hP9JON; Sun, 20 Apr 2025 21:13:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21B64406FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21B64406FD;
	Sun, 20 Apr 2025 21:13:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FB441C0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85AE980DEC
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAa--Ft8HoWG for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 21:13:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A5E980DDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A5E980DDA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A5E980DDA
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:13:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3530E43A74;
 Sun, 20 Apr 2025 21:13:28 +0000 (UTC)
Date: Sun, 20 Apr 2025 23:13:27 +0200
To: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20250420231327.3fbef9ec@windsurf>
In-Reply-To: <20250331233726.3730509-3-daniel.crowe@maxmine.com.au>
References: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
 <20250331233726.3730509-3-daniel.crowe@maxmine.com.au>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeekleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffffieefhfegvedvieduueelfeegtedvieffteduleettdetudejvdduudehheeinecuffhomhgrihhnpegsihhtsghutghkvghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegurghnihgvlhdrtghrohifvgesmhgrgihmihhnvgdrtghomhdrrghupdhrtghpthhtohepsghuihhlughrohhothessghuihhlu
 ghrohhothdrohhrghdprhgtphhtthhopehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745183609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFsX6YlFYwKFD3cA3vqBFteXoj9+Dy9MJW5P37yRxzM=;
 b=cDkH5wn+rJNYiJ1oBxcKwdmVlsg59D0vuT6fcKwXfkGJPAARSo4SuLLx354cjAR4eCkTo7
 Bh+ya4F9yTN5dCwz839LqwSl+jeLGvMQu+AqvEvmjwD1HFsltq4DJU3IncssIrwxzkQE4F
 ah/nPi80jdJi96xBp63n0irIf5PfT61X37lYI2uniKVVwTlwjXg3TF5dGMXagD055XOfE3
 ANv22OF3ZzcrAkhLXZf3IbMYCZDTV+66TM0OWHvqsVuWdYn+HEGsh+xh0i2b+mMiS2iaGG
 DNNTj5c/1nW7G0YuMRx6132OZGci6xf4vVQq24Yi9A8da2VDn0EkLWkIwB4oDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cDkH5wn+
Subject: Re: [Buildroot] [PATCH 3/5] package/python-aniso8601: add version
 10.0.0
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

On Tue,  1 Apr 2025 10:07:24 +1030
Daniel Crowe <daniel.crowe@maxmine.com.au> wrote:

> A library for parsing ISO 8601 strings
> https://bitbucket.org/nielsenb/aniso8601/src/master/
> 
> Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
> ---
>  package/Config.in                              |  1 +
>  package/python-aniso8601/Config.in             |  6 ++++++
>  package/python-aniso8601/python-aniso8601.hash |  5 +++++
>  package/python-aniso8601/python-aniso8601.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-aniso8601/Config.in
>  create mode 100644 package/python-aniso8601/python-aniso8601.hash
>  create mode 100644 package/python-aniso8601/python-aniso8601.mk

Applied to master, after adding the missing entry in the DEVELOPERS
file. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
