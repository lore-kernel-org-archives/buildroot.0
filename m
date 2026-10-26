Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F82606A31D
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 20:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I+DTwoza
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCD6C80C3B;
	Mon, 26 Oct 2026 20:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Y6rg54Fg2yy; Mon, 26 Oct 2026 20:24:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6B055809C1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793046251;
	b=DpXAqSGCpANfdYxhJpfRLruvQ1zy1A/eL3xDWjrawlNJzztGzJf4reqod6dmArAc7qp4
	 ngRwRhQ50bvAVITZWg5yqnLbzd8pmTvWSY9PaaB0GYpe4GmIDuLNjJjlZwd65NI7DLSOL
	 x8m3VkfY8l5yw4pux9gp1cWkmKNyKn4vT7xO3f4JNAT31rS7pBUDH7MM1tm4WAE5piGET
	 U6VLQzWC3fBNJfccg8KMCK7L8L4Lh5bRyaiOhwkLfvi9RzNYeCPBF/3EQC52XnxPY4gAH
	 FR7owSsk83+kMRAHn8vCgCCItQT2AVH6cf6nhH2/XDyopkWlsslvBx+FHhdf4N2psXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793046251;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=2uaonQy0p+P/Niz2ixfGo6N/PZ0Cx4IVX7SrZv4ZtIs=;
	b=TLGtcz67sayoZvSUfm+TgWWY3ROzvk7F48R8GeOhfVQ+f7MyWy+7TAblhnz44T1VZNjf
	 DgzJcz6ASvCMkVj+P6tuiF8slxOVVYx7WhQof62k81QxRn6hrbvSeej2lRF/rF29PHYXW
	 K3hag6hnO04LECS3P91NFYYp7+DKhFbDUzRYdt2c1V7Lfy7DNsEfeQlc8zaImiepA5NqC
	 9qtYZ4lfLM+RpqtZKHqgSMUeWP2ih9WFOiIHPsRBTs5e77joEjgU/9aMm7s7uCfXtpidn
	 MIlS9PW5T+xOnWVnZAanE6P5pI7T1ngLPhgAOEiBzfRhuyJuvAHFhrMK1aF3kIe7YWQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793046251;
	bh=2uaonQy0p+P/Niz2ixfGo6N/PZ0Cx4IVX7SrZv4ZtIs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I+DTwozasotyYPrM5EsNR+RNJDu5GfTFeV8Sb1WSGVz+HuGO8e8eXX7NAcEXumtLn
	 k0mUZHOncVPCSkNUm1VwpwQSPWdb4KTzC/y4iCsK1UJ9eE0gueCzrUPZdC3MFcDOHE
	 +bn+C/o4G/w8JZsK6zZgOALpgIoNnzs3ARGYZJWgYahusWfU6Fyq2V1wYOjiCID5SU
	 nqg89I5sXcCYWEUL1MXEguVZN5uyjOHJ6Nakxm/5Qcwq2NbIbv4Pu3OkvhmxhLGDE3
	 kMpU3Xl46Qu86Y86PlMoIEXgXIxViZJ/SFysb7yJ65wwPPSFl+kENtLRwiFiNLP5+Q
	 wz6neGsoFU+iA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B055809C1;
	Mon, 26 Oct 2026 20:24:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8337B2F5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6970B809C1
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Coelm-IBgCO2 for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 20:24:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 96F29809C0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793046248;
 b=JdEEeXaqksZ12ZfkpeCAyzvL/1dEVaypT2kdiDzevJntjw5Dm1wmYeGnZNNJWHFNyW24
 da06HhWtzEcs27y+H7t9Y/4vCjIihjSYAbXQr5PtSMermI07YbCukUR2lDoCLyffKPMw5
 yw6Pl2mBnkm3VCJ9eqz+UwNHNQYyGIiz2zj6o2azRLY06TxKkE3KwKKkZ5unv8zRT/AtN
 n0B8vEvHLqt3ikNps68+WJU9kec4bwUCPmI8A3VRJZaIR2GMroXoCO7XQodyFb+AS1SZA
 is1Z5kU0MGRacQLXCqsfOYmtpiBoJgNyVzpEOlyByClEArHmNLVmrZAafql4Mtu0bIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793046248;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=IUFUAp81dr2VipxINeJccfqynx6/MCVjbfJyBHq1klU=;
 b=db349XcpYUCR4/laMAk3Y63gfpOL7WtumuIyyGQdrbAifegnDzOsvkInte0A4aCPegNp
 JmzbhsDwxMZhUzb+lwr6Ob2iHwUfm9hkt3GffMbFX2wtKInGJ2ZctFEObG7HFPtQyswud
 0nS+uYtGqj6e7Il69GaB4J/0Rl32Lj05YMZx7M12Osf8/ASZusG15KEDGCpmWcGNsTMtx
 HvZC0W/yJhmeJOqfc8IbOCCgOokZA3hwuUuSNtR5T1kMHx7im4oIvnZ0aqRe1E9mSItW/
 twceO0xfZCUtm3BzHDFkurvwm3QvfI81a4RtNvK0Oh7F30HOHtdshawFpeSfyklugDw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LGRA58pm; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96F29809C0
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:24:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2A106B0051B;
 Mon, 26 Oct 2026 21:24:05 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Mon, 26 Oct 2026 21:24:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 26 Oct 2026 21:24:05 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261026112748.915897-1-yegorslists@googlemail.com>
References: <20261026112748.915897-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <4730669e68ea9866ce1fee76a8437bf7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/x11r7/xapp_xconsole: bump version
 to 1.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/10/2026 12:27, Yegor Yefremov via buildroot wrote:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2026-April/003689.html
> 
> This release fixes the man page formatting and adds an optional meson
> build. The autoconf build is still supported, so keep using it.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
