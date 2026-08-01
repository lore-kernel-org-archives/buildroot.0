Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D1DC55177
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 10:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94DF160BA4;
	Sat,  1 Aug 2026 10:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtPsC_Sj_2Bn; Sat,  1 Aug 2026 10:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 772396067F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785580484;
	bh=i5V/gzxIbV/cOA8xrkd8ec80CYi/Tt0iFmkDvDWWMyQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qyCmGnTQX3gzmRxENcBhecvg3Frp/bPcNBJs0Ly+PGpXJKSkNvUMOSnFOWG+aU0Nd
	 4c0wpauIT9pCFuZ702VfGcd/q/cRR+kO/DStrX/l+2nY/9YdZqmW/cKBLqzpQsYA9P
	 GAqoMCm0tLckW4HSOSLYSH914z3oaGnslKJWBegteFD9+fm3N5lWxrJaqxxePNl49Y
	 iMdxrqRW3QBfIGdUJv0iFlipMPtIzoskXgbEnE2aFTh8lsCUFGuDwKq1PV3oAlIi/I
	 l33bJe7KScEnzKDHj+M2c0Q7Kdsgymr8posRH6bsTyxPWg4uUrsMHiFlO39Fz5hntN
	 91EtIghAsnd8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 772396067F;
	Sat,  1 Aug 2026 10:34:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69B2F194
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 10:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FF586067F
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 10:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HgfQCqu6rkq for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 10:34:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31D6E6067A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31D6E6067A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31D6E6067A
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 10:34:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id ECEE42003B4;
 Sat,  1 Aug 2026 12:34:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Aug 2026 12:34:37 +0200
MIME-Version: 1.0
Date: Sat, 01 Aug 2026 12:34:37 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260801103305.E352186ADA@busybox.osuosl.org>
References: <20260801103305.E352186ADA@busybox.osuosl.org>
User-Agent: Webmail Free/1.6.17
Message-ID: <ff2663a1ddc5ee79d3766a5fba63caff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785580479;
 bh=l33BBIagz5vULUdGdye3Gq+5XGDv5l9c02QF+1IADyk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GxEfB58ZtbsEm0taUV+cgTPBYhdNn9Ui8i3Kxvxvh8BFqH4pxq6dNp7a1uBfRgtyV
 c8hxvTvCX9/RdpsDZSEcHKRrc6c+FFK4JuVQ1NvpLj49t2kSbhCSikozQjF7fBOUMN
 pacABb9VIAdwuY5q4Y1LINCOamjSJbEefdQBleu0RN48S4vnNVHG0tCJDhwK2Y502p
 tZh+Y9rs+V5RBwrLqOfVPbNUgWfR6QMMkef5StRbdxYfhIGEm1I1MoZWW4kWssMqRB
 rnznwhrsrq2W/pS4IQB95AqN7l+r7O+rtMX2ELQuOqZmYt8iGgvlZ3JuEJ0qC6wbRt
 PIQTYUbvWZevg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GxEfB58Z
Subject: Re: [Buildroot] [git commit] package/libmicrohttpd: bump to version
 1.0.9
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

On 01/08/2026 12:18, Julien Olivain via buildroot wrote:
> commit: 
> https://gitlab.com/buildroot.org/buildroot/-/commit/cd8161a374464431514a72c50c7b12a0d9577800
> branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master
> 
> Changelog since 1.0.7
> 
> - 1.0.9: This is a bugfix release, fixing minor vulnerabilities
> and expanding the test suite.
> 
> - 1.0.8: This is a bugfix release, fixing minor security
> vulnerabilities and expanding the test suite.
> 
> Signed-off-by: Michele Comignano <mcdev@playlinux.net>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
