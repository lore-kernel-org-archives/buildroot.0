Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FFCC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 08:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 705BF607D7;
	Tue, 22 Apr 2025 08:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4TNy2z3Dwx3; Tue, 22 Apr 2025 08:40:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1E8760908
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1E8760908;
	Tue, 22 Apr 2025 08:40:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D11EB1BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6CE481E10
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rv_rY0HROLF for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 08:40:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A705181E0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A705181E0D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A705181E0D
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:40:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5E0A43220;
 Tue, 22 Apr 2025 08:40:42 +0000 (UTC)
Date: Tue, 22 Apr 2025 10:40:41 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, thomas.devoogdt@barco.com
Message-ID: <20250422104041.4dde7a74@windsurf>
In-Reply-To: <20250422075932.2345-1-thomas@devoogdt.com>
References: <20250422095528.0006b78b@windsurf>
 <20250422075932.2345-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfefhfekleeujefhieduhfdtjeeugeduhfejhedvteefkedthfegtdeikeejtdelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehthhhomhgrshesuggvvhhoohhgughtrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlu
 ghrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdruggvvhhoohhgughtsegsrghrtghordgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745311243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkdMz4RrhLA0T30P2xoKtz3S9xjq9QhgFBGmNsXdCXQ=;
 b=JN9uaTb45j4Y4vSni6FrnBB6wxhW9RR4mo/mnITHnUvTqGTYGnSBmBmvwSL0dw6PGQ/brG
 FMAqRr4JzWHDN2hP+vJwu6yjCY2BDCk0x/oxl7wFrDa+BwYMZaxEw8kJdFgnfirTGBGutZ
 C6LA0ME4uUMcm172eQv5gPmt1a9oJZOVBgniXWppnLbLzIk5g2esTeRXkkOJjR0Ik2fvaZ
 +Y1+5yIfrEKvlc/cShoqdBIEivt6M8tJVE7ljLyjIMKoD8q3S0GKNMo6n+y12Mqezg0oao
 PCNpviNhasNRLYfHROgL6ZZY+9xgNadS46IXNbJFqxAalhvSFORAf5h9bJnSIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JN9uaTb4
Subject: Re: [Buildroot] [PATCH v3] package/util-linux: bump to 2.41
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

On Tue, 22 Apr 2025 07:59:23 +0000
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> News: https://lore.kernel.org/util-linux/2cifsg7vkdiivfsmmximhbzybrsopn7zfqgwz2f6hyflh35pjr@ecyicq2cbsro/
> 
> Dropped patches which are all upstream.
> - https://github.com/util-linux/util-linux/pull/3049
> - https://github.com/util-linux/util-linux/pull/3383
> 
> Added some new patches. (which are also upstream)
> - https://github.com/util-linux/util-linux/pull/3471
> - https://github.com/util-linux/util-linux/pull/3484
> - https://github.com/util-linux/util-linux/pull/3506
> 
> Synced all license files.
> 
> Dropped the AUTORECONF call, since
> 0001-libmount-ifdef-statx-call.patch is upstream.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---

Thanks for the new iteration! Perhaps worth nothing, according to our
discussions, applying this would for now cause breakage with Bootlin
toolchains, as util-linux 2.41 will fail to build with uClibc-ng
versions earlier than 1.0.52.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
