Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393C6C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 15:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3E4181440;
	Sat, 19 Apr 2025 15:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrF0P06fjm3p; Sat, 19 Apr 2025 15:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C03E81182
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C03E81182;
	Sat, 19 Apr 2025 15:17:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8C4C22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9CFF607D6
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oZEVtxOQ1JG for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 15:17:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D389D606B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D389D606B3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D389D606B3
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:17:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFDE043B2E;
 Sat, 19 Apr 2025 15:17:33 +0000 (UTC)
Date: Sat, 19 Apr 2025 17:17:32 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20250419171732.356b2676@windsurf>
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopeihrghnnhdrmhhorhhinhdrudelleeksehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehkr
 ghmvghlrdgsohhuhhgrrhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhitggrrhguohdrmhgrrhhtihhntghoshhkihesuggrthgrtghomhdrtghomhdrsghrpdhrtghpthhtohepkhhlrghusheslhhinhhugidrvhhnvghtrdhisghmrdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopegrrhhnohhuthesrhhnohhuthdrsggv
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745075854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4008oGDj6jiSo4sIGRmB7xzkutXmm+uumh4XJHHZLEw=;
 b=WhQmyJO/ywIR4smQ26PkI/276J6SfpRs/t8AwtvrF2T5Mbw1AYJejxzoxB9ZU/8J+HvYep
 0Bb28T7lu0FOhbB6epbx19tAFbQ7L3/UB8fUkmvlACuatlC9dQnwG3Z233hI0mc2uToPTm
 kgXjgcCiw+gMtlIvri/6g1U+Xlmq1f9Br2f4Ay5TKwJi8BkmWNMPXwgBwAtRhE4fqiTTb2
 G3W36ciEIvIlbLUlZqq7BU8ISo6x8Nrjc2ZP6Tiyvg1W3y3QHbWuiB+WAXlkzu8oX9Vzs+
 u55Q40pFbTutb8bINxU/JFhnX5gOsMr62vEy+hswcfyAbfpDCJ8WoA8eY4Wbfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WhQmyJO/
Subject: Re: [Buildroot] [PATCH 00/29 v2] package: improve for better
 pulseview integration (branch yem/sdcc-fx2lafw)
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Wed,  9 Apr 2025 22:03:42 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> This series aims at making the pulseview and other sigrok-related
> packages more integrated. The series is articulated around three main
> goals, the details of which are expanded later:
>  1. cleanup and extend pulseview dependencies, notably the need for
>     fonts;
>  2. extend the boost package, for a better host variant, and better
>     maintainability;
>  3. introduce sdcc and fx2lafw, to allow use of Cypress FX2-based logic
>     analyzers.

Wow, this is a large series doing a lot of stuff. I already applied a
few of the preparation patches in order to reduce a bit the size of
your series.

Now, I have several concerns about different aspects of the series.
Nothing I am entirely against, just topics on which I am not 100% sure
on how we want to deal with them.

First topic is the some-font package and this whole idea that all font
packages should at least install some font. One thing that bothers me
is that fonts can be provided in different formats, and "some-font"
doesn't say which font format will be used/available. Should we make
this "some-ttf-font", or something like that? Is that even a mechanism
we want in Buildroot at all? Arnout, Peter, Julien, Romain, any opinion?

Second topic of concern is how you handle the host-boost dependency.
You add a "select BR2_PACKAGE_HOST_BOOST" to all packages that need
host-boost, adding hidden Config.in.host options for all of them. Is
this really what we want? So far, we have never required
BR2_PACKAGE_HOST_* options to be selected (think
BR2_PACKAGE_HOST_PKGCONF for example). So to stay consistent, I would
rather suggest that the BR2_PACKAGE_HOST_BOOST_<something> hidden
options that are needed get added and selected by whoever need them,
but BR2_PACKAGE_HOST_BOOST isn't needed, nor it is necessary for
packages to select it. Of course, unless we decide to bite the bullet
and have Config.in.host options for all host packages, always selected,
but that's a huge effort and complicated one (think host-cmake, which
may or may not be built depending on whether there is a suitable CMake
version on the host machine). Here as well, Peter, Arnout, Julien,
Romain, any opinion?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
