Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E88C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 21:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23C1841996;
	Sun,  5 Jun 2022 21:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LdqpQbR58WRy; Sun,  5 Jun 2022 21:24:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDC7D4191C;
	Sun,  5 Jun 2022 21:24:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56EE21BF290
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53CD3612A2
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJdGkhJ68B-6 for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 21:24:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 449EC6129B
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 21:24:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7208FC0002;
 Sun,  5 Jun 2022 21:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654464263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqG5lD0gO9+RAqVflksZmkvPaq7Mm1svhT/XiluIR74=;
 b=HHuMg1Yy2OmftboO/ECI9rPQm9XY55wD4YKkIuSG7FXrMuz6mSlyLLEDi6xfzl1+fW2WKw
 DYbTei6ruUvuKjCGpkTUusNt3QHJrfHVEwXztzaGm/mXdumsPvtDeRLAxVTks2m5JbUamB
 VpljU9dt2oJD6uktf6tt1pmyVmSBxKhSmcYoP6V6CgOxdjZjpAujIRdNJtRStI1oHeyVh0
 ev44t+syGoj0x/QS3ldyJftUsvdQq8RN6okNrKzf5VDxv5dPvVGp8o0mzUSJBxeNY7f3pX
 P6GFmEgB8XF0mf5jRFXf3x8YAjbAmCVUgA3Z+wRwZ6dxQcwH/V6VcYc3YAawbA==
Date: Sun, 5 Jun 2022 23:24:22 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220605232422.7819ac8c@windsurf>
In-Reply-To: <20220530131919.839849-1-aperez@igalia.com>
References: <20220530131919.839849-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libsoup: bump to version 2.74.2
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

On Mon, 30 May 2022 16:19:19 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Version 2.74.1 included a flurry of build fixes, while version 2.74.3 is
> able to detect whether the library is being loaded in a process where
> libsoup3 is also present. The latter will come in handy for migrating
> Buildroot to libsoup3. Release notes:
> 
>   https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.74/libsoup-2.74.1.news
>   https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.74/libsoup-2.74.2.news
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/libsoup/libsoup.hash | 4 ++--
>  package/libsoup/libsoup.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
