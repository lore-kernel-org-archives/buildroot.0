Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FFFC624D4
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 19:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4D19608A3;
	Wed,  2 Sep 2026 19:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWV1mdBDgpkO; Wed,  2 Sep 2026 19:14:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0C6A76078B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788376456;
	b=ha2iAX6aEDMd+y1Yvv97pk3+GZsQ/AmVKZA1AzVB65Z1RgBk97tDe1DXII+OcvHy0jdC
	 GUbyz51N/TxZSFADYR92KoNlCmWMqEmsOhHB29WxBSxy1FG7xWGkk5xaa5EKoZ4rLrmmN
	 bVYbwMLtTo3uVQNQPohn6ixCDKGN0+yiqAWdnYksDlOJ2aCDilzjDCr2mheHb+VB5fo8x
	 cYOexe5qhESdiJWESxuQ7tKiYdsf/kZtsKHcQFz6doMso3nexQG4Ifzd1Y2BcH2OheetN
	 MmgC3XqVV3ZFMyqyZ2jcrOk4AUxu/0Z1RdrOkBAMsexw1tLyF9/IhpQCCpn4C8VB4Rw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788376456;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=4+9nS8VPd0AUFYrCPvID8eVuq1RQNMIT3DZkidfHLuM=;
	b=DG/tbr+6ZAoTrl3dvx++ByUW4hhQcdwZte0xzVpMIuiaYBhI5Af5bPXjgtqLjN+4PLuu
	 6Tu/uq8r8Wwv21CVQlZ9eb9wvaJpOUas26oQ0h4C2vaWTLE84fkt8JsRtq00XKh9ypnRY
	 h6QWKFuq7SX717vzWSDY84d4+AJYvaMhlNP0lKBlZ5tAFtps79bmaeZCy/oibk7Qy8zE4
	 jr5hbAxYuTBW9xCM8MI1NUnAXyVVPIzefKltnK7Y8J260Kbzgox37K1p5QToSOpLVOFR5
	 ALUBmp5CYnm2nGbyaJdptp/t7kEJILfxWrQPVZ5QHn6fmYqGz2iZYrCZ/JXS6GOllpg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788376456;
	bh=4+9nS8VPd0AUFYrCPvID8eVuq1RQNMIT3DZkidfHLuM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nRpMBmjJ4qHFn0/Bwbdh+SEXp4GOLI6V2RSeqx2JTslvqHnBJ1prN9OVUaN0S0R5h
	 6TIBM0BElo0yDHlN7P4bcfJQ+6R3H5YfNO4eVBc8/mjkkOavchGMcpbhStgdL3GkAa
	 RadgbWDy6QXMHEIFFpBlsI7tChHny3IcOuyvneElhgwgKhAOiFxs0t1X8Z1qVrzGyL
	 1mSlKPTOK93epwHv6RCX5jhVM+o1Buqve+BPhZmu9U7fWG2eGJ7bp73O2aTTR3BvgP
	 /gUF25P5kvwSEB7i1m95ddELxCoT6WCGTey+tTspYAfFDxqZvzZylfiETM2LtIxmlD
	 9uFblEHxbAamg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C6A76078B;
	Wed,  2 Sep 2026 19:14:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7D9C2FD
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD33F810B6
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDXfu8IBMtd6 for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 19:14:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A50BB810B0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788376454;
 b=TTfdDem9wkRhBmvh812otcS5+0B6QpQ7UrLWGFvLPCSveGK5zluG+O4lGKtpXBxHhLsY
 T8wuhhU+dvUjfzJOz5lCY+7Dq3qb02aeQLFodQ7mxSRr8XEkGziSanTMQo7W8gRkQMEg7
 +PWF/WZFn82rlucdP+L31Yl822dcyUqt7Hjvocd2dw+96a181lViAhBQBxhxYFxe0vuHX
 bqlieVMxr3pysXdwcHuEREW0jZ3fYua+TvKonIIMGZxvBZ/xi3Tdc8KyjZFGUiFKqWGOC
 KV6akk48rCE5dgaVZtc8vizxruhnz6QMO3fbN9ozoTspWAtEJPzrSXjAKd8OhSdOTKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788376454;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=QGg3y7TlwK+BSzChWh4o3YUZo01SlhmFCyHrXd5cJXA=;
 b=Y7O2vAWuDrisWNOfRy7wC3moj7GLkMPns66ayEbObGJ9h3FeaABRoHWZz4/zYdJcliLE
 iX6PDUfA+eaed0RTcFWWom6t9fFqmJYgnlw5ARXHr9aissIKZbjEYxDExeSzt9CGLZVFN
 lyyh1KFHjoSRX6OOiNuBdUITEw5cEhZh6pm7M8MCh9rgg7rb6uqFeqHQ2MXfWwQP6bwpz
 8pLUFFE+3jMElkQd/sz4f3py7K7YnlFBdDP+xZm97E5cL0Pb0h+Waanl+zil7C7A1k2up
 pxU9afbAPf68pcRLX9sYXiu1LO7IRIBfwnytIebyc1MY8JHlQvL9r+m4bYFAsItztNQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QGNR2sBI; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A50BB810B0
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:14:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3EFB45FFB7;
 Wed,  2 Sep 2026 21:14:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Sep 2026 21:14:09 +0200
MIME-Version: 1.0
Date: Wed, 02 Sep 2026 21:14:09 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260901194156.1045810-1-peter@korsgaard.com>
References: <20260901194156.1045810-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <d601e74b42e33fce26b89012bafb7904@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/exiv2: security bump to version
 0.28.9
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

On 01/09/2026 21:41, Peter Korsgaard wrote:
> Fixes the following vulnerabilities:
> 
> CVE-2026-68546: Heap out-of-bounds write in RemoteIo when reading from 
> a
> malicious remote server (WebReady/Curl builds)
> https://github.com/Exiv2/exiv2/security/advisories/GHSA-3695-mjv8-3r52
> 
> CVE-2026-68547: Heap out-of-bounds read in RemoteIo when reading
> block-aligned remote CRW files
> https://github.com/Exiv2/exiv2/security/advisories/GHSA-jcgh-p9v3-pw6j
> 
> CVE-2026-49275: Out of bounds read in CrwMap::decodeBasic
> https://github.com/Exiv2/exiv2/security/advisories/GHSA-hxph-pv7w-8649
> 
> Out-of-bounds write in RemoteIo::mmap
> https://github.com/Exiv2/exiv2/security/advisories/GHSA-vg6c-9f6h-4x5q
> 
> Out of bounds write in http.cpp
> https://github.com/Exiv2/exiv2/security/advisories/GHSA-9v3x-mhg4-wwv2
> 
> Infinite loop in QuickTimeVideo::userDataDecoder
> https://github.com/Exiv2/exiv2/security/advisories/GHSA-fgw8-p7pr-37cp
> 
> For more details, see the announcement:
> https://www.openwall.com/lists/oss-security/2026/08/30/1
> 
> Notice: the RemoteIo-related vulnerabilities are not applicable for
> Buildroot as exiv2 is not built with libcurl support.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
