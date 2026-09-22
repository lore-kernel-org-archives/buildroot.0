Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C95C98302
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 20:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3392C80BDF;
	Tue, 22 Sep 2026 20:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUNkrQNoYpo3; Tue, 22 Sep 2026 20:23:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E2AE980C13
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790108611;
	b=jXmORnE8AtBKeiz6b3b1oKTd9Z3RQx4O46uctO5ZeIZWZVAOQbaODr4hazrGm33chKrP
	 J8wXd6z784eI020gXWHDSYkNmOXMd3ImSVormNZu2PZEr6sNyFcUUa/GaocWEFYhPgMPG
	 ebT7mNqAnw5Vc32Wb0QwhJFAeIy/fhYpvzy/VeuyXPC7ylY2MPIru9ivXsVV6EjujIRq3
	 A46EEDWX4ip6/6d9QRarGj763a6+q41CmtDjIduTpDWSFnazPAywY/MOvyco9a6phO/bX
	 6XzA2g55AcGE/aYL2DpJw8VG5DqpoIGM7kwGlynXPFBbRDfMrLYVPZsgtU4w1P/ZNeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790108611;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=v0HULeA/rbeigMUAqyBOcSETlMpT0qsXXef3ocnNHZE=;
	b=nbzh7OTs+ooX+YYwRkOKIK0mNYGk6wm4vtj2Ln7oeWqJppoXdMnx3QAVAfBvA/DKU48u
	 DiYj8Dt/ZJn/tlAQ7QzwBBkDyKYtGlGteAAA6hueseDx2f1ZWsbdZ8SzbxBU32cgKOvP+
	 owffnA2P4dP6jDX7oCXlWUMzWqMASziWQxtTUrJHJNhW1K43w7DTnUVKjq/1RPhRZi7Cb
	 9phKFQNJ+Lm1b9Ef5eJ3xlYhBBTt/znOHcYvTmTtTkxGV8+EiPUcy02TX6gpKEa8xajM6
	 nwKXXgAXljBi7Fjam6kORMQi6dd3YBqc9T7CzITPmqqOGfNXleAl7W03w26Un5EmW5g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790108611;
	bh=v0HULeA/rbeigMUAqyBOcSETlMpT0qsXXef3ocnNHZE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I9rgZLDQH1X2GLI3a8Hl6WGnaLJmvx+KCtILwWhzch0yfue6meS1sxME9jzGTyjOH
	 r3gEUIDCYMBaC8JjmFeBrA91E9UePUiUf0Wu2CylM6eEhb/oxE6qY3O4xlQ27Ao9JH
	 I75+duFpCIHQz2BWxiR55t+s3B8QIAzlMZDc9feB2bVZah6vBe1B0THdzg40hUFqMZ
	 sLX4BfG7wdRynsIxORj+07viRGe4hORf+16BoXaZlQx+VaMYnTeYBjAqwzdZr2dVUr
	 j2/HbQ9B7JgtPoyRz15TLE8Pbsqls4Z+AHxJfQFJESP/zcFGvSLatoHE2MlooUNnMh
	 qpxhA0rMwhxyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2AE980C13;
	Tue, 22 Sep 2026 20:23:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79E3435A
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C330406AE
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2OISjqLXZRg for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 20:23:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7513F406A8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790108608;
 b=Fr/iwo6EWfNRLt2kRW9Txzjf6g8UqwKc5oOd1CflFGqrG+/tSMuYjes5NxMcrEuEQnGC
 86bTMvgcGV2YCQ+sfF6/SXjbZSBodPMVSxJs8m7MdM4BrOjnSMsfng+l4cQ4vIBFb0l3q
 e5geqEeVbYnaElm8EcjIu4K1S//tBZcsAQB16q2qrQZzwzXn2mTTkvc5+kZKzsP59o3Fc
 NW6pak27bvR4epC9Dottnw1Nq57YXuoQ+4iIQQTcgsYKJF7PtgG5/LnvKeaiWKNyRjw24
 GpL3O665GDON5JPMItU/DGOK7mo9/JOxhIwUgox0bEP3A4nCMYSBGlJdg8VDcueAdNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790108608;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=NnC+2dh/dnTnQRQlhv9jdCyOSq6FY2IDyoYfVKD6ems=;
 b=GWAHgJHQEY9eV1CG5Rvg3rZNY9vtB/NokZRiadTgkwuWhD6x2WuxhN/ud5o699XDd0ul
 Wq6bBHCeIXfVgrNA0VarTySQQ/5Um/DE8CWdTOWh0s0ZBvRJil2tWpq99/tHWAhsr7Do8
 yc8sjk8P3KrrbVkVYyLSx1Oqq/xkR/08OBlcjHUkrBlRfTbCBlL87/SAXsieRE2j94RKW
 Y7Tj+xKWED3tDpBYbDFOsfGsvVJq1N0P2KREEU7GOZS3TH94kAJkynBbIGzsveb+ETaTl
 Li4Gu9BSeIHCTU+Aa/HL36g09h8jO3NBKE5NsYhdw3+r8oRO0VN2HvPd4DUYqeXdrLA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kZTBDAo2; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7513F406A8
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:23:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BA3B219F57B;
 Tue, 22 Sep 2026 22:23:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 22:23:22 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 22:23:22 +0200
To: Alsey Coleman Miller <alseycmiller@gmail.com>
Cc: buildroot@buildroot.org, Michael Fischer <mf@go-sys.de>
In-Reply-To: <20260816191830.533747-2-alseycmiller@gmail.com>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
 <20260816191830.533747-2-alseycmiller@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <607331dc4c6b7c7d90ee43d07389c47f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/8] package/plutovg: new package
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

On 16/08/2026 21:18, Alsey Coleman Miller wrote:
> plutovg is a standalone 2D vector graphics library providing path
> filling and stroking, gradients and text rendering. It is the renderer
> plutosvg is built on.
> 
> Examples are not built: they are demo programs that are never 
> installed.
> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
