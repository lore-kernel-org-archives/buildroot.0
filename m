Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81799C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 251B240376;
	Sat,  4 Nov 2023 20:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 251B240376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6t5mfD5YQwbH; Sat,  4 Nov 2023 20:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C87240359;
	Sat,  4 Nov 2023 20:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C87240359
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB6691BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98B56418C8
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98B56418C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7nSbvis8jUWc for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:37:36 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E920418C2
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E920418C2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0498220003;
 Sat,  4 Nov 2023 20:37:33 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:37:33 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231104213733.76e881a0@windsurf>
In-Reply-To: <20231004133233.507482-1-peter@korsgaard.com>
References: <20231004133233.507482-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699130254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z5xuh9H/df7jVGWzxNSZgurrUg0MWmHvFgC6e1YJmIU=;
 b=H0W3B/K3ENM71p/YAiGJPY0IypULsO7U47ab6NngGghoM1tO0PQKpZr1W63+YAKWSYlGKK
 0uemekCOfoT9hjryqn/gG/B6VD/ylUdh53b7w9eIasrYC25UqJYaEydAYVIEGZzYGAf8bN
 v8Sp9RPhnvZxp0RIAzH3SjICS2zRHtKWOmbB/mQmFQQMpDRlmXffnpbPTWZwePTjwjkh9n
 X/HEvgBzaQrq4iOEtFX5hXDKr3qycgtkxTjEoD6s+33oNdRLhyw+IqUklj90nizcAXXrE6
 6XSV/Qj9asog/7ZndEY1BjiKkGfbdXRPBlzsZ6TT8nSuEnXTChuEruE3v7ysMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H0W3B/K3
Subject: Re: [Buildroot] [PATCH] package/nano: really disable nanorc for
 !BR2_PACKAGE_FILE
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Oct 2023 15:32:33 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Commit 3c4fa30f7abf (package/nano: fix tiny build) tried to explicitly
> disable libmagic/coloring/nanorc, but accidently passed 2x
> --disable-libmagic instead of --disable-nanorc.  Fix that.
> 
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/nano/nano.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
