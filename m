Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DBBCA0FF6
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1AF840420;
	Sat,  2 Sep 2023 07:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1AF840420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WATR1HAE3d2R; Sat,  2 Sep 2023 07:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5064C408D1;
	Sat,  2 Sep 2023 07:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5064C408D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D67E91BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2D6D81985
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2D6D81985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZTCsRkIBtWiH for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:39:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F45D818C4
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F45D818C4
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB673240002;
 Sat,  2 Sep 2023 07:39:30 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:39:30 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230902093930.4bc41df3@windsurf>
In-Reply-To: <20230901185509.1031327-1-aduskett@gmail.com>
References: <20230901185509.1031327-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ub37hlOtwXBL2hOTIhru+CKtxFTaOW4JpioPoFIFT48=;
 b=nOPusooMWcNDsM1nermqkwfLWWkT1R4zEmhT0sHyf5uckQ88skU5vagpfOVoJepOF9Z11y
 OtN7O6qSYRuMKkYbVsbLiXFntUQxctQDVu241ieMnoM36rMfcRnhbdMarvtwnziggCQgqc
 e+SBkhSTFznTAZwbSNltL3JypM4uoNetbLqRyff3v3K38a6WNTyiF6GCnlZdVHN0f99Ld0
 cw9IfNUIyxWuqbtkxrBq0U6zYH04nFTexESFIsHihOAFvfqxaFfyenizivkN+bMUXMER2l
 b00y30AAv7bWrGKvTAaLIG366vGiLY8xpwZwGATUVhRsKy0VvZVwULS3KT+WFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nOPusooM
Subject: Re: [Buildroot] [PATCH] package/libopenssl: bump version to 3.1.2
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

On Fri,  1 Sep 2023 12:55:09 -0600
Adam Duskett <aduskett@gmail.com> wrote:

> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...002-Reproducible-build-do-not-leak-compiler-path.patch | 2 +-
>  ...igure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 8 ++++----
>  package/libopenssl/0005-Revert-Fix-static-builds.patch    | 4 ++--
>  .../libopenssl/0006-Add-linux-x86-latomic-target.patch    | 2 +-
>  package/libopenssl/libopenssl.hash                        | 4 ++--
>  package/libopenssl/libopenssl.mk                          | 2 +-
>  6 files changed, 11 insertions(+), 11 deletions(-)

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
