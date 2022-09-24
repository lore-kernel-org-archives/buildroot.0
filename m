Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4A0C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 21:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D263E41C5A;
	Sat, 24 Sep 2022 21:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D263E41C5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AL3h8QJNgDfy; Sat, 24 Sep 2022 21:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B427641C78;
	Sat, 24 Sep 2022 21:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B427641C78
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 358AA1BF95D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0715741C46
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0715741C46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C4ksAjsCTZJb for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 21:40:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9864B41D12
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9864B41D12
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 21:40:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B0855E0003;
 Sat, 24 Sep 2022 21:40:33 +0000 (UTC)
Date: Sat, 24 Sep 2022 23:40:32 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220924234032.046fa316@windsurf>
In-Reply-To: <20220924173414.5970-1-fontaine.fabrice@gmail.com>
References: <20220924173414.5970-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664055633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KaZOfDpn4zNvm0j02AxkYy2Eyr4TTBm+yagtlA95+nY=;
 b=BzAhEmafT2vX6xfM+7FKmJNLYg8hpdDxONQ0eo8RmAdO6xTGU5gseuQnzkN/8OOACV3/bo
 HMK1Fv55gjaS3qk/kIb2xXBDEdS6q4djsbltQmGlh4586j1vDzbLzbQKTqqrWkGWsyjBMT
 xVefVkFZ459IDOU/Harjkb4INw3pnB1UasfSOYRKFj5F2pGmFuN7M2FdTcC1vR/plfMZyQ
 JyXz6Q4MB0lpXB0wu7of8LOcNQ0vanp1LXvlsPef18Xf4+yElEOGGwxzb4b8/9jWZIihGw
 f9/9xSD7Q0/i3oKWwerFwJXEHkCYNGq0239azUR8aQlolfmUYSElF0a8RZqJbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BzAhEmaf
Subject: Re: [Buildroot] [PATCH 1/1] package/tinyproxy: fix CVE-2022-40468
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 24 Sep 2022 19:34:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Tinyproxy commit 84f203f and earlier does not process HTTP request lines
> in the process_request() function and is using uninitialized buffers.
> This vulnerability allows attackers to access sensitive information at
> system runtime.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...up-in-error-page-in-invalid-requests.patch | 32 +++++++++++++++++++
>  package/tinyproxy/tinyproxy.mk                |  3 ++
>  2 files changed, 35 insertions(+)
>  create mode 100644 package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch

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
