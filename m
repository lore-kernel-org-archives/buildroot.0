Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F49C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9C3960B4A;
	Thu, 28 Apr 2022 21:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Xu0WE5YHJPb; Thu, 28 Apr 2022 21:40:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D091760AE6;
	Thu, 28 Apr 2022 21:40:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3A71BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F27DE83F25
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GIaLMHXdF0G9 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:39:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9E3583EF0
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:39:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AA3F340003;
 Thu, 28 Apr 2022 21:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651181993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRGZgQuUu2vLbF/oAu6qoGMdMch3Uo+t8mezgHEZt8c=;
 b=TVSgfRJc8UGh45zFyKU6YTnays/fz1bQYQm07nn8v6tonjd80n4dssWusyywN5wffK/SUF
 +CdgUubok6lm36atIMhwpagmNgCT09SyIrh6v++L455fYGFvh8R0EW0g7PW/o2iOQeionr
 hKmq4yBaAHXXnU5kl4rf/Pgz9gcCbZ42VXNSYxry5icrpkNQFRXwpK382fl+voUMp/E7+h
 oOvr1/kDeuoJivfjkiyVg+mcWfk4tvxkIxKQ3x5l/wVNWgJTUfzHVp3UfZydssa92Qt4i3
 Cnn7HlaZ6s4Jh+UCwVjiczwxOtcZ+8ucX4DIk/u9k90Ki6Y58ySbAOzRSraJ7A==
Date: Thu, 28 Apr 2022 23:39:51 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220428233951.5d87b016@windsurf>
In-Reply-To: <20220428175447.983405-1-fontaine.fabrice@gmail.com>
References: <20220428175447.983405-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_ttf: disable builtin
 harfbuzz
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
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Apr 2022 19:54:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable builtin harfbuzz which is enabled by default since bump to
> version 2.0.18 in commit f4da031a77f200515bcc5b2e0fe665a7b4f2a780 and
> https://github.com/libsdl-org/SDL_ttf/commit/834ec54127dc9c2a12928f5fe32cf110ec4c7a7f
> resulting in the following build failure without threads:
> 
> In file included from external/harfbuzz-2.8.0/src/hb.hh:470,
>                  from external/harfbuzz-2.8.0/src/hb-aat-layout.cc:28:
> external/harfbuzz-2.8.0/src/hb-mutex.hh:53:10: fatal error: pthread.h: No such file or directory
>    53 | #include <pthread.h>
>       |          ^~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ac8b366558bec61ada84ec15cf27652fde2b63b2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sdl2_ttf/sdl2_ttf.mk | 2 +-
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
