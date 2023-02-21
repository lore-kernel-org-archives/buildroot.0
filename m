Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266A1C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 21:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A356A81C21;
	Tue, 21 Feb 2023 21:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A356A81C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L6fBRKfKDMrR; Tue, 21 Feb 2023 21:24:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF06181C67;
	Tue, 21 Feb 2023 21:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF06181C67
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31F101BF39F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 103B040160
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 103B040160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XfKwavDCcpJq for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 21:24:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E54324011F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E54324011F
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 21:24:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2136B20009;
 Tue, 21 Feb 2023 21:24:08 +0000 (UTC)
Date: Tue, 21 Feb 2023 22:24:06 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230221222406.7f4d974d@windsurf>
In-Reply-To: <20230109001037.641422-1-james.hilliard1@gmail.com>
References: <20230109001037.641422-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677014649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zy3y5jGFj1MGyYQaC0wmWZ5qUD5exOkd5hBetPXnLnc=;
 b=hQNI/ifAj94Bm3NjAnZgL07EnfvfaJ+OA2cRJWXzRTznuEfNEg7PyqkIiY/8GCQ4fJpu0b
 Gs70b6Wc0CPHN+WWX2hhhqs3LarG6hMkqctN5Ud8gU+kiEj8RGIhjjPaxRjUrKhvSg30n3
 7bps3eUvcPHxkQptswVNPhcaqgxhe6AqJXp/k0DYyEi01gm6+Y0zi752b+4cyFeQvBRZwE
 IOP8FPKYZhIi0kc3s8tWSLbIDj7F6WxTri1SRjCLRf9gs9ZDBYCwOF882oE2lEZNI/Rgm5
 QJFGSgVhBcD0rQr11FT5C0/YiLATkmbOkZG/mNQa4SYdkHuS3lOdXBjUq0TPDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hQNI/ifA
Subject: Re: [Buildroot] [PATCH v3 1/2] package/cmake: disable ccache for
 host-cmake
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sun,  8 Jan 2023 17:10:36 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> The upcoming ccache update will depend on host-cmake, so we must
> ensure host-cmake doesn't use ccache when being built.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/cmake/cmake.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

I've applied both patches to the next branch. There's quite some
trickery in the ccache package itself to tweak the paths, so hopefully
it will work alright. In my limited testing, it was working fine. Let's
give it some broader testing by having it in the next branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
