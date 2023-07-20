Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBCEC001DC
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F52E606AA;
	Thu, 20 Jul 2023 21:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F52E606AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mu3KG1WKzXNa; Thu, 20 Jul 2023 21:58:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93EF960640;
	Thu, 20 Jul 2023 21:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93EF960640
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E53F71BF5AD
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DB2340220
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DB2340220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6C9IUSVGkOLW for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:57:58 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DF0340191
 for <buildroot@uclibc.org>; Thu, 20 Jul 2023 21:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DF0340191
Received: from relay3-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::223])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id BE897D21F7
 for <buildroot@uclibc.org>; Thu, 20 Jul 2023 21:06:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D98360003;
 Thu, 20 Jul 2023 21:06:39 +0000 (UTC)
Date: Thu, 20 Jul 2023 23:06:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230720230638.5eba8786@windsurf>
In-Reply-To: <pan$86c9$5fa777aa$e5fc1042$fce28aaf@ID-313208.user.individual.net>
References: <20230615134315.494330-1-sebastian.weyer__49449.699586124$1686836642$gmane$org@smile.fr>
 <pan$86c9$5fa777aa$e5fc1042$fce28aaf@ID-313208.user.individual.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689887200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YOxpvYHg71DJ6cgF6s+zBid32qyxBPAachzKe0Rsd/g=;
 b=Ig0j4tHswou1cKtfbmHU9cImSFQNzlGrbA9bCJsZhHu6F25A4mtqNXMsZOKaP+NVqlpQ/J
 1uLgPvu4XSoUA4jvz+XViSXdPvR4zxaXahjpe6kx+daUPvQR67OGGbJmRYFna2zRUTm/YZ
 HR0j7K+O3cjmQQQ0pQOSKtbb6sa1TJwgqqZyZwQJwfh2DCN8dEb6oZ4aFWrcv1GlTvSYO0
 Deg/YtWxO3BPmD1uutOHdxL9c6uGi2+I/xivUiWYzjOB3NOh9Hdmkeler194DUSmi8xKWe
 5WO9kuSU7Oj2Os66SGPbIewT4vLTrH1v86wcDPcUeQXoEMMKYDdXNSKGQwhSlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ig0j4tHs
Subject: Re: [Buildroot] [PATCH v4 00/10] group llvm projects and bump to
 version 15.0.3
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

Hello Bernd,

On Thu, 20 Jul 2023 21:00:54 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> quoting the user manual:
> http://buildroot.uclibc.org/downloads/manual/
> manual.html#_package_directory
> 
> "New subdirectories are discouraged, however."

Correct, with one exception: when a reasonable number of packages share
some common variables, especially the version variable. It's the case
for qt5, but it's also the case for those llvm-project packages, in
which case we tend to accept having a subdirectory.

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
