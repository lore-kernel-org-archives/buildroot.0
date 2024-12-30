Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F85E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 21:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A83F60B18;
	Mon, 30 Dec 2024 21:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R51Q2BypFzbF; Mon, 30 Dec 2024 21:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3A3460B14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3A3460B14;
	Mon, 30 Dec 2024 21:21:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D6BDE0F
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFAE98183D
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgtEiYDFcaND for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 21:20:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1A0581854
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1A0581854
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1A0581854
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:20:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29B50E0002;
 Mon, 30 Dec 2024 21:20:55 +0000 (UTC)
Date: Mon, 30 Dec 2024 22:20:54 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Jan =?UTF-8?B?S3VuZHLDoXQ=?=
 <jan.kundrat@cesnet.cz>, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20241230222054.4eb7aa0c@windsurf>
In-Reply-To: <20241230113710.679717-2-heiko.thiery@gmail.com>
References: <20241230113710.679717-1-heiko.thiery@gmail.com>
 <20241230113710.679717-2-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735593655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OZLqeAo5YksDST6rru6Ztq0ZV2nMN3UTQ8EUYdG2z8s=;
 b=FSIjvpSl/xt9jn1OCOYCxvLecdL9Jj3TfGDIF3xzvxHS1IAkhyRlTiQGpMNNjq2ecIdyqV
 XNJt60FfJBnY5NfY7mNliDWP/N2H6wB0kdAbhIKic93rdR3tK8Ovh4Z1Dz4nzpUzPvnQ8D
 PMV3TK3QY1ZhZ3yF2kVojLOjxJ8otSrGsBMK0agNEGm5LkngvJmZo4N5Rd0J3nu44zcITD
 WDGZWIEYHU7A9FeTipwgMq5w2e2q+kQU5FnIk122Vloe4mYqAP9DavRJrq4HGE6Wm13By9
 KCBkZNSeGj6ZvJxHmT4pJnl5nITMo4M2hy5sH+1l2Od8uAOZVpVMzN8uGUGF4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FSIjvpSl
Subject: Re: [Buildroot] [PATCH v3 1/6] package/libyang: bump to version
 3.4.2
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

Hello Heiko,

On Mon, 30 Dec 2024 12:37:07 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> The LICENSE hash has to be updated due to copyright year change.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

I wanted to apply, but I'm afraid there's still some more work, as this
doesn't build:

-- Could NOT find Doxygen (missing: DOXYGEN_EXECUTABLE) 
-- Configuring incomplete, errors occurred!
See also "/home/thomas/projets/buildroot/output/build/libyang-3.4.2/buildroot-build/CMakeFiles/CMakeOutput.log".
See also "/home/thomas/projets/buildroot/output/build/libyang-3.4.2/buildroot-build/CMakeFiles/CMakeError.log".
make: *** [package/pkg-generic.mk:279: /home/thomas/projets/buildroot/output/build/libyang-3.4.2/.stamp_configured] Error 1

You can reproduce yourself by building inside the minimal Docker
container:

$ ./utils/docker-run make

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
