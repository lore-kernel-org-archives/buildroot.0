Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F009CA5FFF
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 19:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5918F40776;
	Tue,  6 Oct 2026 19:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1B6BYK4ZYZn; Tue,  6 Oct 2026 19:28:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 938A740767
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791314903;
	b=Egdp+O9J7rEfEiwSAEQoZd8WO3HXPkU2j8UhmmXi5vZSnnFesyIyIXp4bToXghtBqW4c
	 5i89vgYY5sSxN1zJADUogs5RF5zR0ZF3KDXFIeECkEHnlDO54BVmXS16R6TQbYsvtNdGy
	 akKZE0+WnkySaHrfcoOOxP+Wg/0vhR7nfATidXmbaJlzdvfGjaz2w3RUxlWVfS9Xji0Xf
	 k5Wm9hraOzDVOfdJ/yqxJPeYcTLK1nAKqbIkVJGcquwMVxfTz6UCoMC7CdGV9YWKIUZhf
	 0QtkP4+Hcmi5ghdrkGl5btPZhw3xWqxEYs0NKyIJXwCokhB7u3T3wl1EArBb6Ucftyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791314903;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=xkstX9kMUmnf7ftxtD68COdENcjthpTsMCZ5zwqn9ko=;
	b=cCUeHa5ZkLDoNXBOutjWmQEz4jMyKHA4xpEP0oO2yAPBVM8iJs5BbK793LF6DCPTBU9Q
	 +0WjzLGxDxfEJPtEgKONzNl4AU2sdxW45ZM+2plAXmZdx/tAiVJ+x5LW8YPVHxKti1o4O
	 8vxYTto3SMKxrNDFebZv9gB+LqOBsEKb1oN/d5zDraCX9aAKOd5NeMS3mgSbLAO0zEkwQ
	 0S3CQ+/AgIJIgPyIr/kPXwSUztWukfxG2NO2tVNcbtbrDWmOEI6HeJ6F0Vp7f77caV7DX
	 3SyOScyAPgbJbi/DRARP1iytVrLn7ZvYuRGKmjcrxoU8I2JYZxJoR48pBgOATBI0k+A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791314903;
	bh=xkstX9kMUmnf7ftxtD68COdENcjthpTsMCZ5zwqn9ko=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cZ2eEXcfxZQFl5QC45idzYKyuddJMA9/4wKYSJ06hUL9iNYv2DPBhMiubKuszebGr
	 O2ZizTMP+BKLQseQSvvfFGea/2KxoXsWbHCvkvH5v+4b2/24GrwF/mM7BSZuQaeoOJ
	 VQmv6AgQESpeF/zYcsBP3fCb0yWeq52dOQ+rRmBLNdSdUISQNDzxJCdyz9oi5jsQ1M
	 fFIypuh6vvfauw66trmvx7+dE71XDorhPKuyIHdhUBW0r0NPUBOOWS7/qO/JbRILVs
	 KLOWblkUWgLEldWMt2cgDgQr41n0sYgk5+xddjEbUCSKIJlzANf4nPTFv7odvc8DGG
	 QioQWmuJtv+Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 938A740767;
	Tue,  6 Oct 2026 19:28:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DC91317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 739C4402D6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxCHj0eKfhUM for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 19:25:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 51D94400D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791314731;
 b=IhIJhikSTO8CSSbTrlvfSwPS88mpj8CFHhpHFlOe+uyNekKhupfpRbjwI5609uzjVZTP
 WOhFy8iqNtycwI/Ea+f3LfnP6qrjGPLEXNEPq1ZaT9t2ATQ40nEHUt1ug52SL9STEXS84
 HwrRQzK7PJDQuNMhzeUkrdy9SeE81KaNx+6owzlOfJucD1BRiaPILttMVRNYjsrcHVrvK
 d2HJjHyLpqbbYMmNUDB5vM36OqZo3XHgdaLKGG1n4rYmjgpw88A0gT+8swG0QomIBnUMy
 gj0zu2OsrhjISd+n9s3b4CTt+q4QYb9W7mg5+4/Cw/1SWzd+ryxlR4unCari/mieq/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791314731;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=/IgYEWr5qglLUaP+wcCg+SE2pE0Sujna1mPubS++h8k=;
 b=RZ0WCYB5OxAtY8AiVkV7bAhKTayuadca0sSh2Gej0fSkbft7zSht8+DSdeK5yN3VEw9F
 5Zt7eeglKlsTDyCz5YWq/yzgl5M0QfJCfxw0q6evD59xKta7d9FzG3eLbe2vkYDWP8IF2
 SEJEKoJfC2Lc4D3JRizTAQ5IlBAktnVBki4BkynZ+qh2f7i/81zmfUB4pbFQZvNnlEm1P
 H0V82KovzjFvakbBTqd2BuCq1w5srnD/Gix9cAwMnhpFz8XGw791yHkXAMZN8C1ZLFs1z
 1uci1+fQALEULoxaTj9mDlbiKJemShnVOn8H92+xin4Z+HL1pBy4/bDpPJf5GV6wHUQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=J4rmFK4H; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51D94400D6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:25:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D795A19F54D;
 Tue,  6 Oct 2026 21:25:26 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:60694])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 21:25:26 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 21:25:26 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>
In-Reply-To: <20261006185240.408314-1-titouan.christophe@mind.be>
References: <20261006185240.408314-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.19
Message-ID: <5a70ac4bf74b625d4be28eb79a52ddba@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/redis: security bump to v8.10.2
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

On 06/10/2026 20:52, Titouan Christophe via buildroot wrote:
> See the release notes:
> https://github.com/redis/redis/blob/8.10.2/00-RELEASENOTES
> 
> No CVE number are mentioned in these notes, however it states:
> "Update urgency: `SECURITY`: There are security fixes in the release"
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
