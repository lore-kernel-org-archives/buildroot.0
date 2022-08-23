Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6CBC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A837F4069B;
	Tue, 23 Aug 2022 20:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A837F4069B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ufh3WdelVNu2; Tue, 23 Aug 2022 20:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABCF340861;
	Tue, 23 Aug 2022 20:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABCF340861
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 955E01BF5A8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E7A540860
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E7A540860
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Ga1ztex3PL8 for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:31:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A4264069B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A4264069B
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:31:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C39C420004;
 Tue, 23 Aug 2022 20:31:29 +0000 (UTC)
Date: Tue, 23 Aug 2022 22:31:28 +0200
To: Sergey Bobrenok <bobrofon@gmail.com>
Message-ID: <20220823223128.2d4f3cc0@windsurf>
In-Reply-To: <20220822221452.388659-1-bobrofon@gmail.com>
References: <20220822221452.388659-1-bobrofon@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661286690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x3OX0ncnAVdrl2lRfM9udXX+4Dm8+ML2bF/H7a4Uvrw=;
 b=AN2NLrYA41uF/n8c8J7S25Y5XHukE9IS3r7C5typ+s4cbm9udJqCOkESISOk2/bt2qYfg3
 uVLXvcoXKMgfA+FSoWkBA/KHI7ncwNkZzwOAaINPUCtSG8STTkEpA2KRq893qUDl8Jzwdp
 HSvPdt4nRY+KZegvDAWw8C0xJD9baljwDBYsVSeZ6fnSWZ4gkWmaMDp4BHVdtwMcVni1Md
 ALaze5+3DO1Gl170yGffC2K92wqYSxUm5USeZoZhUt1LYHHsmtxgGL3+dDzbqutXe/xsK0
 i3/osqMMbbxbTUsJPTTZiPxKgskvEGayTz9CAXW1nl9b4ffCs4HTaGTdCqlFwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AN2NLrYA
Subject: Re: [Buildroot] [PATCH] package/sdbus-cpp: bump to version 1.2.0
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

On Tue, 23 Aug 2022 01:14:52 +0300
Sergey Bobrenok <bobrofon@gmail.com> wrote:

> Changelog:
> https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v1.2.0
> 
> Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
> ---
>  package/sdbus-cpp/sdbus-cpp.hash | 2 +-
>  package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
