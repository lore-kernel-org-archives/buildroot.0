Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E02ACA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C8D780FF7;
	Fri,  2 Oct 2026 19:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITa5oB8hACu8; Fri,  2 Oct 2026 19:37:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4C99080F95
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969839;
	b=Li5uaU9ccAdciT3D/0XgD0dTWL/yIZnnrZEKJkTdr7+6Bcfjsnp0efxtSkJSMyXTVLB+
	 tdW3JWL83uKvWJGuwPMRKTsHnJwDX+1OtYAV3PDCJqWNCZi6j43ytmuISEP/tJAoNi0GU
	 iY0dkg0P/FcsaifgsMxjkaWBxR2bM4PEOSUPntrkK9Z8BhbKVbfKLOs/DCOvvLR+BYEwZ
	 tDcKVpGkAJ+8wolREFstZdfxYzEcq1ysLN3n8ev6+XPQ2LjqD6hgA6mrGz6jLBYy0+2x9
	 WwgSpcfqb2VkvkN283PZLoftH+C4+pHMX/KHaXrPoEgzSPdrOQfMp8OOC53bL0V9vQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969839;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Date:From:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=N4TrgJ0OxooBZEpRX/TLyWfkvV8MSBhlNerU2BctYqA=;
	b=EbfZHuhWzUzAmf1KFo+MTj50tYWyS9CiuNlfgdTVUNzTslKP4rU3VYBwik9Pa5YFI7v7
	 BurlTJ6OPwpxY/JTSHMUBPvDyIOy4mUMAEmljSrM+DSXlQlD1PdQiG4xOMG4beTLVlFvd
	 +9ewkeqDcsSZ4cdKLNRe4rsS0M1fWvXbN8dcT/WEm9ro53qVfuMJpKvwskS0POzcyK58V
	 6rE7Z8x4vKEZB3jNuW0N6R7alZbzWEo5cGXB6NqQj4s23SjUn4AmEHxUg9cMGWps6DK/G
	 CxesuH+lThoJLVXPtBZlkKMQT4W0zNppItaHIFxPGNzSRcslEhbbMk++nGol7jmnPzA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969839;
	bh=N4TrgJ0OxooBZEpRX/TLyWfkvV8MSBhlNerU2BctYqA=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CL9F9Yl6eXWQifBgADFkVhvCcpziSOKqNxNte1I3rYkC0jyHDll6grv8m5nWu6Jbh
	 nQ58VYkQiqRA8KTgjlRJzsDXPkzeOhyjzq7qsZU5cbholZyambxIZFyAZzo6gVH6y7
	 rIfLfF/EMWMw8aG5i/OAD1kP1mTx18XrGFseTTNI7U7nFB2sJDiITl57vvhwUHXjKE
	 y7L0ynrx4+WOWF5k+UyuhbTMSLBuwkFjVKZ202F3OxppsCdFwYH3Vo7mYAtHDIe8CI
	 SmWzBLtiWcGXFgcqHe7XCz3E6cgDMyPr80oBMBw9pIdXDF5ous70YInzyoJxqKrwFJ
	 z50LUf87pBbng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C99080F95;
	Fri,  2 Oct 2026 19:37:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 592271D2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F39540DC6
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9dMKhxF4TKR for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:37:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6C41340B78
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969837;
 b=KlYHVPqDMmOVIMM13T+G29P7hEBBHkZTK9mIKVUoFV8FjEatnpgms1kLZfLrsk207dNN
 qehC2WL2liodR5wjFO28QLCM0W9MA2saSPe5u7cKWn8tC0QkyTZjn1JDE5F6SCK5cW5hx
 I/KgfPWIvzBZEmzw2SZFRRlU++t8ERE/zkgO9ZwwJpN8GVU6W5hL5gkH/QlGMxeQLIWVf
 ygwwy3pm+J4LO+dpc6z14H9Axsvf4LZW8KeTkTRWvgbyTFa7+aLcjTtdG3K7XPDFeMyR0
 aKHc0lL6W6ZI6r0+UhMjICV23U58UtbYtoW6xEQCJg5mtvMrrwecSbkWImDS0GCv95Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969837;
 h=Received-SPF:Received:DKIM-Signature:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To;
 bh=FFUWFoliDlMxqp6oDpKLC/zXLXYyc0z1NvZxQfqhM/4=;
 b=aazNQ/znW1onclbvCw502Wu6tsNrsOtwP74NU2rkmkaQodAi7JIQDH/RR0ctE+MLjwBL
 nBmnrcXI+XroaSPw0Tpv/TT4J/j5+6ob/bmY3H6UMDDFC4IgAksAfBSIXzJWyGAZfkRvk
 rpc9DfYXMqyPqZIFUJe6UHEqCeouWh7DBVHfqnjeL3KYo65uYCzkb9IpO2+HP8uwRM79T
 PDO5xiK+COtp3bOALtO3E9q/Z7kVvFeziTmyOxGCI53uXF9wmoMLOhrO/Co9qMqaPw/4T
 oFJuvCwyAau98suF+HNIEJzcVlg0HnO5CuHKe83JuWsVZ9PutUoQ/8G5j600XqWyQCA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=ideasonboard.com; 
 dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=RBok2hje; 
 arc=none smtp.remote-ip=213.167.242.64
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com;
 envelope-from=laurent.pinchart@ideasonboard.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=RBok2hje
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C41340B78
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:37:16 +0000 (UTC)
Received: from killaraus.ideasonboard.com
 (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1B5B177;
 Fri,  2 Oct 2026 21:35:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1790969718;
 bh=Qge/xN7L9m+bfyggFTwFDWP5RJSAmWbBDVja8svAiu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RBok2hjeL2xXHCdw1tro7ultO8yoIfElNpnltXn63C5JuCMEzp8VVdk2g/g5esHFB
 E8cYb9LL8K4j4LgDi78NkpP0rZOsuZNARrTFaxTGjayJ/IYfFCa+wiufaN6zncko7t
 YpcBXl9chzpimSxYoUxXvKJMilDd53/K4XvD8z2c=
Date: Fri, 2 Oct 2026 22:37:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>, buildroot@buildroot.org
Message-ID: <20261002193709.GC91932@killaraus.ideasonboard.com>
References: <20261002102335.12501-1-paul.elder@ideasonboard.com>
 <f27d7de1-d26a-47a6-bf33-074277c44d73@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f27d7de1-d26a-47a6-bf33-074277c44d73@ideasonboard.com>
Subject: Re: [Buildroot] [PATCH 0/2] package/kmsxx: Add support for pykms
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Oct 02, 2026 at 04:05:29PM +0300, Tomi Valkeinen wrote:
> On 02/10/2026 13:23, Paul Elder wrote:
> > This series adds support for pykms in kmsxx. This enables the python
> > bindings for kmsxx.
> > 
> > The first patch updates kmsxx to the current HEAD, and the second patch
> > adds support for pykms as a separate build config option.
> 
> I don't recall the exact problems, but pybind11 was difficult... Or was 
> it about installing the module to the right place. But if it works now, 
> good =).

The issue with the current buildroot package is that the version of
kmsxx compiled and linked fine, but pykms.so contained unresolved symbol
when the meson utils option was disabled. You have fixed that, so we
decided to just bump the version as an easy fix.

> However, I have not used kms++'s python bindings for a long time, and 
> consider them deprecated. Have you tried https://github.com/tomba/pykms?

Paul's paul to enable the kmsxx Python bindings come from their usage in
kms-tests (https://git.ideasonboard.com/renesas/kms-tests). If pykms
gets packaged in buildroot we could consider it. For the time being, is
there any drawback in enabling the kmsxx Python bindings ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
