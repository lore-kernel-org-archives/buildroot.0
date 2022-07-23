Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC99BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8426B61AFE;
	Sat, 23 Jul 2022 17:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8426B61AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y2s4kuPmCf9f; Sat, 23 Jul 2022 17:52:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8D1F61AFD;
	Sat, 23 Jul 2022 17:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8D1F61AFD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57EB01BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2399461B0F
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2399461B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ohkjHe4qRVvl for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:52:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13A1761B08
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13A1761B08
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:52:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2F6AA60003;
 Sat, 23 Jul 2022 17:52:07 +0000 (UTC)
Date: Sat, 23 Jul 2022 19:52:06 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220723195206.2cf3c6af@windsurf>
In-Reply-To: <20220517234730.4185417-1-aperez@igalia.com>
References: <20220517234730.4185417-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658598727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MDZWC/82RdjtLgVmnc2XzcRWuydrl9XsbKoHS+xWa2I=;
 b=Aftk/Ap+2+EPh3i1f0SKLsVvFdXU1iDeR5Q26Tx7PU3jimqSduspkAiFsdoNszNp/V5LF1
 y5usU2fTFkyOTjAapyW2SgfPQVNeouCANpwLu1MZ97EXbqWQhTpcspUbs3dAVuJU/gE2B5
 eXJsOV+B3gX1oetl3pmOHgHg7TJR/rq3/LUKe+do0xBkBeAUde78VWs3hgz21/92KaJ0HG
 ezajvBC2iC6IgCVyR7B9ud6JszpF1PWP2kj02o1KxctA73CYckr6tSKyElHVey+EKBdhgI
 6nq26wyZ4ZOFDzFVPd9z4SQR0/SPfQPzyqiMIlupm2AK4gIKtBFGHsitjfRAug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Aftk/Ap+
Subject: Re: [Buildroot] [PATCH 1/2] package/xdg-dbus-proxy: bump to version
 0.1.4
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 18 May 2022 02:47:29 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This version includes a few fixes, and a new Meson-based build system.
> For now this only updates to the latest version, the switch to Meson is
> left for a follow-up patch. Release notes can be found at:
> 
>   https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.4
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
>  package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
