Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053A8CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 10:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AAA140808;
	Sun, 18 Oct 2026 10:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4g-TbRoToSP0; Sun, 18 Oct 2026 10:13:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8D13240817
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792318380;
	b=fLXNXTr+XJKyp94HX35zM1UD1890edgrUaigTOQruvljmyi6QwBY/IUhYNIwrGvCy8jt
	 BIFozDsx2G7vN5zlrkAEmABMlHFDkWuDwrZM9I++nCyzdAQ+y2m/u5rCkLf6Qu43F5PM6
	 9wDyXXxX8tn6xGmzoJazW0z9BVFrrbbp6ZSJ9rqTn+r00629ntbUERrW+IxTQ9alYxE6m
	 yD3U5x9a+nZ3oS3Y7oe5CgCE34CC5ujyv56qiRqNeFiM7nIuHqHIPShgVH/5AwpKftDi1
	 pNhqUjkOl8hpy1rph/7E6lS5d0yPIMeDzYzhIJIZYmoJIfbA+mTj1ocGS7qYW/p5TJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792318380;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=XSMNGuSUyXfCqAh5+qj1PUe8kBcnQ8SI5mG1VU68m5E=;
	b=ZPUNmeQj9gNh/r4wkgXQtmzu8IjCPTI3MUZnQe3xSdxLZg8kyy69YsteoFNZoWuQya6R
	 z2+cV6OfMoVvL0bXrmGdJlHZn8J7aCmV/kpSic42lkkjlQD5yeK6Tq+AmL7I6u1J+MrrG
	 7FwSufqEsuZgW/GkrSDCFgGDxB+2Uk8Ggj+9lhd6cqex3kMQUCJyb/EAqaOu721Fxvrjw
	 To8ovRsdJE+ZJoPrkVwrWdpT67fbAuvFp/8jrxZLWJxysiey68zg/EVkHb2yQtkgvc5Ez
	 xxZ1uEBYaOAZN5gebk1E1gUHEfQsW5mIjw0bZtZkJXkloq+EQDyZWOAUHK7Qb4S4Ncg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792318380;
	bh=XSMNGuSUyXfCqAh5+qj1PUe8kBcnQ8SI5mG1VU68m5E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IEZvLn6LXr8S6jybivlp9uutahNAMGmHbQ0cC1knDcjTCljiPuYWr3vHRoWkCUyom
	 Sb1sPqoVgL1/wNgCqVoTxNQ+1tLBxeS38svqjYK1xQ6w5RoBK9EGpsX8OpujxNeW48
	 pgFZrELPgKmoozY1jNO3X09sf7/STMMSOwAoiFgIQK3u4ZdfD8ORrhkUMi9d96jvh+
	 HbQd9c9M5gualx/4LWvuyLu8+uqXH23wSMDP2F0qozhB7xA+TA41wYsxp3CJQ7BHpV
	 YXNVnM9IvmzQxN51WASp0idcPfPVoRB0iRaQ+S6EBWtLa/cMo8VCZ4iHa3smAiRWuK
	 F+VMgzr/KuKCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D13240817;
	Sun, 18 Oct 2026 10:13:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CAD8A263
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC97A606AA
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTMUs5hQ5aKG for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 10:12:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5A1A1606BA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792318377;
 b=D/bVnS6QAb+pDBigxo78c9EVAIHVz/0/rJliG+3tQcT7+FnmMicceaAuTVozJDFoIIPm
 V+uRS8o3Ta0GvX4WBIbMW23xKSKULu36lTI9Yeeql8NDo4KuaNW6DfEwcVCZpZUbDErUL
 UEnZPx0R5URBZ7tyWZvr16teWCpXuBvPvZGd6b7ilbR0T21rgwCB3u3WnfpyhAiz3aGsc
 YSNySeH52h2AmwQeEiPC+Mx4vOrouopE06EP/EhBQTYTfeBMyHK4hjGPtE9AFIltky6Vc
 C1mYom7AqYJB+uACE89DsNJXnxA7QHF289GryoQyU4pWsB63nNjBc+iRaIfaThq1gzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792318377;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=+bHvLaG57YOtMz1Y7acmnRlfClLk1taNdxmjIlrgfNk=;
 b=GvRUe/+23KtzdHu8tDg912iZSbvBW+GxEDakPfdeoUSxwNcZ83YNH78Pnay6X8d4bP5Z
 rOgTl/y4fnLeDWDjAk6IN1aXI2Ub8gPFA+2p/u/Sp61VB0Zj/XNp7AJFflCNj5apK723c
 adtXc7o4U5Nku/1U81RhPZDKBBwntgtH79v36Y5KUxz+7diEWUlZzs9Ovft5EfnbMsJTW
 O+uVP61tqWwNuHXa5OlNJ26wJ5hCvXL0NuI1EAR+RXVl0Zzm22Pr/iZRg6Hii8RyLKjgt
 9FCOpzFWgc9CJS1URDwJj0VgPtqrcloAB+LEyArvZvXKOLKqP+mQ2zZEqu1rzD6d8BQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EpR7i5qr; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A1A1606BA
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:12:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A312A13F861;
 Sun, 18 Oct 2026 12:12:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 12:12:52 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 12:12:52 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261015215210.3426895-18-james.hilliard1@gmail.com>
References: <20261015215210.3426895-18-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <e6448b5a0077d4b6c4e1a6afb18d6c4c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/snagboot: bump to version 3.0.1
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

On 15/10/2026 23:51, James Hilliard wrote:
> Drop the patch that was merged upstream [1] and remove the obsolete
> host-python-pyfatfs dependency.
> 
> [1] https://github.com/bootlin/snagboot/pull/95
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
