Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B903C88E53
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 08:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D8F860721;
	Tue, 15 Sep 2026 08:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHkJboRoAh2k; Tue, 15 Sep 2026 08:14:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6B7A5605EF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789460040;
	b=A7MQeNVa2HtWU/qjAzKmNEFcEdJvsezYQi8N1Aycvp1zefjG0LWXNzjfatV9MKYVjxq+
	 t8NDYUiv7oud014ljWgeJQCahlhnAvJ/D7E0bJnAlPL4flUBxvcOOFNqkJIACU1QJd+GO
	 A41UiB57ng61/3uZ7zJkaExh3Zc//aloHsqkOr9jOcNo7HQVOOwk7nRu1bMfCzkkdfBuZ
	 0JzHW1s2TJdUntY3DnJx9t8+t63GHVAQ8b00L7NW99OAcwbl15ZLz5zy2R21sn13jG/UV
	 r9lijMTBOLrdiATd3b1DSzBhIMi/iItaT6qZGTTPmQ5h7XcnW3GKTueyXfiMOKOoF6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789460040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4bqjgISSpeCW5Ejz1zFw9puwVSbAvJsNyhhA57k5BYw=;
	b=GW/YouxmN3lPu0e9BaovfxvzGmrEngfJ63kKubK2r/lu2J650APQCi8yC6+j24pNyJlP
	 0aJFqVduhJKVuFoH0zsgqw438FEdm89cZUnqlJAi+DSQREUGNQDP78Wma+rhMPAXdQo5I
	 J6YW8ci/v/PDloiYvBh11AM34YbsRYeNG3DDyAUwwaLqfk1FlAPbdOz6n320wiN2/rBVx
	 mF5aW0yQqEMyUwFVQDRBASbryTuwvWTgK6Liblo1YwrcWoLvQz+lJTEg8oY77VEPV+Kom
	 mhwyq18dFJ9Sj05VX/wlCI1++sq1n/+nERCqcawsJdwxUlTJ/9yJlyPyII96YBHvS8g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789460040;
	bh=4bqjgISSpeCW5Ejz1zFw9puwVSbAvJsNyhhA57k5BYw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MiRfzWQBOE9gQNdltKRNQiCy6R/l0K2KRN1x/WF42gaxvEWdFl5YhMB8a7V1iZpuN
	 ImycKD/C7dd3i/REyrmRgnJcafKbMDexoSgbjs41IOQyqRro4TdO+5C6oMt5bTnIkb
	 oJEXnn06OssfXwpFiLhkV/DGZ5m7CmK/ntjMe5FCC7WOaODDMA6VvkO6zFzO/QOunP
	 MDurZcQVc/qHzKxPSC8oYltiyRVc1mRXokUTbTBhezGQtD1KNVVS25nzQTbt85i1cH
	 6MscH5v+xwwz+aRMh9Pi3H3+arEMplbCGrzsPGETqbsEbzKCDwU0BnSmbq5t4FEVY7
	 iKmriz9bjufyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B7A5605EF;
	Tue, 15 Sep 2026 08:14:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A73AE465
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 08:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4A29605EF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 08:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9N6gjLEZ-Df for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 08:13:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4723B605E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789460037;
 b=VIok7aiUZbdQI69IwMK+i+Y2XN2lSojm0dJwMALoNcT8qF5WBg0H8VJA5/1JceNnSFmN
 uxoD1S7yCNSl9ktYA3FaubQNLfqeBAXF59vrGnUsGwg0kdqaKIlc10WgNwIBvDXEVJW3u
 Qr53JYoNVaHbzTv59BbHKwgEjYKIQ4vrAWmhAG2nEV4YgDfjw2NuWCRuDDgi9eNMTTRIG
 evYBdpWYFZWPMocHuEQURTSAKRnNUv+H7VWKTTAAyzf2VlmjFGnhkjAdHwwBPah5NG1i7
 LkscKUDGF0P1N2iie2qFm+3IZSUi6L6UQUjSuB9SHOHLMgvXybZ08FKhYW3AeqZTWDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789460037;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=WbMuDaW6T0CmAy2wGXkYYkCojKrDG+weXx6pXkdkNwI=;
 b=Xybg/gLLoHkZawxk3ABYXON1SSisU30n/mg3yM7Jp+9ZErhR1utyWqh4YY6ti9xBa/9/
 EVD4KbEOVfWRTktWWvGo8BHCXm7kloxILqT6sbAswbMFmaC0a4ydE4F3bv6Hgl9M6lcm5
 SKIk5azP223r+Faz9Vpctsgw0TqmRQLf073THqu0j/dM8qd+Uhr3X2F/Oy3tjoaWbzE98
 YMYO03HWMC3V7lo17nykUwFy9BPFxxatKo33CzAGc9sg0p3IcZZgmM7mfEpLS9qxV9w3L
 AKUXN9JKudSN9p4OTXmCZWMU2hgIrp/X27dIx/Gywz0sOhIpCoqttst4pQf2+kT4xJw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Bk81k62i; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4723B605E7
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 08:13:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8391AC5CD4E
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 08:14:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0F51B60498;
 Tue, 15 Sep 2026 08:13:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 752C711C7AFBF; 
 Tue, 15 Sep 2026 10:13:51 +0200 (CEST)
Date: Tue, 15 Sep 2026 10:13:50 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Francois Perrad <francois.perrad@gadz.org>, 
 Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <aqj-M78yvgQKzGo8@windsurf>
References: <20260915074215.620475-2-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260915074215.620475-2-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: propagate gst1-libav
 architecture dependency
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

On Tue, Sep 15, 2026 at 09:42:12AM +0200, Michael Nosthoff wrote:
> BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA selects BR2_PACKAGE_GST1_LIBAV, which
> depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS, but doesn't propagate
> this dependency. In practice, there is no issue, as webkitgtk is only
> available on a subset of CPU architectures, while
> BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS makes ffmpeg available on pretty much
> all CPU architectures, except Cortex-M, m68k coldfire, and some
> specific cases of OpenRISC, which are not supported by webkitgtk.
> 
> But for the sake of having correct dependency propagation, let's fix
> this.
> 
> The other packages selected by BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA have
> dependencies that are already handled at the top-level
> BR2_PACKAGE_WPEWEBKIT option.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
