Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB36E7543D
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 10:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65568821ED;
	Tue,  3 Oct 2023 10:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65568821ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5yNwDva6us4x; Tue,  3 Oct 2023 10:03:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87ADA821F8;
	Tue,  3 Oct 2023 10:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87ADA821F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 718A91BF34D
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 10:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27AF661129
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 10:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27AF661129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LG514pVvyYdh for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 10:03:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BBDB61127
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 10:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BBDB61127
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60566E0008;
 Tue,  3 Oct 2023 10:03:52 +0000 (UTC)
Date: Tue, 3 Oct 2023 12:03:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231003120350.56aefc32@booty>
In-Reply-To: <20231003071536.297478-1-bernd@kuhls.net>
References: <20231003071536.297478-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696327432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KF/5FbWc3BJ5T7w5r4TEzmEtLYUDnXvc4Ga56du7VmI=;
 b=MZV4ZVmvxrGQyJr610AtYecSGJ/+tWykfm+n3w5H0Db+W3CtnDWmmKmUuSifk5q+4VjFA/
 cigI4ik7CUz1BUDa7RVKS/U28rAbZO/g9EHmhp0IGBhae//ig/PVIdns7qm2D9jvJpywsV
 qf/sZ8TIxSwQ6GdrbuANvf616f5CKVCgSR5yitKxbn21lM5f9T2h3o+8b3JUBeK383lQT1
 SbiKIfOuJP2VgaHWqL8lONJW0NWdcmFDOahLtgVEE7cJkIEXZVwkc0cQvc9aSZjsax0KwL
 zQBNUmWqnFFvfLfNDNVhxzs2igoVQfYLFzQ86wvuIpFnL9Gg47lfSTXE2RU79g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MZV4ZVmv
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.96.1
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Tue,  3 Oct 2023 09:15:36 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes CVE-2023-42114, CVE-2023-42115, CVE-2023-42116:
> https://exim.org/static/doc/security/CVE-2023-zdi.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
