Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DF6C369CA
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0A706088C;
	Sat, 19 Apr 2025 14:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-JltsIiv1DE; Sat, 19 Apr 2025 14:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E36D160886
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E36D160886;
	Sat, 19 Apr 2025 14:35:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B731230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D2FA8190B
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueImHZ45rYnW for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C66781AC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C66781AC1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C66781AC1
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:35:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35B4641DF4;
 Sat, 19 Apr 2025 14:35:18 +0000 (UTC)
Date: Sat, 19 Apr 2025 16:35:17 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <20250419163517.415db6d5@windsurf>
In-Reply-To: <20250416200539.3277268-1-giulio.benetti@benettiengineering.com>
References: <20250416200539.3277268-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddtfffhvdegueeludeugfelheeifeeuueejjeevhfetueejteejtedvudffhfffnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepsghuihhlu
 ghrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrnhhgvghlohdrtghomhhprghgnhhutggtihesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745073318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmHYEf3E60hkewkisjcLiB9A1fgvBMtY4CBdlHskltY=;
 b=cJdLDy3I0gyT2qXeNCxLumuWRIhtdtslhPSvDEL/cOHujiGzob87Q6VspO9D3IuqcoRZ3E
 5dZU5983oPu07Fl1tdK0jBnCXyUPLvrk1/vSNDCCGKU9uzX//y0o0VKxE0QG2fc+s+zM9B
 mBt9cfuMhKGp2vPIAsjxYQ8KVnq9dE/ZCEJ+6SNqi9GpOAP5Lrvv3v6Yyq8e5X7FykWkPX
 +zjQt2BTeotvqM9PVAfIUSFg6RIO2ZWXVtxqkXxkwgVuTdnjB7MZXMhsT0fLcqVbdQeWgD
 /qZ1ndmKHtPhYBL8Jru44gtH8+F4cLTld0NaHlPpKAZ+nIjMH8fqJM+8amYmGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cJdLDy3I
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds: fix build failure with
 Linux 6.13
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

On Wed, 16 Apr 2025 22:05:39 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add local patch pending upstream to fix build failure with Linux 6.13
> 
> Fixes:
> https://autobuild.buildroot.org/results/940e7f95fff017b8c7cffb778911ae0386980fa3
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../0001-Fix-build-with-Linux-6.13.patch      | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
