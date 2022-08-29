Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2BFECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 20:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0105D40502;
	Mon, 29 Aug 2022 20:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0105D40502
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9d3WBqo6RMKM; Mon, 29 Aug 2022 20:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 215F0404F1;
	Mon, 29 Aug 2022 20:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 215F0404F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7000D1BF3D9
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A5DD40867
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A5DD40867
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zGMgh3Fd0vG3 for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 20:07:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C083E405CE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C083E405CE
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 20:07:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6F72F1C0005;
 Mon, 29 Aug 2022 20:07:39 +0000 (UTC)
Date: Mon, 29 Aug 2022 22:07:38 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220829220738.512959bc@windsurf>
In-Reply-To: <20220826135503.20612-7-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
 <20220826135503.20612-7-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661803659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u5/p4XBaeE/e3c3yoKJV2LkC/MEzgj6BuPr5KcgaSPo=;
 b=L6lmh8GIl9HH1iqFRYzePl5fDF00N7PGWLoCJo62Z3oN2pSaXAHoVcZCE4H/bFJ+IBeMXm
 LL+qiIldSztj9Dr/Gv/56LjNUaKbpnDWW2TUz6yJbyYg+YkKChkQIMJNJRiW+galO0ynd/
 w1LZoCrTdi/adBbjamoU8X+l18c0b0USaGPNnu6iXb2qIjKclLefmmqWS6/wPaXQ/iMMK6
 W7rReog6D1i+0OdyOi1CYvpUON80pz1taIf7AUcOVNSrDsEyyPRvBNqleujIifQnENLL5b
 cDWdSsoNxOCWTrfjnv0Kq0ZQWDi12HKCddyJSAcES03bEQL9GZdNzgezWT/pZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L6lmh8GI
Subject: Re: [Buildroot] [PATCH v4 06/29] package/qt6/qt6base: add support
 for test module
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

On Fri, 26 Aug 2022 15:54:40 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
>  package/qt6/qt6base/Config.in  | 5 +++++
>  package/qt6/qt6base/qt6base.mk | 6 ++++++
>  2 files changed, 11 insertions(+)

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
