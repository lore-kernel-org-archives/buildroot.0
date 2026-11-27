Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA19606A331
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SWwzppGN;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=Ql5qKewx
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4891860AD0;
	Fri, 27 Nov 2026 15:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKhsEeQxGlHL; Fri, 27 Nov 2026 15:17:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7F110607B0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792647;
	b=AXpKQ325hJxp7l2/C087zUotBWEdsy/M/bGYS86e1lF08DxXmog3TE2Nwwvkecjd4iZZ
	 UD9n8ObP5dukw0SVsdHORj7D1XYveben07OmcHaWbJIFg8HsvpBaYGb8doxHPOv3wu34+
	 6EHvFqmKbgAgiOU8OZnBhsQ/Bc/YhVRUSE8q3ZHZyFn4qVlmU4v7mK2MzdslJ4lRAuSa+
	 GS6SsGcYdsQNIDOywZXOgbK4M6n6xmXkatx5rWIC7x6H39294KvBoNjXS5G8X4+DTMT/l
	 yQ9RxcgfIMG4IB8X6iIi/mLiTfTxLgFmIcNoAvj5R4jj95kNMhYsyNVo4YDPJq1qbjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792647;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ak6ReQuDSI9KjVisOI6k7bCRgpKxgYlX0Weq5Xx21oI=;
	b=o6D76DK68LLuuHCy1ze2DGrMqFgAAfoft5PWj0uyNYfwNCfIg+3hkauir+9jQQrWytBm
	 TsTlfPu94pqhD+ZQwrIdFyvpgZyehm4FdiAU6cKqXrimjTIJ8j26z/VirtDcDzGe7ULEm
	 B4KoCybVfaiHwy6zmxTC+ulbs3bB5s0T458aPO08jjVPDWK4H7J9z+8DuAUk1aBaqpWvv
	 hOqPuXFbf3u6iFTeEUV1a4o2ZxhXon4/n+uhM/3gZGoNRnbTthLBkYEqlSBF7oR3t8Chy
	 SruvOToWGRT/yKOylXBSZ97l1GYlyvyUUN9VoXShgdowa4qU1I1MxMlFp/p5lHuUCYg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792647;
	bh=Ak6ReQuDSI9KjVisOI6k7bCRgpKxgYlX0Weq5Xx21oI=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SWwzppGNlX8ab1B4r1lLQ0KaKQ6XkVmDRKKBaMWF1LSsZPb9yUwyTIWvNlcsFUCv0
	 mYDl2nCJZrcU0MCRIyguIyrt8LpK8jOvXmNjs4eJyNDVt0xii/g82BxmctlIWXWei8
	 4O3kU9lW1HZnGujkj3GwCew4yw+bBQjiAp+8QxkbR9coeQjQ0rMncH+BL+9U6ZoHMc
	 8wytzTQ4xUa5t1bEof24QPRR3M+32OnRC1jRlQ8HcKYQbjpNf7o4Da9UXEeVgQ8IfM
	 dnOkZLB1cHK5n9MmTwYZbHSkVJQJvQAldQpOJ2q0nQW0wD/an61yuBO1nKUWU4ZeH4
	 KMlLIRFgtjbGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F110607B0;
	Fri, 27 Nov 2026 15:17:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ACF1D1
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 215E3400D2
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fkuGssJlckp for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:17:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 27B8940012
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27B8940012
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1795792641; bh=gunqoIptqMzrrY75Su5NxNpeRnwPjVLDjMayGlr3IGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ql5qKewxnVIaXyme8GUDSmJmJ3rAbHliLN192luY2YF/iTy/17ndrRc/0Xu8lPMG9
 SCeTvV9av21xSGFP1PSmixAGeUMwg7PHxJx3lsDC67ViIRTZhAzyWRS5RypaZRRPhh
 cJe6nGhbWjh+1DIF4BTfLiu8IJMc/UMGxfI4NvhLIdN9cxajlREnsYcK/Ek2jXhMPP
 i9KlcV4AW5Lj82T8jZ88weHre4dldxKkWUK6CdPqIT02vdQGN+zuk/9GIMxvldBeJb
 LIbQVt7+B5uHLBlCtyhjuFri0hdys0YjjLsbBqAfleGk8m6hViQad2HBwInYsHW6vk
 fpTprivrlWcLA==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 53C3131E0AEB; Fri, 27 Nov 2026 16:17:21 +0100 (CET)
Date: Fri, 27 Nov 2026 16:17:21 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <awmfAY_3wXIExqBg@waldemar-brodkorb.de>
References: <av_1cutwNfEvosnM@waldemar-brodkorb.de>
 <371c805c-4a81-4a84-bae9-cee64518df2b@bubu1.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <371c805c-4a81-4a84-bae9-cee64518df2b@bubu1.eu>
X-Operating-System: Linux 6.12.113+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] package/asterisk: bump to 24.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marcus,
Marcus Hoffmann wrote,

> On 11/20/26 08:23, Waldemar Brodkorb wrote:
> > Update to latest LTS.
> > See here for a ChangeLog:
> > https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-24-current.html
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> Applied to next, thanks!
> I had to fix the license info though, there were some changes in the 24.0.0
> release (and also something missing since this package was intreoduced). See https://gitlab.com/buildroot.org/buildroot/-/commit/55bd43e4a8822fa9f609ee911fdee8c6bc69bd70
> 

Thanks for cleaning up the mess,
 best regards
  Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
