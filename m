Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBF5FA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C80D6607FE;
	Sun, 30 Oct 2022 11:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C80D6607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vihBjVZRAS-o; Sun, 30 Oct 2022 11:09:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AEEE606EC;
	Sun, 30 Oct 2022 11:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AEEE606EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55B3C1BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F25A440357
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F25A440357
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBg-5C-LRS1c for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:05:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46E754035A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46E754035A
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:05:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4BFB840002;
 Sun, 30 Oct 2022 11:05:51 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:05:50 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030120550.026290c0@windsurf>
In-Reply-To: <20221029120937.820995-1-fontaine.fabrice@gmail.com>
References: <20221029120937.820995-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667127951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KR2slJDDowY4D2FVWoEnxxH8gdqmSa+2cozzcaQmXOs=;
 b=h+IDWRYIjZ5Zrr7ILPHUkMB0U4ZNx6n1xioJqzaw1U90blscwixnpQ+E8zqbEe4e7VFRWw
 XwePm5wgali1qAqZvU07lIodniX0DPdQrRueUzGwT+hWtjKpe4RaG3+0qgmY8cwtRK0Fbp
 0HAOdvyqi0FXIhybT8f+Lc42VZocbriXa8UhxMvjHZkegb8zsxL1FCGN7yjYZ73C2bWo9l
 QnRpDl3vmCs86W/KcJSHZAm/Q6eYzEqRomPFAUMPlY8ua1DseDlYMT0wPCSPyWQlVQct7+
 PyrqDyPIprjOMfHmoyx5r96NBEvGvGbhgZTua94EI7CFRvmeaq3LDAer75b3Pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h+IDWRYI
Subject: Re: [Buildroot] [PATCH 1/1] package/hackrf: bump to version
 2022.09.1
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

On Sat, 29 Oct 2022 14:09:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update site
> - Drop patch (already in version)
> 
> https://github.com/greatscottgadgets/hackrf/releases/tag/v2022.09.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ndFFTW.cmake-fix-build-without-fftw3.patch | 34 -------------------
>  package/hackrf/Config.in                      |  2 +-
>  package/hackrf/hackrf.hash                    |  2 +-
>  package/hackrf/hackrf.mk                      |  4 +--
>  4 files changed, 4 insertions(+), 38 deletions(-)
>  delete mode 100644 package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch

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
