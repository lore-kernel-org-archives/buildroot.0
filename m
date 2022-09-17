Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8F8ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 09:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34B3F84317;
	Sat, 17 Sep 2022 09:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34B3F84317
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7T19bIN32Ozt; Sat, 17 Sep 2022 09:15:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51CE48403A;
	Sat, 17 Sep 2022 09:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51CE48403A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AE111BF82D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED6F060A9C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED6F060A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnRtykcpaaKy for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 09:15:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD2726059F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD2726059F
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 09:15:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 70AB51C0004;
 Sat, 17 Sep 2022 09:14:58 +0000 (UTC)
Date: Sat, 17 Sep 2022 11:14:56 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220917111456.040518dc@windsurf>
In-Reply-To: <20220911210459.122463-1-fontaine.fabrice@gmail.com>
References: <20220911210459.122463-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663406098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HH9zVQIWld6A5toUkB6Bu1ICrGQ1D3AkBhKlAhkmjwk=;
 b=l6AznWrf0EDyEwMxdX3YBBcjkE/sSUiHRLuQBscisYCFCyvVs29z5wMeN+a+kDM7DlVsOv
 /uVLnFWzzTSnQ08RYQtfA5tK7/RI8BIBLEHBe3twKWcDhrfSRGdoVRWIiuzXX8W2iQJzUd
 ekaWV7vKjCIPzuxIxrLddufB8MGRNl5imqFd6qrH8YKVDP3w05Gxhfr5vZZXxELJpBoXuw
 yV2S4DumXdZjHESJCTCb7b0sVYzwBaXYcKIKaOzIYagBlKKzA9Zxeb8cG/jJk1Z3DCNZpi
 PLm+oQ/D7lLVySLpZBjrs/wSgUYTi9bOpwqO3NCFIs8bz6WO2p03kU6Z5BXppQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l6AznWrf
Subject: Re: [Buildroot] [PATCH 1/1] package/libnice: bump to version 0.1.19
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Sep 2022 23:04:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://gitlab.freedesktop.org/libnice/libnice/-/blob/0.1.19/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libnice/libnice.hash | 2 +-
>  package/libnice/libnice.mk   | 2 +-
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
