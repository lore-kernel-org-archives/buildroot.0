Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB55C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 17:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FBF840858;
	Sat, 19 Sep 2026 17:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhTqNPoqs7jb; Sat, 19 Sep 2026 17:10:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 39D7C40A66
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789837841;
	b=CssbKxlq/fsCWMQhPcYzR5mfB6K0hSy78fNatnbWaoiZwdd+rvY1YMjH9a2BF7YppJPv
	 cNuyr7r+6Q5wrn85VDHFJnG7oPFcPN3NmlUAaVNCL3ts6Y3oAroVVK10bFnnwKwi63NA6
	 Tvcw9C+0nVHpiYmh6hRD2IdIk+KYJqHD9v9rx3U3mN7tVL1AKx0npV3nJ7EbwUjkfTFu+
	 qiitcY1sUXbd9Gw54qiDYtfbUrF+5enIIQc1Ip93TocGk5uJwsfNucbysnWdIj6s8fm1g
	 yYTPNtFsXnv4zaeF46g6jyn1kp+33MQ6Ob1SKFRHs20doRVX/P2aGAG19xxF1hmbMsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789837841;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=66+Zd6yJE027jMDg0mZRN6q50soBE+mQoZiim8n+PFo=;
	b=aDU2bRa0U/q/f+/v15vTkI2iLcFazxC5mLkITKZlCFYsq98OfQps3nw0MZLfVsSKZY2c
	 K+i1rMQ1pc7JH5Dz/Cc94nNs5MkCycYDsJfG+lng37BPzIBzHJj8vxX0tqJ0wPzKkkdZa
	 EnaobAX6CAZBZK16plBi4IqmV0R2PxP+QxHPdZF5su1ZRTdjYjPbwR/yLtkTOaY7b83EE
	 T/ksWp8vcXUe6JKxEdIf+IA2HZ5WbpsVNgumSlcZX8TnJHzjfzC2AjrfqAz5Z36X5huLM
	 yrmzhZFjOINRC5EZcf/cmJYIIDWzyBjBG0bfCLD+y1pxVDFuq7lyhz4g2BM931Yw4ng==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789837841;
	bh=66+Zd6yJE027jMDg0mZRN6q50soBE+mQoZiim8n+PFo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cjY+xowwaiU/hHn2j4qY5IcZ/NG6FzDpsIlqvZtVEFgp3W0mS/CBHbsgdUOeubNq5
	 THwdO0Z1BZqPwOcPC8SnugvsadV3rlgV5mdzwqdYlq6e3g1kDDkJ7Q0i5IzwWip35u
	 sL55F2R1ecXPNooapsWTK55+kEBQ55zZ35jiUXylJjG54MB1e2Y+LBMK4jRT6z9uVq
	 /G6s4mDvVf5wWD1ZLueYJNTXuxJXsA1phFlxkgjimyzV4PdRJkJovhzcDXENiHA6dQ
	 OJEJd1KV8ZWVtUdhxLPMQxv2ucYMxjetfolDJilqLm2a6my91A3otAHoOY3nQuseUQ
	 MTZeajDOfqtQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39D7C40A66;
	Sat, 19 Sep 2026 17:10:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE3A613D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 17:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C029A60661
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 17:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3j__fTUIUCqr for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 17:10:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 057C960672
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789837838;
 b=a0PMyfjGJL0fCp8P2pSCaQzWiu8EHpv7FWjStIFwWvV3zScnn/EmTUKbJP4IZzRJQ2IF
 c+H4e1nup3dRTxhS+pae/M54fLM7dO0DGuK5DPim2mM0IEAutU5CFRIUACHaqemSG+g4Q
 t2BXiA5si6bGaGtOJtm2CuCcKpaR0RzjyUgn3LEW2xhyG9Iuir5joz+bBRrGdIO8gysUL
 X8pOt0tYM74TroUWPb402WiyU1heUt6qySc8+0/8yPFVinrNObVQBFdcj4W3kzNGYRd2e
 /vMdZTTKUlgDTMTyHuB676BSG9Jo5v6TMijPPl83ku6gGqSXsmlCOYLLkI/Yyl1LUHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789837838;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=TbOqVXGv9QDmZM0FHhOHe5Pz0z8Hnq59Q7163i+LgnM=;
 b=nyWdEAxL55uMXPP8FbG7CkJzQSH1T1vzaVjM1sp7EJuTsribjC5H2LIE9oz28MMCv29f
 vJBxAHWRw9+r15FlOIRPIC61FVCW79oVVj7R5nTk7++5LKPZNXN6MaGu4li0fqknTDEtA
 PCaVQ+yAT48ouGYmGQDe2hp8CbEb7rx2SDZsRzmP4HDno636bD4GUHUAa5U9nHQvvMitI
 ljFO/dqd+HcTMKfRhKu3t3UZzxmh0OMmh38T69zJ4aX7M9nz6axj/quIgNCRKFL2iEWkU
 hA0yJh0Kp9T3XyX/SCktWkCEreq+f/vpi+7kybEHxlxvKinqBn5zK6Bn6+/NRQJPxLA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XWc2sxnB; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 057C960672
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 17:10:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 00ABBB0051B;
 Sat, 19 Sep 2026 19:10:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Sep 2026 19:10:32 +0200
MIME-Version: 1.0
Date: Sat, 19 Sep 2026 19:10:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260919094744.898099-1-bernd@kuhls.net>
References: <20260919094744.898099-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <2421b856b6696aa70fe9c510ac539df9@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/rtmpdump: update download URL
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

Hi Bernd,

On 19/09/2026 11:47, Bernd Kuhls wrote:
> Switch to git mirror, the project repo at https://git.ffmpeg.org/gitweb
> was removed.
> 
> Fixes:
> https://autobuild.buildroot.net/results/70c/70c54f0627d59fc5516b2917958056ce0d822db3/

Even if the project is not listed, the homepage
https://rtmpdump.mplayerhq.hu/

Still says we can clone with:
git clone git://git.ffmpeg.org/rtmpdump

I just did it, and it worked.

We can also browse the gitweb:
https://git.ffmpeg.org/gitweb/rtmpdump.git

So was this a transient network error?

If it's the case, there is a discussion about failed
downloads in the proposed patch:
https://patchwork.buildroot.org/project/buildroot/patch/20260826155155.4146765-1-thomas.petazzoni@bootlin.com/

> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/rtmpdump/rtmpdump.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rtmpdump/rtmpdump.mk 
> b/package/rtmpdump/rtmpdump.mk
> index 4dfacb594a..9b367f3d37 100644
> --- a/package/rtmpdump/rtmpdump.mk
> +++ b/package/rtmpdump/rtmpdump.mk
> @@ -5,7 +5,7 @@
>  
> ################################################################################
> 
>  RTMPDUMP_VERSION = 6f6bb1353fc84f4cc37138baa99f586750028a01
> -RTMPDUMP_SITE = https://git.ffmpeg.org/rtmpdump
> +RTMPDUMP_SITE = https://repo.or.cz/rtmpdump.git
>  RTMPDUMP_SITE_METHOD = git
>  RTMPDUMP_INSTALL_STAGING = YES
>  # Note that rtmpdump is GPL-2.0 but librtmp has its own license and 
> since we only
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
