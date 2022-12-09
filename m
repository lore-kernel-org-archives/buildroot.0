Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30566C4167B
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 16:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A45A820B7;
	Fri,  9 Dec 2022 16:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A45A820B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-eTIsvvTGFf; Fri,  9 Dec 2022 16:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7F94820C1;
	Fri,  9 Dec 2022 16:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7F94820C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 674391BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 16:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FAF340FF8
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 16:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FAF340FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gdBstViLwGzr for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 16:10:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3A6740002
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3A6740002
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 16:10:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E733C240006;
 Fri,  9 Dec 2022 16:10:25 +0000 (UTC)
Date: Fri, 9 Dec 2022 17:10:25 +0100
To: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Message-ID: <20221209171025.0ed53d0b@windsurf>
In-Reply-To: <20221209163756.118bd1d5@x230_1.trabucayre.com>
References: <1670597027-3905-1-git-send-email-gwenj@trabucayre.com>
 <20221209162708.30993bed@windsurf>
 <20221209163250.0a47324b@x230_1.trabucayre.com>
 <20221209163756.118bd1d5@x230_1.trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670602226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TlTH7K9GfCZZVS+hGTXj/qm4dXIdJ1zRsC+UBGP4sXo=;
 b=SnQ5JihwLHDzyb25gwjZflLLSkDSl8Qpfz+THHQGazOQg2cCogBWJPo9wEBcJZWUot3jnw
 8atlRT0H66nUpCxKD9qKiHjrZwE4tEWQoL9lsDuRtZ2E+6TlcEoNkq6WSWuuGC+iRbZ0FS
 IbRsiXn6tCCC6IKwX0yhyP5UQ0w/OpP/rO6eMdbpPdfuWCtiDhSe89D+PYa5xPjyieJXdn
 9GthswP+lzEozqlVJdTvxamswJVz1JMuX8BU5hwm6iLVA0fZ9Kd+7fK88r8CmaiB2Tr99A
 6MglwqsbM4LBStQIuOzVFOSrvo++kYrHbCvQP+Be0JC4IzHrRJ1h8mKDn9E44Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SnQ5Jihw
Subject: Re: [Buildroot] [PATCH v2] package/gnuradio: restrict gcc to >=
 9.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 9 Dec 2022 16:37:56 +0100
Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com> wrote:

> > gnuradio ask for 9.3.0 but it's true one may wish to use gcc >= 9.0.0 but < 9.3.0.
> > I assume a BR2_TOOLCHAIN_HEADERS_AT_LEAST_9_3 must be added to strictly respect this
> > requirement?  
> BR2_TOOLCHAIN_GCC_AT_LEAST_9_3 instead of BR2_TOOLCHAIN_HEADERS_AT_LEAST_9_3 ...

BR2_TOOLCHAIN_GCC_AT_LEAST_9_3 does not exist. We only have options for
5.x, 6.x, 7.x, 8.x, 9.x, etc.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
