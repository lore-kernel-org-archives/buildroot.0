Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACACC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E49384279;
	Thu,  9 Jun 2022 20:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NOlVs2vNJOkF; Thu,  9 Jun 2022 20:45:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61FAF8428D;
	Thu,  9 Jun 2022 20:45:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8EC51BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D58E560672
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u7mfNmPEY-5n for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:44:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E10AD6060A
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:44:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E81911C0002;
 Thu,  9 Jun 2022 20:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654807471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=03E1hDdEDFBMDS6cx92599IaeEEw6xJsffSsR/HMR6g=;
 b=UfGboTQVVz6fR4xYLgxGVZPgkv3O8L90Ch9BMmjAmxzrwUI2T4dRhmeV+P0wKhPFIAZ7uz
 syx/WlwzBlT+88gwX2dyoFoC0uyf1RJM8Q8OX3rlGpqiY//mAySG5qNGKadmT/qEAHOd6b
 3k3/E34sc2D7wl4L5TIEfa+LVFA5KY8pgkccUzMz2JPgyGpv8hiSy6WEgLAfBt1shX4/aW
 6IziMZtiaILQHOBzy1hnMBPl3FmbNUT6LAuQeyfbi3uuSdv/1GG5S+Mcy+sH5xJ1LHYCe7
 ScEYFII1976cHCou6u8h+dAmhEOm16KtAp4GPAOJAQ1idOoQMQIwMv7IQTbXCw==
Date: Thu, 9 Jun 2022 22:44:30 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220609224430.270ee90e@windsurf>
In-Reply-To: <20220606213130.15559-1-fontaine.fabrice@gmail.com>
References: <20220606213130.15559-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/json-c: bump to version 0.16
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

On Mon,  6 Jun 2022 23:31:30 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set DISABLE_EXTRA_LIBS=ON to avoid adding an optional dependency on
> libbsd (added by
> https://github.com/json-c/json-c/commit/0f61f6921b2e4395d1e354ad356137e44d6a7e11
> https://github.com/json-c/json-c/commit/041cef434afe0d0c6da8b6ac1d1fa26087246dda)
> 
> https://github.com/json-c/json-c/blob/json-c-0.16-20220414/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/json-c/json-c.hash | 2 +-
>  package/json-c/json-c.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

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
