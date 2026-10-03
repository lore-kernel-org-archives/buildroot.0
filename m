Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4D4CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C451606ED;
	Sat,  3 Oct 2026 16:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8JSSD5JJToU; Sat,  3 Oct 2026 16:32:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C0870606C0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791045119;
	b=dJmLGeB23RZDs+5kME4f7PTsX0w+4Tj693fQErH+Yj9ec0uT7SQat8mltJmsGzs9/K6s
	 Dr+uY8YP+xW0wqhiQXuG/rCuH4CX72Pssno5eCtw1RgpvCEfgru99OIMjzqbdMvRtn+YA
	 hF4a6/ieIS8I62LBB/NUYqBXOt75SjFEqX2l1cmpGmc6gFiStu9e51I3i8x/IEeOwIthd
	 jBVjwxuhO6JQ8R8gZWwFYps1xbwfHwUYNenX1NJkQ9sA2NhSgxUrXqMkGwsQhN6xAy6R5
	 GUhu9kZDpTROsKymi3yV0vuz6ri7bg+mIFHlzLB7fBN8UsMM1a7daIzGsg2NQZQPIdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791045119;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yUynjZIbDsi/Hsx95IyQDrKgf8MCk7W5La6jzx7dl9A=;
	b=jcs9c1WYdfIYwVO8UOKfmJnhNPghng0k6F9bQjtK0iJN7APyeKTLVHLhb1L96M8PIWpe
	 Z1PgjozfHVB6LG80YrqkAf0LOs9FF/BG8ZsmlSrst6lE0RcLhReWxS63lfkPczUPdRR4M
	 Ia/hjMrFGmeCcz5u/3nsdBu2pRPnLllq4nasJNUFJaMJKZduH65m5Cs5WL7fwJg10KxVs
	 4XFz+owvjfZ8MGcCElLw720slfudAXOPl1sYnGCAdskrY3KfF+1TwBi3HaruHopBwvdjH
	 C+JCeLvbshopwBRQT6ayQ4ezt3wBvF8FHXBRCAgs2hoAbvgEUACaFhdCT0+Yv+YrhIg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791045119;
	bh=yUynjZIbDsi/Hsx95IyQDrKgf8MCk7W5La6jzx7dl9A=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=kqtRfXe08Se4c+FzEwC/SwXw3LHgA68cJyKYLebJpkVpsQFy8PIiHaXDsTyHOYYOd
	 X/tD+XQ+4WdKZf9MaelW33ONA2l6QQOjHVi6vz7enti1E/waiN7xvx3MImLioCOkSW
	 JocjXtbzPT2p8ap8mI++lhl9gOs0INXqOQM/rBdS1CrSSr5CQ9/if5VxLZ8Zv1DqtW
	 eL8RknjDKzPvPTT2XU0lUUMyS2LqcObIEW3oVBlJjIChZngpgU3OlTCz1v7TrJS64/
	 v1Q93yNJZYmTTrCUsigne+R3eghncL6+Haa6xDSQAxm5O1LAXLIN+Z1NhiCndLd+wU
	 r94ine+fDJrtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0870606C0;
	Sat,  3 Oct 2026 16:31:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D418335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AE77606C0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XeUC7fHrZo1u for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:31:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 63CDD6069F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791045117;
 b=UfMCESNXzI0zFl+Pq9DWsT6Pcp5l5UIJUR4/JSDeBzGNFO6g+imzlgas/vpDobTVpmyQ
 Hj/WCCjKTMCCDz9Hz+gdaBIhYagaEilteEI/0H2g2uzGmjgcnvI4SjC0Fa1FHQEzUQEd3
 Qf8924gE4Nnw6ohGJviTwiNoraEzVedVopq5QNjjZ3aeLJBsGqC3GZHwo0lsYIAz2ynUs
 IVNwHWc3ed2H/Jgr0yGifRokFqvJT669d0/iFwcQ7tvNiKAmyb+hfXfO5IZBC3pbpjmlg
 kIfg5O+lZDfFUfoLc6dajd31WGxXRJDfTb+ueOWkFYuOApzmWZgZLgNbk8SnPxZzNUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791045117;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=NajfJYlRAaYoki6x8zYaBURqKJMI6oUWsfyt4TnvoIs=;
 b=Fy3CbELxcK1Q2jYbNMqbrz6Rax3GErlOrkkP/uiDkYZUTtwG/uyjE8+QZ6atZRkLDouH
 xdoYeu7GvpvtKEGIN5TIH6uHXmkEY+T9+2Q3Z67CFJTj/ZoFSFyZsVrHXXbVk8ELjA8XH
 gK+Nofb0JP3WPnKGEDWaqk+u4GIkapGQIec1AJaFv8Uhia/3IEENGGNcoDBT3TYhl2R+b
 dtCqQEapkVpYW0nQc1fgE5lBr35Z1j1dr+ibsUnDN6hGag3b/BGuex3NyL8mGbnAReRPl
 QefvgXpleMeINiPj/r0ndy2SRkKcQdei9etPc8pH3th2lgpDhbYVhFsCbrygXYTeT3Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="NsBB/Z7/"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63CDD6069F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:31:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 95EE04E41134
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:31:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 67D16604FF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:31:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 971641032827F; 
 Sat,  3 Oct 2026 18:31:54 +0200 (CEST)
Date: Sat, 3 Oct 2026 18:31:54 +0200
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org
Message-ID: <asEt6wUgKLbeNuNM@windsurf>
References: <20260905093953.62996-1-maxime.chevallier@bootlin.com>
 <ap5WKkAd5WBJhAsj@windsurf>
 <dd27b98c-64cc-41ec-8312-60286fdb6c71@bootlin.com>
 <ap5xxEjbIUYUJMPa@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ap5xxEjbIUYUJMPa@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/linux-tools: selftests: Use
 KHDR_INCLUDES to locate the headers
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

On Mon, Sep 07, 2026 at 10:12:39AM +0200, Thomas Petazzoni via buildroot wrote:

> > So I think this should work even on kernels older than v6.7, I haven't
> > tried though ;(
> 
> Can we give it a quick try, just to make sure?

Gentle ping :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
