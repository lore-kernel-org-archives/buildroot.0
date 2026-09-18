Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73D9C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 646DF40D10;
	Fri, 18 Sep 2026 19:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jX53_CYvnem; Fri, 18 Sep 2026 19:04:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5732440CFA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789758261;
	b=SxuPUbQX+fNuBxn8TwJnboh5+NH3YADELY5rifKD46lYV2CqEoEEP93ePT1U8mY1m+Is
	 Ibs45LhFO0dwUUovqs3ZMLvSZZ/b2/jdwPmTfkENGNZteVzn7oAU2lMG1VKasOKo54SOA
	 V4i2/y1WWidZmdji1TsU85oPVvESG/t6dA2tWek1m8K5DjNK2OLIfboYUuo9KUT6zd6RD
	 /7Wcj5uDjEbaruRJpjb1TEBEiKGj/1T40t91L8aboSsAnd/jvEkzsjY9MKveJNuFd+jJe
	 Kx24GEirMxP1+g3Q/Wf36405OrQohnQ1/RxK0fqYte3fSP7H6qM60Vc62QGEuZYkOTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789758261;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=9ebc5/PFoNV3NJeLdwt+6nQP6X6J6HCBnTOZMjp9QlU=;
	b=c4WpiiwgJN999YF6h+omuuGUxPcebh/nf+SwZFlCEEAur0wR8KTEhrUBdCT2lXqBfowH
	 tMYeWzct6t9JrU2JGNmJ387aT7hJlpy1c56DdheVwIl6R8HXK8ZqXZs2yUy9w8KY1vxuD
	 Tcq4AfxzqYUooDGlocOU9MvMhLkCmY6H5GHTGnnfs95kjtslEYtAz+9RkhlR9RHGbIDSH
	 PJgWtA99nPG4IAW66sH4uG3tf02N5In8yK3awdB28qNrzINBIDURdeY1enZPvS1siU/w9
	 VkwF5b8TFVZ4HmkXG0OpIipatODJnPAaNf4s7cpo39yzAlULXXv+g8AvaVjgvZk24Ug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789758261;
	bh=9ebc5/PFoNV3NJeLdwt+6nQP6X6J6HCBnTOZMjp9QlU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XcWIzMrDGkDVPse91ihUrtSIMjyhj10iIX7ZW6zI5yQakltulnItMvbxVIrkIr/nA
	 k3p0sGAe8tHWYmXHZvv/Wp1F10NszUJICB935CA4VDcA0b9cwbMPaC2vEbCmny3PLs
	 3ZJgeBotURvW/QL5C63gfeDy/42YXSnjJp91NTUDOFZeyrKw1s/09pwncxSO1r54dP
	 gzGIBAI8+gM31jMxEC8m1NPyfc3NdDRRufIQXYPn2/P+QI6tXOG7bGLQStrdCZAOQ2
	 VhJGNCcCsC+BCXCGmW8vIMS6WddlSPfuIcDm9eMffatWgDsjoTTwcz6/OahcB2OGku
	 OfKQVeQ6HNh3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5732440CFA;
	Fri, 18 Sep 2026 19:04:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AAECC13D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D0E360E72
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVsr6Q3wy3hi for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:04:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8FF5360E56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789758258;
 b=TzOKIGOGJrAFhVGp1BJ9xA2dINsHr9HeWZxkNAOWwFl8IoEoD2dDRPwP7d5sQW/ikqdM
 ldLUm0cuFlea62lgjT3W+Isk0i9GkIwOhIGfn9FZroJ2zLjnh8/CVj2DQA5WHfIJ8q+Ps
 EbKJZvT1fj7wKHfBGu9/IBdQmtu6OHVz4OLrrPVMknfRtZpHZinFKUEHlNmp/tlXRkiMi
 UnyYjZJSi6g0kLrzNRHZD+clA0U4gUkXs2d/AEV72J94RfnkJmaPsyXxvbJ4TfbugIDdk
 d79acsNbJzyU8m1/ZcqS08ZDb7I3pWQQsxpgf+2ubodAio1TpFiVTuG85bD0ejKnORg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789758258;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=mU+oURm7aHUe0k5aXSObR8d5rUlaFt7As04xqKOHCrs=;
 b=O9s1uChVxqYE8vpBsSQ2s5plc15HtNJJ6QV7vxiKcxP+WZSlx7GNMGHAn16Fx+D1LtB3
 cCEFH8W77Gf3K5Oi7FBpPfsH7BVrN6kt6MwGA2N6uXVtye/i2LUsX9JARAZiVYufIOaIY
 dDzZBSYxRyPkWjDAHmOErnOnAi04swwW8rqV9igOIrxPk5htH9FNdDP3Llixtmlydx4ke
 8AK9904ovhoMJZsIlRF79+p2oMWBeedX5zcM3zVjbsl8qBVunBK6NpoZM/z2fHcrGjROQ
 2muS4XszYCo1Qt02x1ZeaB/d3ars6xyIBthR8lRNOplZCmzojkaUdloUlpYYyp+dLmQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oYnbjCzb; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FF5360E56
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:04:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2B6F42003DD;
 Fri, 18 Sep 2026 21:04:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 21:04:14 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 21:04:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260916205245.2349520-1-bernd@kuhls.net>
References: <20260916205245.2349520-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <4ef3495e1b7f148bbe33086fc3e0ac82@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/2] package/ghostscript: link with
 libatomic if needed
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

On 16/09/2026 22:52, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/eed/eed88a2a77cb8c4ff8c59bac5091221e6873004c/
> 
> The build error occurs since 2024 so a backport to LTS branches should
> be considered:
> https://autobuild.buildroot.net/results/1ab/1ab4767c1198838c3e3d126cdba790197d102053/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
