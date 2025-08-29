Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE85C8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 07:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D0DC614CA;
	Fri, 29 Aug 2025 07:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHhu7rMXsIFr; Fri, 29 Aug 2025 07:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC1DA614D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC1DA614D4;
	Fri, 29 Aug 2025 07:14:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41A506C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28C1940E01
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yefnjf3fexRa for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 07:14:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F290140242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F290140242
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F290140242
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:14:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D55B843D64;
 Fri, 29 Aug 2025 07:14:40 +0000 (UTC)
Date: Fri, 29 Aug 2025 09:14:39 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250829091439.153c100c@booty>
In-Reply-To: <20250826072652.1581813-2-neal.frager@amd.com>
References: <20250826072652.1581813-1-neal.frager@amd.com>
 <20250826072652.1581813-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeefvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieduffeuveekveegtdevieduveevleeigeetfffggefhjefggfduudevieejudeunecuffhomhgrihhnpehgihhthhhusgdrtghomhdpohiilhgrsghsrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpt
 hhtoheprghrnhhouhhtsehrnhhouhhtrdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1756451681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ArhGrWPE/hHeawuXdEpDyX/WEk5XMvKn0osWJuTg01Y=;
 b=e6do9iPKRXR4fWolMZXlAc2WbSj3nv+02wUAaNOkQWV3jsCBP9J/DJNh8tU3ZgWBJfvRSU
 9OUp2xJK4vIodf2QVs8df8LXHeYPZvsQtDzDj+hG0yXRbGPq6zVFxEuu/CvkK+6MS5L87X
 3c9PtjbN7ERFy6Ve3Jxn5bZ07O32/FbyL/Ahw+8gYptcXYR5Ss3ENnkzWXKZueMRNkST6X
 JsFYeCG3vXcXYLH0Q43eQzxhwxBh37g8WbDwKACzS0nGqPwxY1FVhNl6TPazWrs/uO9Rlc
 OMFSJf0rUu+SkSODe0HZDOGPGG5NgW1xz3EG47Id1aIZRqxPdkt00VbblMhyAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e6do9iPK
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_*: bump to Linux
 6.12.40
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com, buildroot@buildroot.org,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Aug 2025 08:26:52 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynqmp defconfigs to Linux 6.12.40.
> 
> The memory leak patch is included with the Linux 6.12.40 release tag, so it no
> longer needs to be applied to these defconfigs:
> https://github.com/Xilinx/linux-xlnx/commit/9691533f6e6fd0a596ac7688e82eeea53f22c434
> 
> This patch has been run tested on the zynqmp zcu102 evaluation board.
> This patch has been run tested on the kria kv260 evaluation board.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> This patch requires the following patch to be applied first:
> https://patchwork.ozlabs.org/project/buildroot/patch/20250826041709.163460-1-neal.frager@amd.com/

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
