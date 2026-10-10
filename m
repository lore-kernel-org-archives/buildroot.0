Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600CBCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50C19608DE;
	Sat, 10 Oct 2026 08:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Rp6VNJdTwb8; Sat, 10 Oct 2026 08:56:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2C7A36061D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791622560;
	b=PYVQNqO+Xbx95AuXeLP61rx1cf+iOqEl9Banby2qmYiY+7ZCVdbdOdaVY8+YtUts93OT
	 LmhijR53C04Fn0Ze98dwO27Mfl8vwyGDa23A7KJKef57y1FiF9z9bnPN5LFY7sck5yE25
	 Z+1ubilacV1djaKBov+jPTgW54D52Qnr8A4vphtOrLmZs+C21y/7NjcB+hXMjDbMguLyT
	 bQOMsFrKnBRGCD+ZXV6J6T9vgcyi219y3eWnqZPBtb9GcFPamvtPDDP8Ai01sd3zCXA0Z
	 JVLOQje3hMpwUYj+VPon5pilhUKCgyEHkX5hF85+So0C+bMWN8MYQzO8M240wOQTaVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791622560;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=6cHbtH+B0f8GE2fQZ5Yt17CBaeFkeYzVoAoCjlCMYfg=;
	b=WYSiS9SlFNAlTsSIZ3LZo+1rua70Cr4vs8WLGc+1mshkBpG+9mLDH83/YNEkkGA+Dml2
	 OOnhZimb2ji8n4dt+PPtNEr4Z732cPUqzWHGdyDZKRe9zx9Goven2Y2Xjex/0QMeUfba1
	 dzerGoOSh9eBq4Zucyaen8KTmwIX8XmWz+o7BYS8qo9mLYdGAc1EKPYoAjE8xjLi8hJCa
	 dKRZpypD0/Oa8BkdcjqLiZdUS549Q6DvUz7wNfHtZLDacX86Udo2poyXyEQrlO+T30F+p
	 FMCyYhgOkjIOkmxM8UIkRYO6y2gD3BY/lMINui7c86Dv7shNJAHvsO6mOG4sYS4ED8A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791622560;
	bh=6cHbtH+B0f8GE2fQZ5Yt17CBaeFkeYzVoAoCjlCMYfg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X3Ocds/ZpG17hxUQoL+cFvNFfnnOvB8zO4E+65riNNUP86Oblax9VYlEwFAoQyv6v
	 +xn3Iar3R5q14gNICMlEND3bmCtLjsf4XecBpOKPoeJgDi69CUJ19JL+eTLExlvGjL
	 NiHZEXlgh8AVD8SldxsGmPoMLTOskZOZR6jTa7elGl0n5hK8/wluA6DQmF04iTpbS5
	 z7v2Wdoa7RvIVd3IbCFQSX7xSvh2qwHIWUFjAaOWeG7PtDnyJs4PTiioaTo00MVbzJ
	 z3izXGilBXiv7DAz5TMb0dN+8SvNKoh4iO9AoAQ5wkFgoRQiIxmkmAHPawEm+k054r
	 quTBq6vuXXlVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C7A36061D;
	Sat, 10 Oct 2026 08:56:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB5621DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD2C1811E1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8Yr3jBWyIz7 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:55:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9EA3D811A0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791622558;
 b=FQKWWTNFptC/64wr1lKGSqsfBdWNbLTDloLyJgxk5k0PdpY6B3qzW4L/Y8HZWP8qMH0+
 U6JLiTW1+RSM754uELh6PKkd6+Ho6Na4NZlIrqxQNx410gdQGure3YNK6BOiAkZAkCFs9
 f6/HyxMI8M32FKHl7jNRc1yxjJrdGQvQ8i/brTEb8x1ASvnciiJ9cRNbeAY78Kdv2O47o
 amzC3xV+L/d0xwSmxVk6T24yydjGRAGtoWa521XLJchavLXMex+X6wtlG5cvFu78m9B/P
 Ogvx+gvnIe0UE+wcg0XgXEQ17+inXdpUtZM0mrziBlcCz8fzEsIY0LdrK+M9ieO+lCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791622558;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=5+pCnFFqA/qUAcvGN+SY7F0W61gBARsuwq9QkJV40hc=;
 b=HhIYiL1t/B+Qa7W1cp96TIkSJl6O3Mz3K6ApE0qGTsGPw2kIEICITUFa+c5v9lVtAcpI
 2OmE2zLf0Sa2297aC3Pz5CBRezIJhL/VGqGSeanzWKZmQb+r1BByi2QPh4bjFHQQmCWH5
 KT+ex9zZXcPezMEyvsCwDbMp6smvu3StkRAA2qffAUUhI9GouMtATgv3+mbNos1O8XLOC
 9sp/uLcA+C+/+rAQW7p+KkGdt330Su7EJM3NO9scgt+f8YoHYfwp/Pb5KFBPskh9aqgUy
 jb8OFhqffopHokTgbCXY6Ed8kIY/nyr9muleexreGV34XC02p8A1U8ADx0hnD2vlojA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=P5kPS7ir; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EA3D811A0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:55:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6DAB813F88E;
 Sat, 10 Oct 2026 10:55:52 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 10:55:52 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 10:55:52 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003224447.744966-12-james.hilliard1@gmail.com>
References: <20261003224447.744966-12-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <b561240e303d7a344e61262fe7131518@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/snmpclitools: bump to version
 0.7.2
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

On 04/10/2026 00:44, James Hilliard wrote:
> Switch to the poetry-core build backend.
> 
> Use the standalone license file, including the updated notices:
> https://github.com/lextudio/snmpclitools/commit/d95f1008c52cf5c3cfaa705b383cdcc44c284066
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
