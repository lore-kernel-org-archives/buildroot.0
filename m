Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F18C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 21:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2982A40BE2;
	Sun, 18 May 2025 21:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gt5rvtjSp-9H; Sun, 18 May 2025 21:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47DE340BE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47DE340BE8;
	Sun, 18 May 2025 21:06:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75B91193
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 626E760EAC
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqzxkbVlR1fP for <buildroot@buildroot.org>;
 Sun, 18 May 2025 21:06:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5313160EAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5313160EAB
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5313160EAB
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:06:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D96343A69;
 Sun, 18 May 2025 21:06:31 +0000 (UTC)
Date: Sun, 18 May 2025 23:06:31 +0200
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250518230631.1741a84c@windsurf>
In-Reply-To: <20250518085508.51880-1-kadambini.nema@gmail.com>
References: <20250518085508.51880-1-kadambini.nema@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudelheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfduueeikefggfetffeggefggeejvedtkeehveegjeeufeehjeejkeefleekgeeknecuffhomhgrihhnpehsmhgrrhhtmhhonhhtohholhhsrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehkrggurghmsghinhhirdhnvghmrgesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhil
 hgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747602392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HxirMYTDZFIVyCj9CUNcHZoH0yQdrjmmlxeGX8xPV5I=;
 b=NTVqO7Q2I23O0QYaTjq7XtM2EMEJDZC4I6n08MryWlH4Ttrr9h13US6lj/v6YEn7vPCJ4A
 UOada1DknVhE2H5pUKUkB6gePmILt29gG6psmQqAjw0rui4Bb2iUmrnfipaQ9k9juvjh9L
 i8mNY0Z7YK2ekp9lCCgJDlQcM48Y4HIWtr6Cj5vi/vl6o6SXDJ3BpqSSqgFEVDspHhFsmi
 MnT74TEhtZ7gKR0EaRl8E6l08FJldi7sRoQyyiUZEEW0vNIUBExnXI0yYUUPKkuxojHiz1
 4MB4UJI2PqdZywkL4Q40BlVBPswFCZJoLl69ZpzRPT1TECzQSENX6E/8t2uJ0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NTVqO7Q2
Subject: Re: [Buildroot] [PATCH 1/1] package/smartmontools: bump version to
 7.5
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

On Sun, 18 May 2025 01:55:08 -0700
Kadambini Nema <kadambini.nema@gmail.com> wrote:

> Release notes:
> https://www.smartmontools.org/browser/tags/RELEASE_7_5/smartmontools/NEWS
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> ---
>  package/smartmontools/smartmontools.hash | 8 ++++----
>  package/smartmontools/smartmontools.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
