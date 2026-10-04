Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64503CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 07:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADE2780EF4;
	Sun,  4 Oct 2026 07:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OoNdKDKe8v6v; Sun,  4 Oct 2026 07:28:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 155E180EDA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791098905;
	b=KcIjr2Xn2lLd0F+GQuAsVhjp9Ow1O9XSR+bt5b3JEiGk+l0UPnbZqG11bce/LG25GwLK
	 GzqcIAkSiuROf3e/VS61GrhSQZiknQiUhe4T9APkGAiHuw5kMeR21damTPFzRXnYD3vYw
	 Q6PxhXtbQGH1ogMK1cGKdRo0VtA9e82APpwqUKCt5J8q1AZeptXuDbfqBBOJ6qGctsvE9
	 VyKoBo/0mls4P8nPonnEliSrEjckopT5ai8AnlIZBD7ooFflCFcwZv6q2a013WmoHWAA2
	 9YN85Mt0EvQISHuovyDHfp9YA72is2Bd/QfriqpSSEtz3vTrVGXIp5b/kkqueNKcefA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791098905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2Mf8/2AiyRKmQDHvIIAPNM/BmrRqoZ1iOTA+uVfRjIY=;
	b=n9VlBf/jD0Z4RtP2uMj/SlMAnA9gDjnR6boXNKxX52RD9Eqxz1YABCVZc7CqIORe2szb
	 dsoAy/L5iReHJRyZUUBxYzxtcRmCuFPKxVurhooN0+rr4f9cI3wPbZlxjnivsygF4oFZh
	 HPoo+9Dw1S4eg4JI/COhJ/LKM/XuF5wrmeCo2lds70PaFMpm6qJ8OTclIu1rnMKIymFle
	 /IQTcwuMUxkKkxTNFxv1d7/RJrwjDITqcqh7aaLqaQdTkGWpRkFztvAlEGfTsbjkuUw6V
	 ls0WQzBQ7/w1snRCfHdx8hsASFjB6Oo7vvSJHzOMaKXi5Brr7pUlvYjWO4l8EadDa8g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791098905;
	bh=2Mf8/2AiyRKmQDHvIIAPNM/BmrRqoZ1iOTA+uVfRjIY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qbQ5kKsF3gxoFue0nlS46nhM+DfBDN9iPcVFJglBbYTgjd4E4Hv/u2mRzmtnNToGI
	 ARK7enOU4kQx5hNS8lEF1hp+Ziw4DhOjZVY0pSNzYaCtrh9W18TupAcJ0xqg7Y/oSC
	 X78LgOxtWw4keetsvea3fUjXOFUfa0TfU6OFXC+NOOf18Uo8s+gMUH5VOnHp9+nobI
	 m+uckXpBxkyaM7ovE7b68ws0irRkNU+pZJ7lzAcq7Q2UyFTAopAr0lyk9IFm3Iaco8
	 w/OLoyHOLBuVzGDUd7qKBqHczvmp90L2URr/4zowjclUPFOO30kXD1pVNRqJ+KJNy9
	 HU88pwtka//Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 155E180EDA;
	Sun,  4 Oct 2026 07:28:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DB411A6
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 07:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A8FC4008E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 07:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tX3o6aFi12sQ for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 07:28:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E50D440079
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791098902;
 b=fBfdPgq8Kv8NlUjSUGAeXFP/HkXTFfvwwLi/X+UIrhinBjyTG7RKIm7kZbCse2pFxgEk
 rpkaJCwLp4BirUwAvS+UFGIlzDayNPkBQkWFZSqX6pCruU6VgC2amCgCoz6vOEFcm1aKy
 NjoJR9ZuwVr1dzh6VY1W9ulrzXPYpoaovX73rI9IAuJxkmhsf7X/hSbHGEmY8Ga+k2buE
 oo/wNBAao1bsxdz897sAdzPGphIuBuxBxkX6OcfXtSoqFX1IW/Yh6Yo9FF4/7foduITLM
 oC41vh96tVlA/lj7lYEO63H6wAFjL3byv8udROs8rfi/yyJu/aqoEwFvPo+khMyiOvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791098902;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=NkoTCa3WuCTI7jo98gL+zqQPLe4vhSPMgnTFChqp65w=;
 b=Hi79fSmqhC17BsxhtpTTlW1rYhan0P/RBe/wkJyoLT+9pcwbfP5SPGdSPhCaxrKhr6hO
 aRh7FKviQn8V4FOeby50lC9xLjVpHYnBuAXEZl5IRlEhH6zPddF962l1nNqAWrJGHAoeM
 Tk89/FebM7EGnSK6kueAJERpqwj135oqSoqJINWQlFdBGx7Hw0IV1iTVpnbQqoM7+8o6I
 7jX6dL3SMZyN5fCuIMIk94gUWwG2XdzeJsYE/w6Gb31EEG3A4H2+x47YNavZBu2qzG8/R
 aosO/jL8HgMmh7M8tLQlPb1vn/Rdd5LzGbBIW6SrFkxTx6l7QUHjSG4cGm67KDk73sw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=gr4s6VYX; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E50D440079
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 07:28:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B207F1A110E;
 Sun,  4 Oct 2026 07:28:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 86549604FE;
 Sun,  4 Oct 2026 07:28:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9D08A103282A8; 
 Sun,  4 Oct 2026 09:28:17 +0200 (CEST)
Date: Sun, 4 Oct 2026 09:28:16 +0200
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <asIAC__LmOtRMPde@windsurf>
References: <20261003205358.2056107-1-vjardin@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003205358.2056107-1-vjardin@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/aer-inject: bump version to 36d5b4f
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 03, 2026 at 10:53:58PM +0200, Vincent Jardin via buildroot wrote:
> Drop 0001-libgen-basename.patch, applied upstream, see commit 197f51d.
> 
> Upstream now ships a LICENSE file (see commit 41cda6d).
> 
> Changelog:
> https://github.com/intel/aer-inject/compare/9bd5e2c7886fca72f139cd8402488a2235957d41...36d5b4f59b88c37d8ecba20b2302bddfe38f1ec2
> 
> Tested with Buildroot's GitLab CI (test-pkg on all toolchains):
> https://gitlab.com/vjardin/buildroot/-/pipelines/2909708410
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
