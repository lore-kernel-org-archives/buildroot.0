Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B14606A31E
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 16:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=acNW7SQm
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72913605A9;
	Thu, 29 Oct 2026 16:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myy2_dVU9uod; Thu, 29 Oct 2026 16:04:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F3EDE6067A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793289888;
	b=IwULzdTu9BGME8mWt7z2XjlLqfvTahVGhXFANYSfDrgmrYDej4Nd3AXTpsfAuWmLD5WJ
	 UyxV+eOzXf1SRz6hRUmiaY9rNesTH0gdIkXuYGWsaC6mM9XdnFwrBk/eGvypvC62jggM+
	 /1trW9S7/OSV3VupVt49FIhc5PZ6SxIREXevcECGAUTHbx0PhSke46uPPNGz/lVL2RAYS
	 rEX0jc5S2m/n++G5O9k8AyZ4wYooJ+RqoT1sNMo6DJBAGaVgYUInsa6WRweae8vrq+gKH
	 k1HAPBu1N6hUi9iX3w9TA1tc2P6xzkdwXe+KFkw+PEPV5REaShsIBhdkPDzzFR6UD0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793289888;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3lBWnowinuYy0D1WiWkl2kI3VHqCrC18LuFU87EbvrI=;
	b=BeB9OyLbrti1KTd491an2S6DIvBR5N6CyfLFawgS4Bq0y+oGiDVVZrikAtO/W0nXF952
	 IGJENJ0chstO9QgqZIAhr4r3Io0Y1LPaZydtuebtP9gwiUI5rkV5BzEyyYBX4mxhXJXbY
	 Wll+QVEkfoJQ4+liThF0okxZYS8VG7+gD/0W+aJCQkim5gTReI2ocG7rkSqzGhDOoW6ws
	 uN//p7jYwhykqQqe/i3DGXXE/Mx1svPMJ13v+pl4ggQCUB+USy3/pnfBYsfbDL26wjYFh
	 81uilkOEOAb9kEPGN8dnbQAQjdnPvwBDtTr2/MlYlHHyqNcorY3LeTTK1OZ3lhvVHDw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793289888;
	bh=3lBWnowinuYy0D1WiWkl2kI3VHqCrC18LuFU87EbvrI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=acNW7SQm94uNICwgGFwSMV2HS0hL+F7jXs8fRI0Yqy7f1oIe4BGRvicQK/jpDcbRv
	 FyxMrwhvFXUYguzhAjt61YBQn5Nw//ozI2ox5k1zbW2nMn0JG7/1ASFjGOoSPH/VwP
	 ohsgR+lADP30D2wwzWCT+iD9V01Nx2yP2e9qEK+GZOppeqEYJSsMT+h3v17lc4Gl0a
	 nbWVXUUGCJx/8DfXBHRLeh/xo2vHBd61ZjodjJIXu8SPcc4g75otTDrSIeFV9vGsjF
	 pnmj0xvxJP3nazz1t2RRmlKy3K70WlTANoWA35aFBeI1o7XL2hQMYu00mhc8Rusyd6
	 Bumrs0CuRjRyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3EDE6067A;
	Thu, 29 Oct 2026 16:04:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27771380
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 16:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19AFD80540
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 16:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xH4zbo_LO_xb for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 16:04:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E84E080F88
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793289885;
 b=NG0MXiZGCd7WqR8K+yTY02u3jt+rJkK2yR0/HzWqar6toRzH+rjfshqyGtJh3me3sNJq
 GclxgJFVhUWOJghg0jsxlK93HFBD/CD/gcuMpYnJxzenU29FbnaZYKz5nPb2OQsjXZPV/
 /NM1Anja3LBqHw1mFUJlTwlefFNzjYU/fkIet2mJvt7DlfwMgcMAKJSaY9G32/xo8Oy8t
 OTQsBYkwe0eVztHn5M0+aDLOpk8tmGpFXhOwM/CvhauR7PS9Bwq5ba5ssFn6w9XVF+Qkm
 qE49oyHh2hBs81ttqlxW5RJUmy2nwuW1vhD+0fXW4Tp6DCzeMoINmatFo7dH6peljQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793289885;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=xy4PzNt2agIud7ZZA+kwqW/67J7ekPHt7HdsW+0StsI=;
 b=eGoiBgYq6fPq4WuEyzAPmTylUU/g3T5prsck1UvD5fLgHfZXtTzQqONEiSTOmNy9LtGh
 mQCpMveChlJ4xxGMTD0W7YjXeavKw5O9HDsWqVegZKIcWk/zMd/ZNKjtWP6lL7pMAkzh4
 BWUwiCp8dpdg2VXXzdKOnPSJl++xUZIw/5YB1CO9iaxKso8jrtixdSChBSHoF14tO0aYL
 QLbLdV7WeVerXRysX/lrJlh0TpgrnseZoX0OcGRjuHjs5B+JW9O0I2hUYaNZBs2/IRoCH
 KHeOvFfofX7oYW83t6BHSpKYDP9y1NCABckjGjupeLVRSyi+wHoFXif6of9dculwzOg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=fEO5P6oL; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E84E080F88
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 16:04:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 39A114E41392
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 16:04:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0D5816076A;
 Thu, 29 Oct 2026 16:04:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C3B081032910A; Thu, 29 Oct 2026 17:04:33 +0100 (CET)
Date: Thu, 29 Oct 2026 17:04:33 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <auNue788AnaV07z7@windsurf>
References: <6ae2cb1e.ef735cbd.21420e.a28d@mx.google.com>
 <CAGm1_kvUUsz4tKbbzn_z6cTSjgBVFjy44yrx5c3c5Y9BUcCPdw@mail.gmail.com>
 <875wykygsz.fsf@dell.be.48ers.dk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875wykygsz.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2026-10-28
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
Cc: pieterjanca@gmail.com, Bernd Kuhls <bernd@kuhls.net>,
 brock@cottonwoodcomputer.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On Thu, Oct 29, 2026 at 10:52:44AM +0100, Peter Korsgaard wrote:

>  >> madplay-0.15.2b | 1
> 
>  > Unmaintained since 2004.
> 
> I would say drop it, mpg123 is a better option today.
> 
> 
>  >> mender-3.5.3 | 1
>  >> mraa-2.2.0 | 1
> 
>  > Last release was in 2020. Low git activity.
> 
> And Intel Galileo/Edison are dead, maybe indeed drop it?
> 
> 
>  >> pdmenu-1.3.6 | 1
> 
>  > The last release is from September 2020. git repo shows a very rare activity.
> 
> Indeed. It was also dropped from Debian a long time ago, so maybe we
> should as well?

Just to say: I fully agree with dropping those packages.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
