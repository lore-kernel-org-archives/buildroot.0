Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA218FA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2A9A60A83;
	Sun, 30 Oct 2022 11:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2A9A60A83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qrTPcvkVsFSH; Sun, 30 Oct 2022 11:10:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA51060A72;
	Sun, 30 Oct 2022 11:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA51060A72
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09B7F1BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9699402F7
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9699402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrTupzmwhL6g for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:07:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4960401A3
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4960401A3
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:07:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8FDC3240002;
 Sun, 30 Oct 2022 11:07:08 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:07:07 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030120707.35cecd6d@windsurf>
In-Reply-To: <20221029195647.42758-1-fontaine.fabrice@gmail.com>
References: <20221029195647.42758-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667128028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iS9/LEMC2DUzlNhs37NogJpECr7Q86r87PUMJ42iikc=;
 b=QdDtxjVUVbSAwGJwJOBGc2ui3V/p9jH/C+FZ66a4MjoJDpE0Xuk4KwiE/mHjEwav4IMW0D
 V001bBM5HdU38VlNpZj9eYoccfkgyRwgoLHJ0bI5T/f/g9GnN2WSgJpQF359p5bMym8oKA
 Mv6e/LDqKtdLm7lGxdfYJMWEA/izQ+33W+Xr+ZPgiPyd+TKq6RG92Snn2nspjdRamIAmZS
 swqLqvp77Y9BenMm1UqEByUoOCKC4D+phcrYny+dwlvEE4072+hvcbc+BaKbi0eMWxrAx8
 G7yB442uAsvXZvvudaxNjbwVdNEKd+EmcfdtgYAALgwS4jes16dCHEAl6IVOgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QdDtxjVU
Subject: Re: [Buildroot] [PATCH 1/1] package/minizip-zlib: bump to version
 1.2.13
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

On Sat, 29 Oct 2022 21:56:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use license file available since
> https://github.com/madler/zlib/commit/352cb28d12baf02863ff5d4d96be0587ced419a1
> 
> https://github.com/madler/zlib/blob/v1.2.13/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/minizip-zlib/minizip-zlib.hash | 4 ++--
>  package/minizip-zlib/minizip-zlib.mk   | 4 ++--
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
