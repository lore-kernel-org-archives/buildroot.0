Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA1EC3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 10:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9903A4160D;
	Mon, 25 Dec 2023 10:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9903A4160D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jLTqnFInS22Y; Mon, 25 Dec 2023 10:12:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8B7D415D7;
	Mon, 25 Dec 2023 10:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8B7D415D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 438221BF2BE
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCC3F60BE3
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCC3F60BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8QS4MdFjrEQ for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 10:12:36 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C086D6080B
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 10:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C086D6080B
Received: by mail.gandi.net (Postfix) with ESMTPSA id E022C1BF205;
 Mon, 25 Dec 2023 10:12:32 +0000 (UTC)
Date: Mon, 25 Dec 2023 11:12:32 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231225111232.37276389@windsurf>
In-Reply-To: <20231214100833.123688-1-james.hilliard1@gmail.com>
References: <20231214100833.123688-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703499153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pEOzdy0oSB8CwIsVgt5/wQ3zPLLcBZCWxfWNBkUkxJ0=;
 b=To3u4gc4nFYpSQY2cVwp0tLHKMyiALdujfhcyA0iDI81vt8xT9iOeGVdEx0K3/kU9hMbXr
 gBMxWeDQ1bPEzO53ELDzcdONZaRJb9dd9rUDtxBeVaLMqB+RkN2eyppYH8IBI0FRq99lb7
 nRh/O/7KeM2nDGbzPs4w5A3fiLLtupf5s0CniKGjxLwBSX71nwy7iWly33zSRRzv9fUccc
 peeyWSwykh40FE3FMjVo3smpkGLso7V4uNVY1EKDNTFirix0NuFZqrwjtrJaokNhJvLBUV
 Q09X7Pvsrvn13A56QYaIzaBPf12ZO5g14zhrCqM7PvMotQ7t7i/9GW5CVgz6mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=To3u4gc4
Subject: Re: [Buildroot] [PATCH 1/1] package/python-decouple: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 14 Dec 2023 03:08:33 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                            |  1 +
>  package/python-decouple/Config.in            |  6 ++++++
>  package/python-decouple/python-decouple.hash |  5 +++++
>  package/python-decouple/python-decouple.mk   | 13 +++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/python-decouple/Config.in
>  create mode 100644 package/python-decouple/python-decouple.hash
>  create mode 100644 package/python-decouple/python-decouple.mk

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
