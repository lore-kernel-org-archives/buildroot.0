Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD13C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A52340A00;
	Tue,  1 Nov 2022 20:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A52340A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hWknwLvpGmm; Tue,  1 Nov 2022 20:34:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4784440879;
	Tue,  1 Nov 2022 20:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4784440879
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E4B81BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 190A180BE6
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 190A180BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQnG4g7GAVHA for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:33:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D94FE80BE1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D94FE80BE1
 for <buildroot@busybox.net>; Tue,  1 Nov 2022 20:33:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 00A5A60007;
 Tue,  1 Nov 2022 20:33:53 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:33:52 +0100
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20221101213352.253fdcbc@windsurf>
In-Reply-To: <20221101095954.10345-1-guillaume.bressaix@gmail.com>
References: <20221101095954.10345-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667334835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Pe/ysmSfpxe6zaaMqqu/VfZSgU+RyalSBeH6D6UgI8=;
 b=KTcQwpPmcNC9EKhFeViBzQaN6E2BafSvMO2z+Zx9Zlizcpd3vNSAzHhf8/UGw7OKIRJEVr
 6hkWZuHrBgo54jkXYOTo3NgVmcO1r1YNN7uJmzoSrskna8TkrrS8uqnHunb07FoVIGGGbH
 0rc6ijeEOYsT65lnowYouBEhtcDrD18UsdXZ4lKjf9ZCyYy+gRzhRWtPkrOnu3hlpQoZrp
 HCGWHEjzZz7lJkc/OfJiDplOEzKtT2TSwhEtmZDV2vYNZqX9u6exZHtK6mg7fnQOnEVEEy
 wJ733F8SgWveWWNdS+GhzbQdTP6o949SpazYJ2xLJvHr0igJ+PPW4CvQEP21pA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KTcQwpPm
Subject: Re: [Buildroot] [PATCH 1/1] package/libxcrypt: bump to version
 4.4.29
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Nov 2022 10:59:54 +0100
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  package/libxcrypt/libxcrypt.hash | 2 +-
>  package/libxcrypt/libxcrypt.mk   | 2 +-
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
