Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EABFA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DA76815CA;
	Fri,  2 Jan 2026 20:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZv4ihwNwMKM; Fri,  2 Jan 2026 20:54:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA873816DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387277;
	bh=7g75ROv7XBaiQ81R25lQF9WVqgn9qnSyR97JfgUMV9Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sgzBYXiFuKlrLm1HnhWyWwQ8CZdvgULGB7wyMJx3icKIzRGdTLgWvxIwaGgnRQ0mJ
	 IP7osofrFeayYBaTPXKGcrVRNrz3QSgjLpk1KHOfIpqB3pxU48f9XaCHz9IWYNC7pn
	 X1UJBmLHJXJYwFtOopcjAtX6QYGg516BK3w1T+ZiO+ZrbEHvNvtmJyN2xL56mvJzXp
	 zrK9+Mdr2/Yca0pjNv52cNT9u8ZUxReUnt/taAPm/kFjkiAXiPjIezX5Mmd19BN5Uu
	 6wwnkU5NNBfUKqb4Q3hKOab7mlTWwIoJ+9lAMaRYGoI1ToJumM37crHhXaj/89XdyZ
	 sRG0Cjfc8reZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA873816DF;
	Fri,  2 Jan 2026 20:54:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BC5D202
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D143608FD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDBVPdfIxtQG for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:54:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 275EB60906
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 275EB60906
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 275EB60906
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:54:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8E5D1C1C3BC
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:54:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5DE80606C7;
 Fri,  2 Jan 2026 20:54:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B5D3E113B023D; Fri,  2 Jan 2026 21:54:31 +0100 (CET)
Date: Fri, 2 Jan 2026 21:54:30 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260102215430.58ec8b88@windsurf>
In-Reply-To: <20260102204741.19542-1-james.hilliard1@gmail.com>
References: <20260102204741.19542-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767387272; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8NAK5o08mWuiXgx1dX5DxBFh3xwmoKTo0vcaLGQsrRo=;
 b=VF6/gFoPsqfJ4k2F9PtWDOYyvD7gTJy+br4EXnZnMVH8fm29VYNgaqXShWH0d9qxJRb4iY
 ancuWlzXF+UFHI22cQNypQ4tJRurDfmr+4UHdD56mPHho3qxPLuHDRVmJu26F8s1ogWeTW
 U+bbT9oJWxaCG0btxRUQK/xS16oXK4VDpi/kT9si4nT/6oU4f1AFcvlIcEmjEvyAtDax6P
 4k2vePWANlMkzAaj58I/RQfd83t+r02rKOsWR+Q7nAmVmVDpFOEqmGGYKcYmG5nUDVQ5QX
 jYqSrbW0p7e020yqx0JsI9oYZn4gxw7Rjk1U3jVhKtvlQnJlYagFUNIy4jlhAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=VF6/gFoP
Subject: Re: [Buildroot] [PATCH 1/1] package/python-portend: bump to version
 3.2.1
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

On Fri,  2 Jan 2026 13:47:41 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to move to license file autogeneration:
> https://github.com/jaraco/portend/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
> https://github.com/jaraco/portend/commit/d2b8d7750f78e870def98c4e04053af4acc86e29
> 
> Add new python-coherent-licensed build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-portend/python-portend.hash | 6 +++---
>  package/python-portend/python-portend.mk   | 8 +++++---
>  2 files changed, 8 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
