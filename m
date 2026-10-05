Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE6CCA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 20:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E58A74068F;
	Mon,  5 Oct 2026 20:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CULbVRr_b95I; Mon,  5 Oct 2026 20:41:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ACD784063A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791232902;
	b=cwhJkVTYQ2MgZ/blcsmUaIFYKDljQWoKONtZUrAHh3dfpRvMjXsbBBmrUhrjD50PJuBq
	 /6QPyh4tTtEDZ7AwL/dFzxF3lqBy1tg2X9HdVLJ55yP7pnOI5P7lWn4dGLoi4Ap6N1Agc
	 /1Pf3HtGHlkLXFwFFKMUdZnNSHoWlrl+yJRWSgSXzxxZqBJGYyPRLrYJAdeIwofbSqEuv
	 JNb5SjSVfUt2Y7qdXxE0H51dk+/m2BoSw8OLXkwEPAiW9uGkDYW7p9rCP5H2GHmB1I7pO
	 nFi+cm3kCgh00h0iWR24z7+9mXsy2UOOuIuUtERzs0+1d851PgGoj+z2wWzY/OGqOOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791232902;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=oCqVCpAYOb6sk2Wi7iZ80Po06Ix4dDxh0pQz304Blzw=;
	b=NASGx43iGqHDVbu5qgkuwSSp1bNTdRbH0GXFnnpVqCYxRksmLzERa4FPR9f483fw2o5O
	 hOKYn7TX5D3Y9e1eorl8a/lMX5uPNN6tR2LqyqSWzt4WYeXgCENN2wjsqdbkfn4CMq0m0
	 MPo94DfqUbvZN3/ALU236n4/AwaEMNjt3DHnjwarDFA6Aa1Z46Wyhaf+M3VHAj9E8wOa1
	 MXnJyuRtwWoQgB3eGrP8/fQL0TjvXN5++rRESwVNQ1YqgPkEcO5QAdv3je7NevN82oYB5
	 jWw7YIePSkNokj5JBBEGEaOfheG8iWxbhTsltgW2srbvay6gWU4pbKJH/sXgghQFZrg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791232902;
	bh=oCqVCpAYOb6sk2Wi7iZ80Po06Ix4dDxh0pQz304Blzw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZWzLvuBvAkVSPeM9hhhAC7zykZPlAueHg3l48NiKehEmcoMG8SkkB6NOXySjjyr5N
	 XkVIw62+DYFWk7N6EQFqbCQenTW4AIcjR6+mHIoTp6ilJLYHMCZsNKpZqW4v1M8nxf
	 c0ashGJbParVcQB5MING9aN94W29tM8nGS3aq/1NxgU2RGkfY6HJCcu95HDSMQj4MT
	 p2C35vQFMuetE7vUnSZ0JCXNY5om4TKnmAPZZeXyMsMEMdY9o7h62bQvBKWQgb4ROJ
	 4TkLp2mwH4YKOmnUwO81SEkHh4ZELagVAquxEKN0zOIIWobJy0KQHOMEZ1tjdV5BNO
	 bTYfKUKvBQGKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACD784063A;
	Mon,  5 Oct 2026 20:41:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1546A34E
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 20:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06D1F60699
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 20:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahyRDyZBNeXC for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 20:20:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 76F32605E1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791231642;
 b=DPrHl83+qJKY1GGA83GD0jgH5QB+M+cnXwzkUVGF7ZMGrccviZbREL7klRqrpvf+IkO+
 C2gqDzJ9qILtt0g57/zhEiNLJ6P+5H0oHpGI52kFEmmiipLJqu2FuFKVr/feq+tTfQkPT
 MChB1ax71c1KolTpLM24oeqeny4cycrD1haiBZHtjw60ZPvuYaxotXFa50dce7ksad/tX
 PwxD3bGZrgIOKMSV95pyEIaAd2bW2n/IsEUmY/Dcd75ojyYroxeY0GWyYRig2MFX4LJMg
 WPFJJfjg4nGAb3FyNT9u47KI0tzd0aN7k5IGjjY/PXkPtvKiQjf4lr5J/BVGm+jTrqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791231642;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=9UqLOls+qS2dqkR0igy/uZCYphSemk71AGLtuUBgj8o=;
 b=AtvZ+L8a/JIqnJsxsfJ42u7Eey5FQO0RunPWwf1GaeC34SQVgWjT/zc/IkkDYY+NCfB6
 QNRKiecbQfwSbBrc4AA+0McmU3bSGN9MP+GbVsGbXbx9klgPsXrdYv8vkCJA3XtEo9vSt
 T5/xp3jktCqPqvupGHwHFZUNmIvrRT9bkSVQQzWWxKhTDEoLm3uYQYzu4RtXB/a1vozZ/
 oDLUTNjcQ9PL4wxq1und8Y07IGBFk5o5KpQErHywuJNnZ7sucYW/Gbl5JWfuCypVyUX2p
 hNl+FhCvQ6QQsVNSIsrIjMJWn7wZB90M8jkI2Pg9kzdWq3X1GBu46LO4A0uan/2H/eg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XHR5SwxD; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76F32605E1
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 20:20:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E60B119F59C;
 Mon,  5 Oct 2026 22:20:35 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:51288])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 Oct 2026 22:20:35 +0200
MIME-Version: 1.0
Date: Mon, 05 Oct 2026 22:20:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261004180224.1782750-1-bernd@kuhls.net>
References: <20261004180224.1782750-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <7593b26788ffb212e2eed198099753fb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/python3: remove configure
 option --without-cxx-main
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

On 04/10/2026 20:02, Bernd Kuhls wrote:
> Upstream release 3.12.0 first included commit
> https://github.com/python/cpython/commit/398ed84dc40abc58e16f5014d44c08f20cb4b5f6
> which removed the configure option --with-cxx-main.
> 
> Buildroot commit 36e635d2d5c0166476858aa239ccbe78e8f2af14 bumped the
> package from 3.11.6 to 3.12.1 but forgot to remove that configure
> option.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
