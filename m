Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B410AC88E50
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 05:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18DB160688;
	Mon, 14 Sep 2026 05:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6y6FSjc6txi; Mon, 14 Sep 2026 05:30:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E17CD60661
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789363822;
	b=PZYGr1mgrJ/B3P9RmCPdV8gLidBHgcn0DV/CSBJFA9sMHgnQZMO8pDilaXddy8q30ZBB
	 Nf7S6w33JgD6OgB+AnCsYry+70x4buHcXs1u/qFiWp8VMlBldAGN3sYWaL7F2B/7c8fWJ
	 /INtOjPLsmAu47AFvXTieuAR1Y61AddfXedO+sq47m6EAgFzqq1kR8yg0pgtd7o8FFCya
	 FWX2LyGkdpftvpAc64gdL/k0TQnJhgM0ZI2w5UMB920oqo6mpdo4z2PlKYOOviwdS6Uyg
	 VNZi7urWAAqYIiu/5EbHXI9gwt7tp2kccimthEUKrudjmYToPq3C8riZZVX+eLSR4vA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789363822;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ks6uqoOffBxxk8mEAbYYGSTH3Fd6vMFvKhaN+z+qc0Q=;
	b=sTZ650W7piRBLvsXPG0Pyr0TnS8pmiazwJN+bOP5CAtgRikcEQsd07ZhG5Q8VOe9Rbnz
	 cJ/5SGOGlla1HhTnd9/orxQzXRBovZee3TZ1cAFBmIeXYc50YM1YotUW+Yo8UqvgKPuVP
	 RL9n5rLPc8IAK/lXNqad9al6IFWqVI4K03kbYrV0jtSzhlCV58266yVrl2zcDPTvHLPJk
	 LHKY0ZiJP9fc14fhMINsPaq3T+7HMbpN/cKBFTTG0PV7Jz58MsP5i+grs+/1/oXeOsmt0
	 Fh3Jae/vLGhB8mlLdxE9J0XYED7IcHJjpoIFHQZUHWaoIKkXbRBkWfywZMbJO+LnLoQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789363822;
	bh=ks6uqoOffBxxk8mEAbYYGSTH3Fd6vMFvKhaN+z+qc0Q=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qtEeZZi40ECx3vUeajC0nm+AicGX4eGaWIfStEU78qIylH6Np1df8oiXvJl0fTdpz
	 PAWtCRk45WdeyXCU9nIrk8jjxQ9W8WVGTkYfpSECt4Qna2PZ1Svrhn2lIn1hKqsvMX
	 NZ6isPFUPjdc+d/Q9fTwd2+ApgMe1TAPfeSprQpj+2/drGN1YLQ1JvlwSGKUahpHYT
	 K8n5vi+K7iK6z2n6zwNNAWeoPU6j2Di8KNz9TmmyfC3AkD+spG35DVVNh+jri5qv7V
	 A/CV/8FbfUA4W0MpmTfo4VK3ZE8Hb0tNBY3vPb5Lj1mhhlPCdUqrAzPKvMqP4KJGEG
	 jBbSeJDX4Frsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E17CD60661;
	Mon, 14 Sep 2026 05:30:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C37CF2D0
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 05:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9511405F6
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 05:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uKyW0I4993e for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 05:30:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9FB13405B3
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789363819;
 b=C28nCAvUvsIyffjDvDP3n7C/61ifCI1Pc6NtOrLM7jaVkg/OxZLzwa8AGTXqhIna3PYq
 VqWTXQwXNo9Ub8qjPZrra9AzFVHhZ4pL7H1NXVrgvDV5galtNE9n9NTvLXqZIu2Onv2DJ
 joi6IwNXPanwxqIr7IuTq1iOxDNC71fNxYi+6Sp9iQyNIk4S0rN6wjyNj+uA9FptE27s4
 JJRJwZqWrBam5zhP8J1tUXU/YVIMVhgq/hlujgurNHNSRP292p3pLYP3Nmpw6GH8/nw1g
 b/wpWvPOOWT0SUPZffAR9uDMSL0K/h3D5hM7r4bYzl0+gpaVyCxyrfssrBDzlqT+AUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789363819;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=ZX0+DKphfMI9BULjXIdW0Gyt6hHtbgj/fvy5dlMwbdw=;
 b=UXs+TftuW++3zK+vZWumip1jMQzVFWjhnnO1nS8Yjvx4YAQ3yPr1WHpLw/KhJpruqHJG
 JVpe20oNqKsLLgCfbI/TymYr5p8vW4GhWvrp7UdKDTDoCdDguqL2HGtOYUfAwEpbwUef6
 J84qD/5pHJP53f2EnbNF1lp24Ii9JpLOmrPjm7t6yqrB+osgC9eLx7pOvsm7QEXfl41ZY
 JdmVqh8QUVBlUrQFHeJwT2Y6qeOgZiBZBIVlRHfuvXubcpFlyR45xdMnkRh2J04xo+uNO
 kRGJ0dROts3QIdG6fVBHtbCvVXE4g89Q1dPswIEfdxEVMbON+CvaHmaHgm5PkIU0a/g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=OxCl5ucq; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=OxCl5ucq
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FB13405B3
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 05:30:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=OxCl5ucqwHaDVqD+VdD6VTBKcVBXCaGkozJxT9SI7zfRcXCZgxJeIk7sTfjvhKBX68X47mxIOtdEOG9eqTgECy8j2Q0qwqHR7JRisCIVGdA6IAnA7WwY/N2/0ZJL5dt/9+0X+7iypSbm+She8bDZaFtVMAoldoaR2eiWQhjMb9XB7YPk+A9AHPKdt45t6VIPkGcsRT/t7gP1lg03A+anYZJYXMTg/Dy5+QKmQmVNaJEyeeC9RdW3H750ayUhPDpa66U3XyN5m1joB1KKAe+xJNxM/yAlIXjsHsFKKRlOz8crqYdFyvdbmF8sm7WmDe9GJeTNRR2Hx+o51uB6am43Ew==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=D80Tt2hOT2TlGcQDoD24tNgX9pCpmvPEsib0ZpI+Cc8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -670832735; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 14 Sep 2026 05:30:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x5zGe-0000000Fmbg-3y7J;
 Mon, 14 Sep 2026 07:30:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260913231418.GE163018209104943@igalia.com> (Adrian Perez de
 Castro's message of "Sun, 13 Sep 2026 23:14:18 +0200")
References: <20260910095223.1597453-1-aperez@igalia.com>
 <87v78bewvz.fsf@dell.be.48ers.dk>
 <20260913231418.GE163018209104943@igalia.com>
Date: Mon, 14 Sep 2026 07:30:12 +0200
Message-ID: <8733vcwgbf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: security bump to
 version 0.12.0
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

Hi,

 >> >  BUBBLEWRAP_CONF_OPTS = \
 >> > +	-Dassume_kernel=$(LINUX_VERSION_PROBED) \
 >> 
 >> What happens if the config does not build a Linux kernel (then this
 >> presumably expands to -Dassume_kernel=)?

 > Exactly, and the empty value is the default as well for the option. In
 > that case the fallback code for older kernel versions is enabled for the
 > Bubblewrap build. IMO that is the right thing to do because we cannot
 > guess which kernel version will be used at runtime.

OK, great - It wasn't clear to me if that was the behaviour of the
bubblewrap build system, maybe a note in the commit message would have
been good.

And I agree, we shouldn't assume any specific kernel version if we do
not build one.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
