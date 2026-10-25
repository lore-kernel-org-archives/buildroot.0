Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E93C606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bZeyIg6y
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 679F280CDE;
	Sun, 25 Oct 2026 20:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzOJ_bV2wHPH; Sun, 25 Oct 2026 20:23:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8EF6C80D6E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792959803;
	b=S3yycBsDGLHiEBoyl2gl2V6loahnJhQWOpJFO0eTUoLAomPV4wlQWC+Q7YYSoI50RYTc
	 jBGlHcTPb1ZpXE7ee+QvsJC3DoyyQ8L38EzGzXFAW+0TU2azGTm1X3UlTSGMzg3W7kBYn
	 UC5IBtP5KuiiyEaSLbucwYhxR7a6Vk7p6FIeCh6fDwZtKhiQ9LJlEnfuRm4uSK6AJtg1R
	 +U4hLWuYKW7HDkzyowvrLYJafD2lmpHjTquyl8TQERagoLYP869FD3K+XhyCt/RWxyU9T
	 rNMD2dvEtcQekPZheFcCTHkb+jFdNv+tFX8yt01fYSCh/n5RGqaoLviBxQB58YypMnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792959803;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9f0xuta+jWVKqoCZonhZe/A0cZ8+Bano8/favaXIA2o=;
	b=BoJjXipC86rD9J3LdepoG6zJW1IztJ4EEHJl0UWTOSdQ75IWi+bkCS3NOHazdmCGOPk2
	 wkxmBgyB7WGI7LCFcvoAhdNsksWHAI7dn7WRi7nGzgE/TkmxfL9YFH3v4H63gMM3aq8mz
	 EmVQoRXAPKWsE90p4rwXwxF1x9X+6ZYl0C6myO+e7DKd1bmTPJMfRv7bQlWL5L02Qv08m
	 RuNVM8kW/tx6bmOVsPPDYuIhhDXhpbtdXHTTz+muLUHroUxdJM6yN+r5SFVZCJsY877js
	 Sk9WqkADKY9pRFU9wFDRZctHw3JynPAfTIOSLFOBo0x3fD5ZfOTz0jB9dQokBsslk8Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792959803;
	bh=9f0xuta+jWVKqoCZonhZe/A0cZ8+Bano8/favaXIA2o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bZeyIg6ywX9HYnPpz7EW8al+WG7A9Dnprf4eCJgC8VUalgYkW58uiHAau6/XdeCiL
	 cRsdiS5ijnTLfsSs+0BHknuzPMULy+59+zGOCFzokx8g+lcCVhPIYi3wHB508Vh4jF
	 PAsj4PjEt8Pbb4P4zTFYsox6KD7PpKWmSRoGh+tCfLVN34sVI1udBjdP1hlH7OBL3k
	 4Mc6RjClbXNrgDNQzB4pdvFS21EWpXypURivmNtvUFly59IT//gahvy0SlNhdAEO/4
	 lh6TFzpyE7tTj6VNpxOJS0tDlDUCJiRkvBx0kf7rzH1o9oSXw0q7UExRBOXRz8ycoi
	 sa4JN0N3e/Hrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF6C80D6E;
	Sun, 25 Oct 2026 20:23:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E1F54D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FD934059A
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qpbq1Yw3VaWz for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:23:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4F91A40598
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792959801;
 b=JZKKdiKeW+wZGxM+zn3RyfxowSVcjP9SJCxtot9W3X59/KNQkFVlf+1OJYl4SnUIio7q
 JRaW8BfbEZT4ZuAlII5ip4f4tGwrLhEujfC7SPcBPjGuCnm8sXPzW2BGT10xaYHF1LBmH
 alzP0AlZ0v+MDyHPUjLJr1PbY8AaM/SfPmxrtrIPrTaw+UgqOSS9dwD6hcP41TO7sJo3v
 eTUSHuurAdu5CwEjjQzxECuaSnTO9iZDgeVbAsLbvIxCvkDux0OX+Smy33zQXEj82U9v6
 lWszduUpCp+gFJpyqub2PUJminozC6HnDtTkFkWSW+xnQ65UFwcEaIUwJ2WVxkibaqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792959801;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=FsSKZKEDDII3wQOXUvYUhnuAlFIzdBsT0r7k3iplvQM=;
 b=ajcoabyBIzc3kxDMWgWqYiDSsvSiMmo5lnP2XPRtKH2u4ehy9IPsclqhXxTh/8274EOx
 s8PzYAKLV72goy0pI7j5Cy85kYAYrHFGIxtRw7BaPMES89W9Dy14UyQnqJmteWtdMgqUV
 HKo1iHt8oMnJnvYMXlPkSjZUZq7VW7z6I7ocXgLh/4ME4cBUBPtlzZFKIevBKgD3pSmrN
 5bY0ubt8Vg4OAsM25eyH3YIqg8fC3GDrGhlhHUF6cFOaxYxIxIRxBXmueTn6qbNudP3eF
 BOzAKOiQcWmR3IyLx1UfCxROvrH/v9Xp3IqJWEc82LghXjXdRN6KU6uwABvsE4r4PCw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=CSnEYqua; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F91A40598
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:23:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7F5F04E4130A;
 Sun, 25 Oct 2026 20:23:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4DA9C60740;
 Sun, 25 Oct 2026 20:23:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D9D941032902C; Sun, 25 Oct 2026 21:23:16 +0100 (CET)
Date: Sun, 25 Oct 2026 21:23:16 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>,
 Christian Stewart <christian@aperture.us>
Message-ID: <at5lMPod1hsGPVVz@windsurf>
References: <20261025103355.3701150-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025103355.3701150-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-cli: needs NPTL
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 11:33:54AM +0100, Bernd Kuhls wrote:
> pthread_unix.c: In function 'x_cgo_getstackbound':
> pthread_unix.c:96:9: error: implicit declaration of function
>  'pthread_getattr_np'; did you mean 'pthread_attr_init'?
>  [-Werror=implicit-function-declaration]
> 
> Fixes:
> https://autobuild.buildroot.net/results/756/756ceb50b78218ac6085e0143d9f358f97d9568d/
> 
> The build error occured already in 2023:
> https://autobuild.buildroot.net/results/c0b/c0ba9647824dd2dc811c31e7b999167f04d0be49/
> A backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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
