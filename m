Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5C2606A846
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WCSGiUxk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98BBF60844;
	Wed,  4 Nov 2026 21:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjZfatxBlFHx; Wed,  4 Nov 2026 21:59:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7282A605E0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793829554;
	b=U6cnGgmH+Zf3Dd+aVObaXnWbLnKn4LfhnpV/a3vItgJ8COTc7W5+l8Z+cE0JC1Vp3zII
	 5X/90xAxf/IUD241wyjbRsCKJuIf6x0q/ASQjIuElnhPeeMbZSm8wtJBLBcYY9In7G3xQ
	 RmLVB8KDmO1RS6aCqKdpzWBeCOh8kXvulxJwFsJ8P29Cbbh0IfBorhuLFF2Y4tQfnFleB
	 3iz2piljcdv+chhyAho7J1z/fjgcppbhYhRj2mvN/2CAGV/4gFqh5ObKQxOMl1Csgakh6
	 WZPmhH3eww5uTf2NefEEKVU3/XvRmhJ+BGIwQgBesr2GRSCeCoExvhbKsAmGkSMEGeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793829554;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kVVTEem3KclOR5lTSCknNameWkklmtsY0bjAhOIRA3E=;
	b=LztCW6lQYbYOFx+48iLkNaRuTu0FsBaFhidZg8KodZSuxO+zWD34gopiY9Ro3fSOe/Xx
	 uw1jGLUuZbgKOY6M6I1r365x3nbeErR9qyiKoz+8hEPGsy5bsyQP/pb+YFn1uAv+oC6aI
	 tvwYXvb/6Lr5dHXoenCxdMsKQ8h9g3zfrn4L7WVIJ8pV8VhY6eY1hTYaplfmV64qgqQbQ
	 4do1+ThKCrXbd+Z06RGt4HJp/ehRuNrna+u+cIRnWzz5SZnzDi5ETxvGjZ15HIH+h9TpB
	 mNEr1m1/v3BtodKV5x/PfTjnsTZjk1yCwuAbrDhzRETbI+JC7bnqCX3qE8FXbJZ/T0A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793829554;
	bh=kVVTEem3KclOR5lTSCknNameWkklmtsY0bjAhOIRA3E=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WCSGiUxkkX+j56paasOcGh4xD41pxHFGOMCqoLgBGneRnML67NnX+ird34pCrnSbj
	 t1ac6mLRGqhKSQNjlMmPXLeDAIkt8BHWgGNBOsqLRapg5ss+FxapyAdeOQ/FsekFJY
	 S8BIbUjBW7qi53BEF0npoqYUjV/1CXFW98Kg1LCinB2d/MmOtGhrXmfFVZKSdAAMbG
	 DFWrkCwVJZZL4woZJH3a6foQAdY0e/YmvpI68glLRk3NjDNXpvxwDZ9uGFxsg4jMJe
	 1N6ZPPfaoj4N+7Mq0wwmRtC/D8dTvoPrKEow8WqkpR/ZNAqXM4ak+Qikf/G4wvMBCS
	 iwpSNFg7OnLyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7282A605E0;
	Wed,  4 Nov 2026 21:59:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D5637362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6AA74078E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opwNaoRRu2nP for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:59:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7D60440731
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D60440731
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:59:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 95AA54E403FF;
 Wed,  4 Nov 2026 21:59:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 667975FD65;
 Wed,  4 Nov 2026 21:59:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 54D4010328E67; Wed,  4 Nov 2026 22:59:03 +0100 (CET)
Date: Wed, 4 Nov 2026 22:59:03 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>
Message-ID: <auuqeiJezoi26OeE@windsurf>
References: <20261102201434.12138-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102201434.12138-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: fix broken database
 updates with OpenSSL 4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 09:14:34PM +0100, Bernd Kuhls wrote:
> Removed patch 0001 and added a patch series cherry-picked from
> https://github.com/markarce/clamav/commits/perf/cache-evp-md-fetch-1.5/
> exluding all unit test updates.
> The series also includes a different fix for the ASN1_TIME type change
> previously solved by patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

As usual for fixes: which commit is being fixed by this? Is it
8df2ad69de03c61378a85dc08daa1e9a2fa46920 ?

If yes, then please add:

Fixes: 8df2ad69de03c61378a85dc08daa1e9a2fa46920 ("package/clamav: fix build with OpenSSL 4.0.0")

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
