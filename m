Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BA9C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 13:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 368D8817FD;
	Sat, 17 Sep 2022 13:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 368D8817FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xn_4G165m11b; Sat, 17 Sep 2022 13:58:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47A4D8084F;
	Sat, 17 Sep 2022 13:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47A4D8084F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 370161BF405
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7E6060A7B
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7E6060A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bg_Sl0lMkEU4 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 13:58:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9091E608F5
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9091E608F5
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:58:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6FA93100005;
 Sat, 17 Sep 2022 13:58:19 +0000 (UTC)
Date: Sat, 17 Sep 2022 15:58:17 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220917155817.1053add9@windsurf>
In-Reply-To: <20220904150541.368134-1-fontaine.fabrice@gmail.com>
References: <20220904150541.368134-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663423100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1/HvZfHqK9ec8VVXKvWPAYapg12FNmrEmGoaT/D6OI=;
 b=AP/PVCvoZS5QHPSCh6U9SMtHaiVUSbM0u7QowJn9TCKWHut3wxR7qygqNLxPaB7rIAp/mR
 9dzF3qIdLCqFN4Ddw4IUxTQvlleo1nyZTpVFXgLZdQKvvHf7xnDWgVkR/9HE14Csqxs3wm
 MTiBsv96HoYPp4mSzTf3NFbryo0wSPTMsvoE8JYHOvxmACqO4euhf9oehwJ5+NMoo4u2wd
 xILa4NPFdL81aEn+2kwQRU8VIDchqRFZxEZ2xgTnfo53xefuKpnLk4nW7QzH3U2S705++x
 ElYk+CiEKIqPIMYIAnRtAVtoUHagLaUvEBXDx/Xh2B8Ax5CSw02a+PyegCp7TA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AP/PVCvo
Subject: Re: [Buildroot] [PATCH/next 1/1] package/cracklib: bump to version
 2.9.8
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
Cc: Stefan =?UTF-8?B?U8O4cmVuc2Vu?= <stefan.sorensen@spectralink.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  4 Sep 2022 17:05:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> https://github.com/cracklib/cracklib/blob/v2.9.8/src/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...eat-the-input-as-text-when-formattin.patch | 30 -------------------
>  package/cracklib/cracklib.hash                |  4 +--
>  package/cracklib/cracklib.mk                  |  7 +++--
>  3 files changed, 6 insertions(+), 35 deletions(-)
>  delete mode 100644 package/cracklib/0001-Force-grep-to-treat-the-input-as-text-when-formattin.patch

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
