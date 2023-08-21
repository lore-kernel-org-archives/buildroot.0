Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19094EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1D2D4063C;
	Mon, 21 Aug 2023 22:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1D2D4063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZPeXwATbQV3; Mon, 21 Aug 2023 22:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BB9640B53;
	Mon, 21 Aug 2023 22:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BB9640B53
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C5841BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64BA64063C
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64BA64063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RcASe8a8HtNe for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:12:18 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87AA0405B1
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 22:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87AA0405B1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F1E360006;
 Mon, 21 Aug 2023 22:12:16 +0000 (UTC)
Date: Tue, 22 Aug 2023 00:12:15 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230822001215.7b6c29de@windsurf>
In-Reply-To: <ZONzIHca509hXEbx@waldemar-brodkorb.de>
References: <ZONzIHca509hXEbx@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692655936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKvLkXov/ycj6nTVvvP4wcGfkUVHkkXYCsIh20viUkU=;
 b=kZ2NF4/nxpwZPTBBXHsicFI4hUtoN3SafSBmUy3QlBqKhcWFlFuefGrwmzmDZGPhGAqGKo
 nB93S+riJSPn2fXxLMWsIgDg1/IR6G3s0bQjZyHWTvixSXXVCTFy9otQy+Gqz3CsAajS2b
 LX0QOerCHMcVR9uzr+nTrxCc0i88dE14pzMqcyoBan/JWKCLbffkQ1zpeD8/vfIW1EPOAI
 a6bMEWQF09O6aSsUZxsfva3NqkI97tg6fWeSYbpjrsKOUKdXdzCSVeFOsC/BVtQjEVeeB8
 NtZ5m9kZNEIoBnxd5VFgKRppsKo6SNs3Q+jtUCKwpe693pKboY8czVLksOZfsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kZ2NF4/n
Subject: Re: [Buildroot] [PATCH] package/gmp: bump version to 6.3.0
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

On Mon, 21 Aug 2023 16:22:24 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See the Changelog here:
> https://gmplib.org/gmp6.3
> 
> Patch is applied upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Thanks, but we already have gmp 6.3.0 in the next branch.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
