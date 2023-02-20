Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8627C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60A5F701B5;
	Tue, 21 Feb 2023 02:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60A5F701B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MEb-lW3PQ96L; Tue, 21 Feb 2023 02:11:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BF96702B9;
	Tue, 21 Feb 2023 02:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BF96702B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EE8D1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8B6C81D7D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8B6C81D7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4m_PU7DjYBTw for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 21:39:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5B9A81A50
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5B9A81A50
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 21:39:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6C07A100002;
 Mon, 20 Feb 2023 21:39:21 +0000 (UTC)
Date: Mon, 20 Feb 2023 22:39:20 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20230220223920.43c5921c@windsurf>
In-Reply-To: <20230213124021.12522-1-heiko.thiery@gmail.com>
References: <20230213124021.12522-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676929161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXfCCCxJKU6Vr7usEiqgDzszH8AZxp0FEeMtI6GipA8=;
 b=SVhIKXCuoXIesNiPB4XhFI0xFSibcI7Ll1UCIgCMhhe2s/o26VJkd81+ML9iYDhG+71iBP
 aWMuGqHxDMZ/6QpjH5v06ALWf+2xL4hceEdcoZigPacQnYrvs0xXISEu/KblIA125Rdm9Z
 acENG8bxuHFmYip9BXzIK2d2HsefpALi3ng19N1rzotw9AARW4Ej+C3NIUuLfvOXNzvB70
 34i38oz89ivn2hLlJJmHfmJ4ir7Sdpn47Nlkg+9t3HUT9R93JOg10WzHaZQM6o/DNzfGaY
 nwOeDlJKrgFOS61rWM5FCwDcDXjAvaRL7UdHg9JKf3xYI0YEZLhC6SUbMMXH0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SVhIKXCu
Subject: Re: [Buildroot] [PATCH 1/2] package/network-manager: add patch to
 set mobile-broadband-provider-info-database location
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

On Mon, 13 Feb 2023 13:40:21 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> When building network-manager in cross-compile environment pkg-config returns
> the wrong path to the mobile-broadband-provider-info database.
> 
> By adding the option 'mobile_broadband_provider_info_database' to set the
> correct path to the datafile this can be solved.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...option-to-set-the-mobile-broadband-p.patch | 60 +++++++++++++++++++
>  package/network-manager/network-manager.mk    |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644 package/network-manager/0001-build-meson-add-option-to-set-the-mobile-broadband-p.patch

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
