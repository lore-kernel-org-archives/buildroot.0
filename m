Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DF1CA5FCF
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 16:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E98540C90;
	Thu,  1 Oct 2026 16:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id raOl_-ng6-01; Thu,  1 Oct 2026 16:51:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6418A40BE4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790873495;
	b=Qlo9dVKLB2p0iemzBjpq0zXlO4Y/daVt8QwLGTNf5MEYB/GcCezLnCoty/KuOUsCHqxD
	 nWzWVRHSH+hGtHgxvZkRLLuqIhUfWir4jRCr4QqLvZAhb8mq0l04EO8OAQc5+D+EjQMeM
	 vVJw2z0vkRU3mqegngDsySpiXL7S9yVt1BqzXa/xyPqeJl4magU4vb0FOO/ssbkA0iwqw
	 bchLnqNJjaOMzUKW3MKJmFKHH9SXe5suVhVtkIsvs7v0YfJHZsNcqmyssFyk8IjRj88tM
	 NFGNbeBmSOExmCPfB2uWbPNqOP+KuQ94RdYlx0Oi/YmCmGU2HkIPNHwvYHB7wTh5zxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790873495;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=N+sDrDUsg4xU5lK0zoUQ8hJZMQVIF1W5AJWEdj4zEv4=;
	b=OHpBt6aWJ9rnkOG0FE6WzHO3nWqOu8xqAcRENvejFfQ7bD8nei4hQBnL89N7Z5YdTskh
	 spBSijzrtGaPj4P6yTASER+K4fOXkz5Q1YLmkTls0EklFkuCc6o1oMWcIRw8b2bBPgWyX
	 0ML7cfZ5eba6g2OD12pDjZ73X2Je9ppEWaEb6fhBwFDgh1BlDbD+MG2SS0qgXazDehe40
	 A+hmZBjC/2PRpw3cY2GsDnG8AFU2fb475ST0SED3ub9WqD3N0RZP57eiAx07P5DpnDl2h
	 WXadJt/fi3P6tyf7e8DLlqWThtXUQeWQaaCyzqifrCQXjKIBDtR1dKLWoG/I95Yy/oQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790873495;
	bh=N+sDrDUsg4xU5lK0zoUQ8hJZMQVIF1W5AJWEdj4zEv4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kZaTBnFB3YXXKvB0gyD8Gy9I75sbpE/OIFVZlcGHS8MBhKnNEdsuK/AHnpgIbvjoU
	 pksOpGqdqcixtw6Rw98X5Vo/oAa+4SsGd4ui2GEOcgDtuL1cXpN1z7FBikwb7Qg4MS
	 xhXGMUAWrO1TzUXNl9niffEG4bThgal6QLl4Lt+tZtxTKr4HvFHLu8FaAMQBt7afPc
	 hOuPvLJkAeOiWLGM3OZdO/i3+33zNKwYUWFuurJCxl+8iQahSq28V+v2/OfqyUlEmd
	 nHNIRfsQDFQXOMl8YTYkERrygoVL8wtRqXxZe2ZnBj/WWOgRCAyPasf9aCXObjXYIZ
	 OOF1JRLCa7jmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6418A40BE4;
	Thu,  1 Oct 2026 16:51:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96DDE282
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 878354052A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCuTf_I7qDnB for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 16:51:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 78AF640098
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790873493;
 b=ct2rIKrFSFqbfUUDfUATWxjss4Id99ZJ5GxncTkdkk1EdjPjB3ko2YaL6Z7Bwmc+B2MY
 QFWlyTpVzwB3aTXk3jERk+x9hG7ugQsU4TEq6ZwIUjw8aPZsgwlBAf0tnUsq/rjlpbO5O
 Y+Ua0l34W7Y2itnf70BxIQXXmWycuqy/UrSHDHuBdHFjp9JilzfagmVMMSZ2PGYGCliAv
 djCg7euCva6rY/vSGfv8IgKt7mlRjN9WU4ZWLYnUjzo2Danq2kbVpufYHT+QHfTWVHgu6
 t4KP9ScHUSyguCViq9ITaotk/W+02Kl1aKwkUcfTIyrxA9TaGn1WkhbNXdO01/OBQFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790873493;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=EkoF36XJNEl8efooLqrIqNh1LC5aVTkE107HxhZlNtU=;
 b=LFq+xIezbqWLt33TRhLatMAinAnUwfHh0V5m5Ih1yNnwy9YOYIHD6H1WcBvTumo2S+YS
 qIkVkQ3/7HTrQXP8gfviciaVZWf2zl77MXosopPYXzyhcP6G3D65NS9rN3aAeuekwXZ5+
 vKSMORbUwBpHcVDCqEd73dY6ONZWUf8mnMAeuLGXJt84QVBmR5OAJPfTqDmqDb9OyB+dB
 1qQb2OE1A0yby8UHSOEgG0fSowV69sdCy0KqTYdPD6HSSZFm7Y9k6mzyhevz8Q1cRMVRG
 R9pUlJKQ/JMKYQ+DeFjGJU0SzVa51FaXJEvvgJX34PeUxCNHQpFAM5lbUX5nyDnT0qw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GdoqTuZQ; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78AF640098
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:51:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E6D81B0056A;
 Thu,  1 Oct 2026 18:51:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 01 Oct 2026 18:51:28 +0200
MIME-Version: 1.0
Date: Thu, 01 Oct 2026 18:51:28 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261001113439.597461-1-yegorslists@googlemail.com>
References: <20261001113439.597461-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <37a946e0eabfe312952b8e64c155f6e1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/igh-ethercat: bump to 1.6.13
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

On 01/10/2026 13:34, Yegor Yefremov via buildroot wrote:
> This release replaces strncpy() with strscpy() in kernel space, which
> fixes the build with Linux >= 7.2, where strncpy() is no longer
> available to kernel code.
> 
> From NEWS.md:
> 
> - Made the macb (Cadence GEM) EtherCAT RX path allocation-free to
>   avoid receive latency spikes under host memory pressure.
> - Included macb in the device driver table and fixed a
>   `CONFIG_MACB_USE_HWSTAMP` build issue.
> - Use `strscpy` instead of the deprecated `strncpy` in kernel space,
>   with a fallback for Linux < 4.2.
> - Added a test build for kernel 6.18.
> - Improved `ecrt_slave_config_dc()` documentation.
> - Adopted the CPPlint configuration of stable-1.7, fixed CPPlint
>   complaints and added exceptions for device drivers.
> - Use an own pre-commit container with cache in CI.
> 
> Fixes: 
> https://autobuild.buildroot.org/results/5c48b38fba102c38630e546eeea05cf206eb9e53/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5-5

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
