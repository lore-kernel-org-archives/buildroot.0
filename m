Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70514C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 14:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A30560E53;
	Sat, 23 Dec 2023 14:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A30560E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hcZ0e8_WnYFX; Sat, 23 Dec 2023 14:14:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CA4F60E3F;
	Sat, 23 Dec 2023 14:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CA4F60E3F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8AB31BF32A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 916FF41BED
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 916FF41BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P1y17RMEfEI9 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 14:14:44 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65CCB41BD6
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 14:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65CCB41BD6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9968B40002;
 Sat, 23 Dec 2023 14:14:42 +0000 (UTC)
Date: Sat, 23 Dec 2023 15:14:42 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231223151442.678d0bf5@windsurf>
In-Reply-To: <20231221142249.327382-1-peter@korsgaard.com>
References: <20231221142249.327382-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703340882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v1jpT59PUKuM5IP1F8S16AzKbSNxhUVeNc8Cx2Q6UjY=;
 b=E1HHDTLCWGV50H5jo49XTQlippVsQWUNJy7+tcd/Wnitr136jf1P8Q+MQt59xLIZM4L4sX
 Jqd/KwmLhVt2/15l+g+jPPd+xApiqhNgu1nv0GjF3M8b+On91k3Szwx4hDwJxMlJNp2Wsb
 jLGjvzglTKQxxuyWQb6XyRvv2V+J2YtFR8zxT7NTLCcjPsiqJkkvcfUOsQhKHe1feNNRR1
 +SVAUj8n4qp+WPCd36/4NmtAaYMvL28eWZS9K2jUlqcWoXsgOkE+wf9HRmK3/NxLDdUFRQ
 VE3phpJrp1wRLG3o2SB8fOL4zOcl0PBF46huzMFuW1SLT/0z9Xq9U72SCPs2lQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E1HHDTLC
Subject: Re: [Buildroot] [PATCH] package/libssh: security bump to version
 0.10.6
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

On Thu, 21 Dec 2023 15:22:49 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - CVE-2023-6004: Command Injection using malicious hostname in expanded proxycommand
>   https://www.libssh.org/security/advisories/CVE-2023-6004.txt
> 
> - CVE-2023-48795: Avoid potential downgrade attacks by implementing strict kex
>   https://www.libssh.org/security/advisories/CVE-2023-48795.txt
> 
> - CVE-2023-6918: Avoid potential use of weak keys in low memory conditions
>   by systematically checking return values of MD functions.
>   https://www.libssh.org/security/advisories/CVE-2023-6918.txt
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libssh/libssh.hash | 4 ++--
>  package/libssh/libssh.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
