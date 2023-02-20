Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7015DC6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BF48822D9;
	Mon, 20 Feb 2023 20:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BF48822D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6aILV0NE0mq; Mon, 20 Feb 2023 20:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D6B9822D4;
	Mon, 20 Feb 2023 20:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D6B9822D4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 847F71BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51C3C822B5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51C3C822B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_8t43MbIXkp for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:47:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B5A1822D4
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B5A1822D4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:47:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DCD1A240008;
 Mon, 20 Feb 2023 20:47:18 +0000 (UTC)
Date: Mon, 20 Feb 2023 21:47:18 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220214718.5880fd4c@windsurf>
In-Reply-To: <20230220091739.13107-1-fontaine.fabrice@gmail.com>
References: <20230220091739.13107-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676926039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gYEz52nguellnBq5HnrZtF41GtpT8obdYRHuggJUTaY=;
 b=f0c7rMHmawyZdy9FEw+ksOw6hVTMxu/MGEHBnePJYcsn6YqWJnNw9cP7KFWfLoO9q4lps9
 ritXXvndSdMg7N3Ng1gG7y6OMFqDuse3su5bUKiTyKb3M2RPUhZxMjmTUfQ6zeggxteYVt
 eUUqleUzLD1fLvJmsywa3rWu9zOoWNm22/WIoxTJmYYSho3dvF+CZvxPr0PzPzd9yggf0k
 x++ZRp1GvFFOViD5LXdVUOX5nTYyxbo9HXlwbsX+aqevwj/nGNWLeL7UsU0vCBfNgKu8DK
 l6k9dxOP5PdzdkfmFlLMfT1oGgO1x+2lr59WpC8Or4Io/roiIPu5ugPX8jRkjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f0c7rMHm
Subject: Re: [Buildroot] [PATCH 1/1] package/zabbix: set --with-libpcre2
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Feb 2023 10:17:39 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set --with-libpcre2 to avoid the following build failure raised since
> bump to version 6.2.7 in
> commit 89fa774a191d41ed5d125d87d812ff3478902251:
> 
> configure: using old pcre library by default
> checking pkg-config is at least version 0.9.0... yes
> configure: error: cannot find pkg-config package for libpcre
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/701b343b3b0d471c75899b61d02bd9d63a272247
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zabbix/zabbix.mk | 1 +
>  1 file changed, 1 insertion(+)

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
