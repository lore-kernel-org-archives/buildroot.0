Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C97E9A049
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 21:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 708B6402F3;
	Wed, 18 Feb 2026 21:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWdmIib-iZ9Q; Wed, 18 Feb 2026 21:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA6B340185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771450655;
	bh=WIn8miFEdbtMofOjQYvBMpi4vQuk1xbcb5gaeN++NrY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VSxw/PZaCGjULZ0rigawjCKGdhCjzH02N/vqKs78lLxkiQWoCGt4xAdEzyBpIwHRf
	 Zv1Ll+e1YHLsGu9Wuq0EK9KlZ/SBk75o3+Y+l4D0gUHK+xbS4xZPN4CXYD86fZye5D
	 VqXFwrknAIq9MeAAJGxcRQhXvMCwRweO2VG32pKJyP6cvevxSgFWuUp3WtsZraEiyj
	 dxxqfmsafxJiYHVBjWPtliluKObhptm6uDKvpYsA9RJE1z8ubAmQEl5VtwZMoat2Wq
	 5SrxSssVVeUpMWRrHrsBH4RyWuqumFSkrbR4b4mUfs3wWksPorgkK2tlax7NrGD3Pn
	 fQ+LOwn6c9inQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA6B340185;
	Wed, 18 Feb 2026 21:37:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 850CF206
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 21:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7697C40416
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 21:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8eKmWWvRxCzr for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 21:37:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DBBD84035B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBBD84035B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBBD84035B
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 21:37:32 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 9AB212C841CC;
 Wed, 18 Feb 2026 22:37:29 +0100 (CET)
Message-ID: <daee9e39-a754-4b3f-a47c-6a46def75972@bubu1.eu>
Date: Wed, 18 Feb 2026 22:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
References: <20260216171220.370985-1-titouan.christophe@mind.be>
 <20260218181825.147718-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260218181825.147718-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1771450649; bh=faC9PljIGrtayl9Kb690gVO9TTpSYXsEel76EOY4I3E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=go9WHFJzTkYdeyri3vO3twClKijqXgLHva8F1fC4c+96jhXUeAw91TcBGjb0CJFYV
 CdbJr+L3ZYU9et804rlqXlaiBU3f4YgkZXZ/XWMceKhnamAGYH8GvJ68EyuaSIohu7
 ofwC09X9AvgRk0bENYM2e/54n6YNGuXhG5n0V01Jn7QSFnAdWsg67xcfnuhFFX9nmu
 nngZGcdxSSJWff/iVbzHbRmyp30o3dZyJ6RmftxCWWVlfhUcQk+a6dKick/2LrVGBV
 2Xn2NF0w8TqOfu+2IqCc0JxUZMATww8lPVfyJu7BDEL+2Jsh4UpnunvfxI4WNzv0r7
 VcrbfAKD8b3Hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=go9WHFJz
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python-django:
 security bump to v5.2.11
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 2/18/26 19:18, Thomas Perale via buildroot wrote:
> Hi Titouan,
> 
> I had to  update the inlines.js hash to d48633adb736dac091477ec2206feebeee88e3e6e486aedb21c584e4b49be0ec

> 
> On the repo I checked
> https://github.com/django/django/blob/stable/5.2.x/django/contrib/admin/static/admin/js/inlines.js
> for change but the last commit seems to be from 2years ago.

The hash was already wrong before this bump. It should have been updated 
in 
https://gitlab.com/buildroot.org/buildroot/-/commit/44034d73fe9702368ab41b59410bab17f9ff1550 
because the file in question changed between django 5.1.x and 5.2.0 
(this is the commit you saw from 2 years ago).

Oops.

> 
> Do you know where this change come from ?
> 
> PERALE Thomas
> 
[...]
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
