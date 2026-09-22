Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31310C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 17:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB2F5606E0;
	Tue, 22 Sep 2026 17:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqS9j-SI3oWe; Tue, 22 Sep 2026 17:04:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6A95860715
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790096680;
	b=L7ktoLqyLZ536K4xQCcylqYPVyX3aTf+eoBb3zS0OBOLu1lcMGMtHNItkmQj64Tv8C+s
	 48xJIB9S3TvZI4Bbbl+tb55hG1TmlRxqaxJ1DgviQ4+7N6WzLKPs+F9Qu3Tl6SlaEOHFQ
	 ogxTOpuvoRoSDkmeVI5cqdbnWce9lQ0QSpR07tJ7UY1cnzuCiv6uLrPi2dt5UckvKtZzT
	 j9g6rlhtvahFWnTMC9xL1wyQBzOSmqRkAn99uJkvS0P2jocfz+BcHCGnUoU/b3dAcvY9d
	 7Q0x7vbjcFFjbrUud7GFZjN9V1PCJAr3//kTVH1Re6m59C7hI7OwgI0rIanT8XPrqlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790096680;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=2NciB/jgc7SY9q+zl7hLCat2XmcoV1pvZmcrFflkalI=;
	b=DCX6zIyhrMklJcV8nFwlbVCIE+Y6dmgi9I1BUiSSNhdU5FnuWOQTcbfMTJ44+seoiGrr
	 x48ehUGEV5Ab0jKQjV8ZTSphyanA6gFC7wsrB95S/asEI373+2SLVOn+4YiwWGNxoRQ2f
	 pteOoY3jkalBJnkdeg3DchS9U5GifIn0py2q7c61pvfjJqw3LtBvAPVDKRWYT/yoqwFUZ
	 7WPRySBQhbICxZS5gPTJv0DV+kuBp4BkWmm7VkN4uLAsMQ7mVXaFbKagfuqleqT5kUf+F
	 WLcwAv+40jfaA+dXUGEngh7I7K6rclH2oIf7z028OPksSO/QUV6kcFtMjv627QdBelg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790096680;
	bh=2NciB/jgc7SY9q+zl7hLCat2XmcoV1pvZmcrFflkalI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O8U/KaEPdppOFTbH1sISHc8f18yd52KIR5CK7reBVYMU0wXztM6t/HkFGIcxwfhjf
	 fu9fG8BKkSwdEQgTgtlT8HfwNognrT+01oc/E3zS1+lSYzJ/tUo4/b6TL7yWCEUDdD
	 sOUiir0HcG/p5ypBFhkHRl/B+X2t+YxVpq7CRuGncS2kBXbYZB1OEq/cYUwW6d0AFI
	 sXZ7D2Uly4I52v6PzExMU5gpnYDP5i1wb1cGNxmOiu6UCBfB4OzgmB4+qx6xyQVThV
	 hyEoNzHF4blIoGaIvVuvuVGqr8AUAPOOIQYfq6l+sRxUryln1WEYchz+ki2Cwf68iL
	 xsdtsnMSztfIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A95860715;
	Tue, 22 Sep 2026 17:04:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7629D1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8E5B4083D
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7asTioMLEpGh for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 17:04:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A5865407F8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790096678;
 b=f7BNs5YNrA5/S6rz68fnSaE6ieQil5iOe8of/QXlLlehpwz2+yXXMXmZjTBfGIYVojX3
 h/u3tJcyjyiXaq5QqVXvsAsmaQSs1owmXO1V8AEPwBwCzf61pvghh9g5MB1j9w6fjByzJ
 mi8+EM1rNEAYgnhj4pvFT3G1lY0r/udv462eqtAdzeTkp1gQwe1jB1onGHKErin2/TiiU
 IYZQjHU4HsdLqrCvtBEwTrC68+EErULtSZcPz8QkZx8TbXUdOoyh7LpyB7yACC28CwwZA
 fTaaoqVOz4RZQkMuJQGriIE1SfKCfYp6ZiJJr1gedmhRybIvgdLba6PhpMOn4OnvdRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790096678;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=rjCNfH+JWiPQOSvFhbv7qlsJ0C8+bxGNxgzBCaX1XP4=;
 b=qnRNelwbp4mgtBBrR1qMd+ahBLdjyVAuy8WhRGEwqaWXfwrVw2Qzp8DRK+t7V8fCOH0K
 C4gi568L0Ca3ZehAgalpg+gmKsz7VVZyFj9OQ355oXbopX/TVU8IbdtLb/O1dHZgdvIyR
 WWq78C+3u6TzK+x62qr1KVThqr7BDMOfc3mlVCWtu0dC9WkfvCjSHX9gBMdDjAklc4K6+
 xyUwgchiUjZwdA7YFU4wis+zg9eqJXmIyOn1fXJGN06IRr8GdAAEJlfsuVVCXPSdroTtj
 g8SiNq3QdVdn6CYGRZfmu+H8IGRdckzP8l21hpdTv3n52eiPaXSC+mLBaBK3jbMfCDw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=epbhN9P1; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5865407F8
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:04:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7ACA119F733;
 Tue, 22 Sep 2026 19:04:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 19:04:35 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 19:04:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260921055210.4489-1-bernd@kuhls.net>
References: <20260921055210.4489-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <d93ef4d6f10126a2ee2f1f018ab364a5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libde265: bump version to 1.1.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 21/09/2026 07:52, Bernd Kuhls wrote:
> https://github.com/strukturag/libde265/releases/tag/v1.1.3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
