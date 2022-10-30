Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF15C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E6314035D;
	Sun, 30 Oct 2022 11:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E6314035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wY8I8ZQ3Ztk9; Sun, 30 Oct 2022 11:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 284DD40340;
	Sun, 30 Oct 2022 11:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 284DD40340
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24E121BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E847C605AC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E847C605AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id giHjvb_L1MPW for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:08:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8E4D60594
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8E4D60594
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:08:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 42CF1240003;
 Sun, 30 Oct 2022 11:08:33 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:07:39 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030120739.61d91a89@windsurf>
In-Reply-To: <20221029212824.315760-1-fontaine.fabrice@gmail.com>
References: <20221029212824.315760-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667128113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hrvaRhqF5jMYHlDJSCbP7PioUB5dNqEzxN+ENtnVSqs=;
 b=H9vj2KuVsrm8BuGWUa85oQO54Zt8gjYn/9WcoW99ieKAjCDkboZ76kyfIH9vG2+h+/i9Zu
 ho0hqbvQAyu2RcXvv1y1c0UBgEh6Unv9hQdnlp5iAfKXJJY+pzu8I8kfCpEFK1UWJjVlYN
 1VG7R/hUlgT0478kxf/l4L7q10R+XNsPXFhtotGSoYy06NOLGyhUSd9BYFlYzavzvPg1SJ
 NR9aHwQVFZgIsUZI9H9dXASUGMLylid86zZ7aK2HP17DYKIcFfZNSm8hZzoZjLx/XhUpmu
 QAYwea4syHpVMpVClR9ERKbKJdKCObKGBSBfKQlNqs0hohczlPh4dNjk7Qqw/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H9vj2KuV
Subject: Re: [Buildroot] [PATCH 1/1] package/libpam-radius-auth: bump to
 version 2.0.0
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

On Sat, 29 Oct 2022 23:28:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Switch site to get latest release
> 
> https://github.com/FreeRADIUS/pam_radius/blob/release_2_0_0/Changelog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libpam-radius-auth/libpam-radius-auth.hash | 2 +-
>  package/libpam-radius-auth/libpam-radius-auth.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)

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
