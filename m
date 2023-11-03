Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8DBC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 09:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5988161001;
	Fri,  3 Nov 2023 09:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5988161001
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13mKdP27LrMQ; Fri,  3 Nov 2023 09:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0CD261062;
	Fri,  3 Nov 2023 09:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0CD261062
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4321D1BF27E
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CAC360E72
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CAC360E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n6O-SjeJcpe9 for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 09:32:48 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A15D607A4
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 09:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A15D607A4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A6711C000A;
 Fri,  3 Nov 2023 09:32:46 +0000 (UTC)
Date: Fri, 3 Nov 2023 10:32:45 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231103103245.29de7f4a@windsurf>
In-Reply-To: <20231102214115.210138-1-fontaine.fabrice@gmail.com>
References: <20231102214115.210138-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699003966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t2PGyBZJ9AaswsLrlZcXXl1w61TvBs+DmoItokU5sSk=;
 b=K+sb0YAj2JWBhWlMO89P5S2KnJp5cjxJF/f3qFFBQX/ufzer9CgyJc7YMVaGhLCuR0kSzV
 +G845FLWWumL42RpoaMxSof1Mbm8J3hML3ea3Se4Zu55hSpIgy93cpFd4AOuSyyHinovY0
 ueQWGyej6Y7X9l9GM1I2Pp/NceF67iJW4Oq1Wc1XmszfHpJHPNM4h/PGm9/jyy4d2gvZUV
 2//sRManqliV//MIO+Bj4yYaCgKabIxbDW4QBFig+dy1WxibmFUpnCD+w6wFMrTmkFTAfy
 BMyAGjBnT4SKkemaYh6ZC8Jezdfv6bT6iVMns3Bk5lg8goVRw4bPfaMa5dM0zQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K+sb0YAj
Subject: Re: [Buildroot] [PATCH 1/1] package/gzip: bump to version 1.13
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

On Thu,  2 Nov 2023 22:41:15 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of COPYING (http updated to https with
> https://git.savannah.gnu.org/cgit/gzip.git/commit/?id=13dab4245e071c29ef8c36e0a2e0c3fb528b57f2)
> 
> https://lists.gnu.org/r/bug-gzip/2023-08/msg00000.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gzip/gzip.hash | 6 +++---
>  package/gzip/gzip.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
