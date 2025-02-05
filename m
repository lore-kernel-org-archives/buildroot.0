Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E95BC02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FC57417BE;
	Wed,  5 Feb 2025 12:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25TlfZz4JBaH; Wed,  5 Feb 2025 12:03:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3DBD417E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3DBD417E3;
	Wed,  5 Feb 2025 12:03:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D379CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 018F160FB7
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9W8eM9r9zo8 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:03:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9F2760BCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9F2760BCC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9F2760BCC
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:03:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1179F442E5;
 Wed,  5 Feb 2025 12:03:05 +0000 (UTC)
Date: Wed, 5 Feb 2025 13:03:05 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <20250205130305.35868c96@windsurf>
In-Reply-To: <20250205120058.36299-1-peter@korsgaard.com>
References: <20250205120058.36299-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhkeelhfeifeehffdthfehhfdvteeuvdetveduvdekhfffvddtgeeigfekleekteenucffohhmrghinhepsghuihhlughrohhothdrnhgvthdpsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhr
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738756986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UotJ+RBHFL2dyeLX817eKuTJiTvw9X/e7QtUBRGnzio=;
 b=ob7hdwLpF+bfMkGTy0QewHMYc0oVYPETfqLEWAmZwAI85KuWib0DKo+rkD2n4ENrS4GpaW
 DdP4u5NmT4HHNUhsleGbDeNhaT630IRJWuL8GLzmAHd4hjFU49Q1DEyv1WN8WXPqa8IsW6
 tT6Y+HuEE+heAYAHbMbp/Wy43J3ru+tloTDBsxo1DCIz2e4fHeVQtRp9n8+shI4XnuNtL1
 QrSRnYR30fSYlbJFp3MFJm3YrYQjemFzvpv6QR6rdf/zpWS9qpjO1i2dRtbu7hlOSFKAqZ
 rvvx96BgiQJUNEUDCGJGTpwNwnoqMU3z7BHzVr3HfCEK0z1U+DNcoag1cAd5mg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ob7hdwLp
Subject: Re: [Buildroot] [PATCH v2] package/swipl: fix build without C++
 compiler
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  5 Feb 2025 13:00:58 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes http://autobuild.buildroot.net/results/b24a96b999676990995a466686fe1eacf6cddfef
> 
> Some of the optional packages in swipl are written in C++, so CMake thinks a
> C++ compiler is needed even though we build with -DSWIPL_PACKAGES=OFF since
> the bump to 9.2.6 in commit 33d45b9c672df0 ("package/swipl: bump version to
> 9.2.6").
> 
> Add -DCMAKE_CXX_COMPILER=true to satisfy this check even in setups without
> C++:
> 
> -- Check for working CXX compiler: /usr/bin/true
> -- Check for working CXX compiler: /usr/bin/true - works
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
> Changes since v1:
> - Add info about since when the issue occurs.

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
