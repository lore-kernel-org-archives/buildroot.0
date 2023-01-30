Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7C0C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4346D6FB62;
	Mon, 30 Jan 2023 21:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4346D6FB62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcgxJqov8Ypt; Mon, 30 Jan 2023 21:39:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BF1561B03;
	Mon, 30 Jan 2023 21:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BF1561B03
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD1401BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5825820FC
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5825820FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YQe-HtwWXgO9 for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:39:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A82781CA7
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A82781CA7
 for <buildroot@uclibc.org>; Mon, 30 Jan 2023 21:39:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 389D3C0002;
 Mon, 30 Jan 2023 21:39:42 +0000 (UTC)
Date: Mon, 30 Jan 2023 22:39:41 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230130223941.11f007d8@windsurf>
In-Reply-To: <pan$86f7$3b01a6c4$a6498246$160afa18@ID-313208.user.individual.net>
References: <20230130174339.36794-1-bernd.kuhls@t-online.de>
 <20230130174339.36794-4-bernd.kuhls@t-online.de>
 <20230130221514.2d58df14__31334.1615417571$1675113344$gmane$org@windsurf>
 <pan$86f7$3b01a6c4$a6498246$160afa18@ID-313208.user.individual.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675114782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nmdlUc5U42pgMapaZxmj+3AxtHnXZmbyv904egSEgOE=;
 b=d1kG8HBQOFdz9c/yra1v3A+qR4cGpzYbukUWxifBSrDzV6ZpO4B8RO+39xIXGjc0XLIwsh
 4pHy1Dg9wwd0US8N8XyNedf9dk+0WrR/uXUgSnLOpyfOy/iHRjpY0SCtmv12zq8Qv8BNIH
 gj6n5mX3WmDKKf6LNKowmyowjsEd1w4tT2ZqyJqshVTTQm0kqPJNcscEFjmFIzbroF4oRn
 7hHhlvc92AOQqTiJCTvOm29olp8uWBdax+b0/w9HANx84cZSN941KYki7GwQJPzVB2vgcX
 6RgibL7lVOUPkDTKPfdJRuc7Cw8+jiEQyWRnvmNdbR3qUNxDIf43MMHadC1jUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d1kG8HBQ
Subject: Re: [Buildroot] [PATCH 4/5] package/intel-mediadriver: bump version
 to 23.1.0
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 Jan 2023 22:30:19 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> both tarballs contain exactly the same files but the tarballs differ in 
> size:
> 
> -rw-r--r-- 1 bernd bernd 28517107 Jan 30 22:24 intel-media-23.1.0.tar.gz
> -rw-r--r-- 1 bernd bernd 28601938 Jan 18 19:14 intel-media-23.1.0.tar.gz

Could you run diffoscope between both tarballs?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
