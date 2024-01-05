Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7292C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69DB1436D6;
	Fri,  5 Jan 2024 12:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69DB1436D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NpcDw6kEj0sn; Fri,  5 Jan 2024 12:56:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 981E843729;
	Fri,  5 Jan 2024 12:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 981E843729
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBACE1BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D180E821DA
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D180E821DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IY3zwcNv2_qS for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:54:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEA78820D9
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEA78820D9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DD0620008;
 Fri,  5 Jan 2024 12:54:27 +0000 (UTC)
Date: Fri, 5 Jan 2024 13:53:52 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105135352.30c81d6f@windsurf>
In-Reply-To: <20240102224416.2529022-1-fontaine.fabrice@gmail.com>
References: <20240102224416.2529022-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704459267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urEkBRDtQAL65NDp0cWeXO/LcVw7NibCdg8UDzUA74g=;
 b=Lo2g+6efxa85VCJuj6//CjvJaCxox66YEXciAP769EjUZdy5zSLMgonFu4CYfXeVQMvTcU
 0mI3Czd5k6MlCxPFJ62ZD3WOyvPtf8Q/qNPbMOxTT+ZSk8IO/u4lfr3YEDg3EaaPYLkor+
 OaxIJCmzCUAJRZaQNHe3rEVYXa7JdQacstJ1qZW+QC0DQBigkAHrAX1s7mHTNOiQWFb8Mm
 MRx3SwXQssprfKYgHPg2mXxpczOCBMlG3c5bdqyGgiq0d4MRtjtgRhXT66lH7mdfvQ8aEo
 ByN9Hsbse176TUSOh/u/W4DGR8/gtmG0H7Wyo0jDKaWdjoQSWlVLqL6ueA3vdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Lo2g+6ef
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump to version 3.4.1
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jan 2024 23:44:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/postgis/postgis/blob/3.4.1/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/postgis/postgis.hash | 2 +-
>  package/postgis/postgis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
