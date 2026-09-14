Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A994C88E6F
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 19:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A2586062A;
	Mon, 14 Sep 2026 19:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qx7EhTxjl3iY; Mon, 14 Sep 2026 19:48:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 732A7605F7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789415284;
	b=h8u9YZxwJbybpp/Qp/h56crp2caB9veiKjIkznAKBjIAF92wQ1eupUJ45DdCozbz40BR
	 hS9XS4WrcIuNCm4XAD8BEmvVvNRxRnrNMqwnATVKscUxdE2pbCL8YKqD6frS8on1C7x9X
	 NjGU6N3vvq/nbKJXkW+qCFWKrA525Vl1z8Mcmmb3ANH1BCBHwCh0YhAQj8EqbKNake3NS
	 c4xKGCyi5y7k/6PVllknewRYiY7Fr9ZnNVoZ5rV/atyw4IcHNI610DvPpoYBQg5TutbYK
	 Udz/Mj4/zVafOC7kw8cJQ99cM6qP3S/weiapj7R1mN0Be43Q1Q8KuSKm1czkI/DJh0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789415284;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ImpKlZ4o2hVn15g+amOp8/ncT5SK1gmBfYJzIdKsBk0=;
	b=rvhimVgbvH67XlxJPHdAEqAIQuL/PSXzuy81ey6ySpfSzqbnQma+g+rmlBOaZNxQJd0y
	 abvdfkTvx/iNsou6VNfuYt5lQ7Ny3Gs3rkFDbw64/yPXPDdliXI2FDaz1Yu9GLNa1oBts
	 aQ+ixBkfsPtZ0xfQWy95MxvSKHMj1dZ9F+ZDmxLf1QWZG5nMwpUiyrL/h/BKFY0MHtK3r
	 KdS0mJ3NzGaSZ+JXnyg9BOzoYC+shkpi07WFw4Bjgsn9wQPvMqVHJgMeKiMFVyOrDzlyf
	 nZt2ejGVOzZtszcglFHBeXRwfNBvL8hRAmTE+qt4JtKY4HhcR4AN+TFqSOjS/mUo+Lw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789415284;
	bh=ImpKlZ4o2hVn15g+amOp8/ncT5SK1gmBfYJzIdKsBk0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GI2paau5H/BAwk9TPltZdNaL9Cl5kzj3xUYnw0NvZqULhWP9uhMrjbLmJpIGZx111
	 ZXoyenrAfSgaApj/vXObApjJk9cr2fJtuwv03MGKmIl2/KHlwzixQndMWLVL+xi0dT
	 ZpwdRFC8iSLYwXh4LRLODxorcRDHibbutmqsI+JDx06vnVf3qoJTRXea5gWGw9BUJ+
	 zxvuojN5fvaQOdNY08b3yjNxYmtXKamT9nDE1oC5BHpJzqZUHpbwBk1mpX2fjeMEcK
	 B4n3IjBQoKya0U+YYxY43MN37Co2H1KNTb47Wh/AW8TAHLxeuuZtA0Sp7zNayQolsR
	 3T7qiDXHzu2Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 732A7605F7;
	Mon, 14 Sep 2026 19:48:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E51C465
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 208BC403EE
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJ8la-VkzUYL for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 19:48:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A121D403C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789415282;
 b=P8xZUSlXOMlgkh8WQFdE57pzw49xTqX1Q0j3xrVbf4fi6AKFefTYEu7dIVlJG9uf1afh
 pF065Ydk1Alf8OhgdJ9QA4fYPwvxT6EvkPeCM0O9wUITdR2MQvoKiOkPqqw6g5x2uDcxb
 Xkd8qE8ck9TDfcUDr4nHQssySGYbQCOuS7QxSYIv3+sxROpfcJdKxp+ygj6v9gxcvfTBt
 JxUrqU14WO34mSgdC6ULWw6cXJ7E/WLPe0kr5l/U6RXooKubtKFhSzGR5NONJbOqx8JdK
 av2udmtyAZnI96aYQy9LQa3+pWEK3H2AIBFoxMUSsjpdC7CtGhXQD3jw/bGt9gp+90w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789415282;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=7oIzzncawhX6UoFzFploV2U6cdhHhvD+8OmLHwtL37I=;
 b=sZ7lRQUtFul0fMCjBQABGD7kiiVPbW9Y+p1WpVXhb3/opov12rWbKZ3m3oreRcXrGr/g
 /MxOzWxIO28fEAPLMMT7EADTwcsmJHUCXk/KuG45/Zr4s6MhKmAFu4fymVJYX+zsHbHd4
 U0+e8T5ehC+ovVFAvdL5lWt/2MkIV+pqtN4IcfBxe2v2je//xZJ3aV5cgTewJLNEa4gQ1
 CiviCkuR/EIHj0eVgPFW6iAn5TxXspQlnlfT7av3uF0DFXQ/WpA0EOoRgB3R5rSgs9SYC
 Az+bttBHHbcE2G7yOPz9zCSSJxkGQVQCubmTrYHEToxkRVHt3Z+tzGTPF4di8hzq9aQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jeksNzkz; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A121D403C4
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:48:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 251AE78034D;
 Mon, 14 Sep 2026 21:47:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Sep 2026 21:47:57 +0200
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 21:47:57 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20260914155352.1331991-2-troglobit@gmail.com>
References: <20260914155352.1331991-1-troglobit@gmail.com>
 <20260914155352.1331991-2-troglobit@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <0a00b7641930391df11c97e03e67a3e8@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/lldpd: security bump to version
 1.0.22
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

On 14/09/2026 17:53, Joachim Wiberg wrote:
> https://github.com/lldpd/lldpd/releases/tag/1.0.22
> https://github.com/lldpd/lldpd/releases/tag/1.0.21
> 
> Fixes CVE-2026-46433, an out-of-bound read access when removing the
> VLAN tag.  1.0.21 fixes path traversal vulnerabilities and arbitrary
> file deletion in the privileged process.
> 
> GPG signature verified with key 
> AEF2348766F371C689A7360095A42FE8353525F9,
> LICENSE hash unchanged.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
