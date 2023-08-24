Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4BAC27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 05:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35122418B6;
	Thu, 24 Aug 2023 05:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35122418B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rlxvY2Zuya11; Thu, 24 Aug 2023 05:03:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EF5A418A3;
	Thu, 24 Aug 2023 05:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EF5A418A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71E4D1BF573
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 05:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EF9E418A3
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 05:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EF9E418A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kOZiUdit1rUC for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 05:03:15 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58B20401F9
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 05:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58B20401F9
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2AE1E3520B64; Thu, 24 Aug 2023 07:03:13 +0200 (CEST)
Date: Thu, 24 Aug 2023 07:03:13 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZObkkVYdEW8TwIPe@waldemar-brodkorb.de>
References: <20230822180900.6953F86114@busybox.osuosl.org>
 <ZOXFw5o17WS9rg8n@waldemar-brodkorb.de>
 <20230823224542.08943172@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230823224542.08943172@windsurf>
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1692853393; bh=8qYeHVLK2iGsVR5g+w20U0kZslvLSl9GT1v1El8iMf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pSftygavU9zXFGBMJZojVMuAWclRabH3ABbQy3sz0vSjHlNFr/9kTUnEiOloCee6y
 tfLDVYsQQL8KBUcAK5qZYBsQVDUftZGzLkMgZKMxPzSsJGMYObN9S0g+gWMTySEXwG
 4y+/N8X01lp1XkzfEqs89d9lB4GtsaY1aUrrHTHh3rUnhwgLsqaMfJsijwV2r02bTH
 5FP0EJw2yrt3IuAdFDjldr4aBw3ShTHPg8FksiJ2GMsYcSMpUgNNTK19hdwFLu3l6h
 x//UgHFNzOKh0hdaV6/O3ECVhB9BLsP+Rwo6sKmfUhG3nqT6zFrTFsPFNZllsPUKKO
 a1trS0MULrjtA==
Subject: Re: [Buildroot] [git commit] package/gmp: fix compile error for
 riscv
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> On Wed, 23 Aug 2023 10:39:31 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> >  I think we need to guard it with BR2_riscv or not?
> 
> Ah dammit, you're absolutely right. Will you send a follow-up patch?

Yes.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
