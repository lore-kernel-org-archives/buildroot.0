Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CF7606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PnU2AyUE
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1804840593;
	Sun, 25 Oct 2026 17:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHnJ8awUlWYm; Sun, 25 Oct 2026 17:58:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BB979405F6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792951108;
	b=HGKPKSUBWpsHo4so0T09W5guTXmyLVMwcWVFdoTzh5Ordx3w8IduOcvIEIqJTDsXcD5M
	 gYLs0ZCj44PlpKN67ceuGNKH0VhFlOHJQi2mcVFw//SYILgDraog3XDij2B20vkXWcXAp
	 iAdg8I/giKSIrj0Jo/z6feoaQgLZmd1sLDjpJ2Esvea7XQaJvDVlzDTn/YH+Qj49JmrCu
	 WoRy8uvHbjFVnZECVGKVTby3aR1Z8J2eOSWDZT7C6DZnOVxAqBHfpknsA1TfbUxpa1QRC
	 qbId05kxI08hw4/GE55GyA/j4BIZWOPW0QyWUKAEKCOILgD2eo33cTD4ysFaNPbuR6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792951108;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TrsDaaP3MVXT4pc3xB2D4XokoKSwnPNdOV1DmgSkNs4=;
	b=qSYhIRwOjaFxnPclR0FffpF496r73vio2H2acIC0Jb23U/SiWZFSfbFFv3+iFAN3gZWl
	 hKkOaYEGmyVKmNvgo7WIUWz/W2CH27Fd9X/Abc1KoZlIMnZPp6do75sUqEAwTbPkoEPDG
	 xbapQrusMv0Fs1nbL5dpgvJ39JxoNqKBumXjLbBzj5Sy8YGiVM19q0XNtKj/cnUX5sDww
	 NNu9L08BaLoMoKdEdGpYl1iBpgFee02BR2+pQcFY/V7u3DfUt+7x46xfSk9MXjZFjjNGd
	 sbQNviPzOmE6HfZwT7SvMSc2BQRDoTeQxORPW6sY9ANEb2kVTTQFBo9TL75tYeFooGA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792951108;
	bh=TrsDaaP3MVXT4pc3xB2D4XokoKSwnPNdOV1DmgSkNs4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PnU2AyUEoGbQGH+49JgzG9Vhw3Drbcq4ywILesRwJOWKplFN48eX9mX5u5nMUXIH1
	 kXBqkVsLfG3f8DjWeZaW7oZ1DDWkudz8/M7glDkQQpD8+ZfPjgx8xYhk4gkD7gEVqb
	 dPylHXaHjA0gPgDOYmucd53zag53KqgZTwFRm6USuQbsNxmNdJpFYRv41MkFMPzxb8
	 b6NgAaTJb5ecFnzuI9Vx7IWaEDDKg8w1PDwTbLiZrXGV9BZIJlRg6y64Ps5q8z/65J
	 0nKrgnaq0uoQqcTmMsHnp6XVCzjcUTGnXYQK6ueqJAWAjg2E4Z+EvD1A3T6AYGPDbw
	 SE2sw7ZejLGUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB979405F6;
	Sun, 25 Oct 2026 17:58:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD2A24D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AECCA80D6A
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsThhvFxPQAs for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:58:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1D97F80BE0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792951105;
 b=Mc9qXJYGQu1IBLp5IGQDCRJ/XqaN8aW7GAe2gaaAg2Y0lkcov4UWWtebCeM5L/5M9IX1
 kCRWotxonhV3znSz6/h+SUxW4ZpIp/s/Oa5+3sBsgEJmBT08/y40szT5g2JAFe0AcjUfH
 6ySsLcZnGL1j9+oCjfC1e0A9T2xl9FPnLX8BkiLo0uTDTDbPxnzDnB3AP4NxF5PLM786T
 NXcDGpZZ2Lx1JK2NAkIZ6/9F7590VmcxR1h7JpU7+CXNodPVXVBI4UP+HdDeYEEyfBFkE
 gHf6V/g7J4BkVJSIQQifFNxzk7FrIHe367qKrSrwR3nVSOWyYNQtKtbM9upJKKtR/Sw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792951105;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=392GRKp5EvjIu2yHap+6yX0jlmoq0YoGsPvpw20eN14=;
 b=hzkPBvj8rG/pVcCrSsZniFDVbRJ1RbcthsAa/s5LRY12KUZty7fZPkSpx/OIVyGZ/5aN
 5JQyPEzKdRlkI3b/Lb2+brjZ8WIYosEluSqqdVEtnSJe8brRtJtU+33m3TeoiM89++s7i
 UraArWvNKawY4+/qXbs1q3JXkbul8t3oid2xp3/Vy0t1GNwqZ4kBYGDhyY16+h+OiBbEE
 ibReAdCqCr21c0yKLBziMEIYzWdQft0AsqUTfNDp1AgAQCOGf9du3RCEHyx+2jB4df+mt
 OIw9lVmxr7MkQC3yTwpimRKIBQkw1sky8/yo6quYazV6doboZ8CuV3lFV1lGS1JP2rg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nVCQcGVj; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D97F80BE0
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:58:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9B8CDC51477;
 Sun, 25 Oct 2026 17:59:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D689960740;
 Sun, 25 Oct 2026 17:58:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 12C9E10329035; Sun, 25 Oct 2026 18:58:19 +0100 (CET)
Date: Sun, 25 Oct 2026 18:58:18 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Karoly Kasza <kaszak@gmail.com>
Message-ID: <at5DNdGEgostVJ1u@windsurf>
References: <20261025172656.2241739-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025172656.2241739-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/openvmtools: fix build on i686
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 06:26:56PM +0100, Bernd Kuhls wrote:
> The patch set used to bump openvmtools from 11.3.5 to 13.1.0 contained a
> patch which is not needed anymore due to upstream fix
> https://github.com/vmware/open-vm-tools/commit/36eea633611e678f3ea17a913c0990f319135c48
> available since version 12.1.0.
> 
> The patch causes build errors on i686:
> 
> hgfsUtil.c: In function 'HgfsConvertFromNtTimeNsec':
> hgfsUtil.c:135:49: error: 'sec64' undeclared (first use in this function)
> hgfsUtil.c:135:57: error: 'nsec' undeclared (first use in this function)
> 
> To fix the problem we remove patch 0010 and renumber the remaining
> patches.
> 
> Fixes:
> https://autobuild.buildroot.net/results/d37/d37be203b0b4d46c052427ea2c469c624b26504e/
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
