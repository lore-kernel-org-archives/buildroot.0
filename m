Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08038E7070A
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 10:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0A858318C;
	Thu, 21 Sep 2023 10:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0A858318C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 71B8wzPTldYe; Thu, 21 Sep 2023 10:30:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1532583C58;
	Thu, 21 Sep 2023 10:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1532583C58
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 131E71BF3C2
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D38A960BA7
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D38A960BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWOdtdqH7XDu for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 10:30:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D723260687
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 10:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D723260687
Received: by mail.gandi.net (Postfix) with ESMTPSA id A934DFF808;
 Thu, 21 Sep 2023 10:30:49 +0000 (UTC)
Date: Thu, 21 Sep 2023 12:30:49 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230921123049.5cc1ab46@windsurf>
In-Reply-To: <20230921041152.71616-2-dalang@gmx.at>
References: <20230921041152.71616-2-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695292250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpUb7GKulHuQmtYqjL08LlJqVPRQUZsAHTCkMFWy+uI=;
 b=f8KLONtM9wT/BCemHC7PIvipkQmcoIGSTzlLNmXB/zIOg/qAYhDQKZ3Cgc2Krn6VTKTavT
 Au7JZQ/ANRe48wANI4yxoN6/xodl3dG5vh1rG1lsyHu+RYdHlCV2oOkgtWn4G6ADSBs6IP
 5xgKtJh6BBtXHSQUqBjt91emdF+sbRTO1HOyAuPDmgxwfzKd63D+3A1VXM1b/+dVzvfWhK
 dBGgrdqolDygD5FN6JpBOVSekt9iuNr0ZKDMDzFYfx4xgtctied41aNWhp7dIK936ZqarL
 6O9BlPORZfCx560XlpDnW0fwIZLhIJQL8QizyEyC6v4x/jk9XU9t5pQf/UiTHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f8KLONtM
Subject: Re: [Buildroot] [PATCH] package/python3: drop CVE-2022-45061 from
 IGNORE_CVES
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 21 Sep 2023 06:11:51 +0200
Daniel Lang <dalang@gmx.at> wrote:

> CVE-2022-45061 affects python <= 3.7.15, 3.8.0 through 3.8.15,
> 3.9.0 through 3.9.15, 3.10.0 through 3.10.8
> The mentioned patch was removed in c38de813 when bumping to 3.11.1.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/python3/python3.mk | 3 ---
>  1 file changed, 3 deletions(-)

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
