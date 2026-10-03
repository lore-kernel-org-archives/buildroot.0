Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C582CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 029A8413AE;
	Sat,  3 Oct 2026 12:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFsMv7duneto; Sat,  3 Oct 2026 12:53:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1BC5741287
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791031988;
	b=dxV2miFyxErwtJCqwtIMdQUiqvjaweCHJgio3CEIj4EEDIjMSuuieCTnjVz9XxBWupqk
	 lPlFNkdUJDfVA+iH1rJa2e+bg37h7EZoPZI2WFo+qmnk/fpqe2B/7mf5I2BjDvcXxisDi
	 nvQK6Zl2NCR+6+7YcFsLRYa/0g9FV9QV3ERY4yOkySA7EtExh8ncgMPndSi39PPdVnYgl
	 CkvI7EEqHS8oKGMAzpwzQ5pM4dRs7T7J9yHfBHkifKMxAl90hEa/DSABmA2049PoX86d+
	 +zSf4jTgZcugteZ4FiyQwc4fcP9OoCFSI/l6qxFwWxhdHYHUVsbsKrPzGcwd0Jkpn5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791031988;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7TFImWLiTZO5I0kfWewTciJZw1Xm4+BqnTTpUu02xNg=;
	b=HXE58JO/cuYUpDE4//dHOfuH2V4+hgkvdm9OEeaBhz0qxLEzAVEJcpe6XV+uCp8yMU81
	 T+DmF6CWm09BwsXw7tggvEf6RtIlzX8Lx+nx72X3jJwtr2wmeR8NAz9kwqO4HsDTA5pyD
	 BN/+PIjJcsjcLlOv/U/PzKZo6e0qQZ0jYQ9nYF1cGikX2BMbkD9lV4wm8O9xkSL0YcXAb
	 tF36pjufrrfcqJEbjVSRFVyBqZ6w09BYf54sJrfQnsFBJ3slOaZNaR+kfXCqmllqIPv/V
	 5ZXMEc0BSh+13T077wQZgCUBAtGgKGGx5+E5OhAn8pJdA6llEoaUXTsJ4nyrMmx9MQw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791031988;
	bh=7TFImWLiTZO5I0kfWewTciJZw1Xm4+BqnTTpUu02xNg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H3upRu3ZuUPyuk3OMMRs4/5s6Yerzg0sd0JrvuJCxEafobbbAAv0GNxaEwD9lWsYU
	 iuAokU6Uduvkg+NtrxPr8IHX1taQa5GdEwKDrReVhumzvIpgNMOpoxUabCsOGhyXgc
	 yZ3sd4bwLTPutELSsWheVI/jAurG8X2ciPqTRa2WXpK6JhavPJZ7lWRvROBrm9fnoG
	 lEkonuAn3mmtBw0j336HSWpVFzs8i0PZ7N+M6+IUwZ6BFX36GVcXwA9KrTDfW3QNON
	 HEkBRYEUiPa2pzM00kcpsa7iydBjUHAyPyFAylvdbLyoTnaePW78wtP4OLWCCTzI2X
	 N037Z1mIDlfUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BC5741287;
	Sat,  3 Oct 2026 12:53:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D48E4335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5D8A40064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXciV_M-qxaP for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:53:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6E05940063
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791031985;
 b=YReMPKuCblP0lmZ5PGiPPapGi22T7qRrSyxG9E7/z6r4z9Yk+528A8BgVzVvxUu6aD52
 +4OWLSwQd14CmMQDN4k2CXP+JFY+qlWvYMhP33pfGu3abhoL61j0cEAqV1KG0FkLeS39D
 4X5BezDKs1jvRgUZjq2Dsiqw7UM3iYXzKRCXwqueAwlaHaQijRh75IDuFtZ7RTjVLBNvw
 0bP2x7B74fpq9CG8WEjJX7/w/LsiUSLHyLsPQODmT3dLxlXuEuugpFBLPkHytLDZZRMS7
 NX9HwXzA8ssRFoMLGSd1pgQSXvcJIHME8pm5My3chGImYeYPOkytSYBS985q/cVjV0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791031985;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=2gA59mRddzJ2Ixuz1JIiJ0C76D0MLHQYdW8P24kWRBw=;
 b=LelF+az/tv3vu7wXc1PlEutvHsxFOQooiAr8frvUvc1T8lFm7/0vfXqrnvHXdqPEtRDc
 LSvWi61wXhaxMlxPJhQVlPVH9vwXmbhhqCgNvqpD9i2+kzW6B+6btxVxAQoO+iz5H/YrX
 pHoZS6Z6BbHADZlhxEv17BodUp7b7S/9fZ2AqJBT0mrtkYttCoCRs4HWZkQCWBcBbaf9Y
 DctzUTHJrkjbjiwI05aUL7TBirJOadMUnq/8l4+DXFpmE5N8D623zhNJ/z/qi0OPundpi
 gWH7ofTAxo7NITNkktawQg8vTAzXcKF1Jyf04sU8e9Y7cLzEu2S8LVg4qreZRI4PBdg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=CXxZAI5m; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E05940063
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2731E4E41129
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EE733604FF;
 Sat,  3 Oct 2026 12:53:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 225C610328366; 
 Sat,  3 Oct 2026 14:53:01 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:53:01 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <asD6qVrY2xNWKrdR@windsurf>
References: <20261003084453.545653-23-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-23-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-platformdirs: bump to
 version 4.12.2
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

On Sat, Oct 03, 2026 at 02:44:08AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
