Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15274C98304
	for <buildroot@archiver.kernel.org>; Wed, 23 Sep 2026 19:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15BFB41103;
	Wed, 23 Sep 2026 19:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkNi92YQnAAS; Wed, 23 Sep 2026 19:33:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BD7EC41120
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790191982;
	b=VsF68J8Qm0X7vpDEZqET/2TqaDGe6oJ+LdaCETx/0fEFrrO7iZkbltoD6TV3eU5g6EMV
	 H+jZdkis5gIk+ZYljcS79r4hdvwxjcb5yZNJ3mfh6gXUx5V1dxdorE/sa5STxCzJCy3YY
	 s0V8ylcBLkeJBHfn0z5sxftGl8G+inclQUQFJR+MXME+OoY8FnkJMPXLkIKQRGPH9oW7J
	 zpayBeFvWA8cQAsvHmu6znmgRzYpRZTo3GYnHR350MTu7B3X+SuHCiQLH3HAIPC1dNpEb
	 H+NeYimBY0BwjdvXWLQm0Y2tTBt8IzLvDG5bl8hQ/NOdPigMnwtnUGeZHUPK/KqfeHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790191982;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=/NBwCrk2J/a5yZRW6aimWTTNSxY3fK90dIbNJ10GZnw=;
	b=jyagsmPKRQ6bV5baZBe7cpix/BeaLQgy+USBmkc3UxF0Q1CddM3+ZwnMYQLzMYbR/xeP
	 58NLfCQCXwk9HMmRmNELdK5cZ1QIOAzJHN7rUnmbNXLRwfm6Ig9dTQoLOIsBF5pzjMvis
	 qm4/Kunp2a3fmzh0kS6mkacV5vtlGpm92cQbVeRVFNzANw94CHCeZYLXwQ8qYVFgtLRcp
	 tqIzk/P6A5MEe8W6MqxYrXcSc3vnqSVoounvZQxtfYLk5OhQn9bRtNopGH3nfFox1ICwV
	 3Ld1Wyzs2066YydT3tzPRRTLlNFUY9d2wukLTAK7pDKX0a5n3qWDK2TloLztpU7ZPAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790191982;
	bh=/NBwCrk2J/a5yZRW6aimWTTNSxY3fK90dIbNJ10GZnw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=adDmqmjLIUCb2F5V6pplJrq8+/jMedet6UcL4JRePFzvX6r3rv4jQdfmbTl6Q+KbF
	 A37LMRa6TEVmkmwvbbh53sOXEeJ+Nbp1ecssfWy5c2Ar2ChFjre+Ay73tEs2PH1jKA
	 6owlx7fKMpF6KGmz7bNRlMDbOUSnOJ7nKp4m0I3TGAwrU/cu3d7RTSusRaUvyhh/fP
	 gEsz6mpcPZLZ/VN11M2vSNUQc/VOvKY8bzbm/YigGPKi1Bbj4q9eDxcKH6xJdrz8fA
	 E7+D1TjGwLY4UyeF3LZr5q3eyKXDEZ/gdzhzdyi/0VakDL5wAAa2zuKu758P9TysmA
	 y2H3EfndfwEvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD7EC41120;
	Wed, 23 Sep 2026 19:33:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E69A3A9
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C04360DAB
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnBIPY75M0_3 for <buildroot@buildroot.org>;
 Wed, 23 Sep 2026 19:33:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 14AF360DA6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790191981;
 b=A6A8ec5Xx99M3c7IqUCur5GeoZ/ig7GQCVd/EcU/MhZWGVB1NTQ+WffBIlY3Mzb2X6/O
 yXt8mZn5WY9Vk4eZQhgvHtYnJnl8PiPr0IQvBGRNdEL5qGu/cw3QKMlpJL85lVn5I+mhL
 Wy0FxKc/IipHsgu8962TdNdKlnxV0mpUnGDd37/OgC6ZiCXFaeZIsfwKYaoYQHOa/HKNC
 dCkNQNoJeh2cMezwLZ/4FH4ll/cj2ISVb+/KJw5eZtvvEP8pAeDiYdSPjZV01z9o3qA8x
 mac4K+gGEa6dOi8GJw/sQNfa6iYdO77eEXVo72tbvuqP/eVIc2H9MDsA9+sHw06L8iQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790191981;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=5+EpBahLOmK5CvtMolJodVd9lgGxUizrsrmTaMLnMjg=;
 b=tDgRFlwHiMBl9T1uFip0MWvg/vS32vfHjki9oHe1U2yn0/+TX49j6/H81l2NEf6Id154
 ifte7eQViSTefNiLfS5vrL4aY/GVUXNciehtZeKK3dNvUB9mGgqcE2TLQRGd6FBvK1uDz
 7eyrL4sxonWnFS7nc4tZyNF5b1gaQ90sDEOSmK/P+NQF5sBZytnPwbxHP/o53OVj4/hOp
 kXUye3Q0THgW5wzktaR1OmSutVB6upwJpxFFt8z/O+Elly/bAgnLJKxarMI0Jn5RNlwn8
 O2rutxJdx4pqgmyFnUzEbyNd5Ok//XrRusAQFZzUYXILT9AGvfP7ef1lEA5akO/72Ng==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DakEYtHn; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14AF360DA6
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:33:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 895C12003DE;
 Wed, 23 Sep 2026 21:32:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Sep 2026 21:32:55 +0200
MIME-Version: 1.0
Date: Wed, 23 Sep 2026 21:32:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260922214143.1974032-1-bernd@kuhls.net>
References: <20260922214143.1974032-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <cb0df41cdfd173113eb2761d1a8a293e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.8.5
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

On 22/09/2026 23:41, Bernd Kuhls wrote:
> https://github.com/libexpat/libexpat/blob/R_2_8_5/expat/Changes
> https://blog.hartwork.org/posts/expat-2-8-5-released/
> 
> Fixes CVE-2026-93990.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
