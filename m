Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88FEC3DA7A
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 07:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D241610D1;
	Fri,  6 Jan 2023 07:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D241610D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y05KrgbrBe4K; Fri,  6 Jan 2023 07:51:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DA3960E2F;
	Fri,  6 Jan 2023 07:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DA3960E2F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82CBE1BF359
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 07:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E4B6404A3
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 07:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E4B6404A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rR1EvfO-HZsC for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 07:51:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D75D400B9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D75D400B9
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 07:51:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 88B221BF20E;
 Fri,  6 Jan 2023 07:51:09 +0000 (UTC)
Date: Fri, 6 Jan 2023 08:51:08 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230106085108.7961a66a@windsurf>
In-Reply-To: <20230105185140.622799-1-bernd.kuhls@t-online.de>
References: <20230105185140.622799-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672991469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BIh9pViYMuG0lbaNNzY0WZ4q4ilzMp7VkpD9fN6z9lY=;
 b=Eg6SPxfCBFCBpTV3+W3RJWLX9bQFYNw5jtF+NBboQISdcfNTAoULizwz5LaJWTN5UbHq0i
 5Hi1GPPJRjPaxpTTs9iIt41qHSgvKWlkrNgkeixbm3KB5LW+QT7if3KUjIyyDOqnjnW8cd
 I7pdWDvCC7U6CKpc2JjXv2i48N++k3iu3Q6xz6oZy/uhOLoI3GhranCyQbHOLeOxEYrBoE
 8GW84FPNb1SCwT4fLu+AO9jGpyaLTwHcp2dOU/8o2pibiIVYZZq/b7K5blwReb3kt2qXMw
 IVdJFmQIBcoa1lMVOj9lIKfomUDkEG1+8GiFl2g/DTO9KdXh6ngM6MhxMdczGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Eg6SPxfC
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpg-error: add configure
 option to install gpg-error-config
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

On Thu,  5 Jan 2023 19:51:40 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream commit[1]
> 
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=0b47de9c719b0ed0da0791f0525de073737bde5a
> 
> changed behaviour: "gpg-error-config is now only installed when enabled"
> 
> Fixes:
> http://autobuild.buildroot.net/results/bc1/bc1566a0fa42f68f1f15f74a61d4081e269e1689/
> 
> [1] included in version 1.46, added in buildroot with commit b5bdcb4cc5
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libgpg-error/libgpg-error.mk | 1 +
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
