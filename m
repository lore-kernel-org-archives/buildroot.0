Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A816E606A329
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bpgu9Myf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=kpO3OB65
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 843B84058B;
	Mon, 26 Oct 2026 10:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hJeR37pJnQc; Mon, 26 Oct 2026 10:34:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8A85A405F8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793010846;
	b=WB7XupXDt6SfjflpYXiE4aGrroJd7dWgyr64y1MXwdqwhAfsiexyR7jkrQ0md8eQ9pz1
	 L6jCN3Zq6+hc4dWA3QwOpjTsxnDs+Fz+akzIWmqwJjOOdz9n+VJDutEnaBKN1pPn3/eZV
	 gSmc4jJlQluwSR+filnMPkEkgsI/7fr8AZUzBw/+FKeKxSj01agT/ngf6rp4oWcM0sv+m
	 If9+iZr0KIOqcb/Lcf5OiNIYH0JgIZ8A3cBxSvLfKQYp+Ht2dlnqhSUlhNNryIL/KtGKO
	 kLeuPWnP6UDLWTR/ZGIkIUJlaX2EN/dHtCGjWWd6suzVmQt80E0wCZLQmhDr+sOe47A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793010846;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Gm5XvKg/SHlZKEiUKZ0NvS4+QvLm7u3HfQV+sPGQ+Nc=;
	b=kUirdA1r8azBN2dXuGS7NbNIPbweL0oY66Nn9KxZbasPrLotPpxQ/xqC5RkL3Upx8wM8
	 iRjIWUJSvg64VVU/gOPpXGdFb1AcFpSbZKivhbYE+O0VRYlh1WN3S99b7IHMNO4f5Oc54
	 IVlslKSAjx5pZoZ0O6OKUxD3B7MyVNRZY64Y6Iy8GKiMlrh8e1P8tgtzX56laTa3tydQa
	 KfeW7nQ1iNHsDAgnqq4QkxtFVnv1ltqSZaIS6toZR6FYul6l07flh5L+aQVtyfJrBg8f2
	 U6qlzjZEvStIpevlgKWOOB0YQaQJM2DxfEJMgWU7OWDMAaaBKMQr8YFRKml33nPd94g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793010846;
	bh=Gm5XvKg/SHlZKEiUKZ0NvS4+QvLm7u3HfQV+sPGQ+Nc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bpgu9MyfaMIRWFcCzj1F3/RlCpZ7L/tZTNdpMUR18MnwK6rEua9/FPV6oaCXQw3Sz
	 i0woQdU/i717kaqLe20gwJ9HKjulCkhKoVC7V53NHIl+FJe6SGjHiMpzOR3uay7rty
	 dS/90YecTtZkhUAR5OTmkSz2b+Kb3wki64uoX5rJr9Lhym2x/QcuS93qtRxqPGiShd
	 ohUXa8EPd6yBGDEzctYKjlIbbhLHwcbekHe/yQcMhGqazBvX0QQPkQ7CFAYCMB3g5F
	 gVrQaIlQF+hQY+OaJkUK5asGurgRl5/NxwmmUrOjneCpWY4gzHRtGcmlJ6pV5O+UKb
	 wbt/Da56EqSuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A85A405F8;
	Mon, 26 Oct 2026 10:34:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 054D2356
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFEF780DCB
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUhbM0PSz-OL for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 10:34:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EC39A80DC8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793010844;
 b=EbiHaL4sPm4KDj9xOapIHhKK4koKkpoprvwQuOcexkz9zbPJ/pO2pcZbIrX5aA2MVGtW
 iKbRDs1boSiWaIfHj86pi2ZmafdlbBGHtyy4w8LbUczG0Vn5UnbD6w54W96SgUAUGlKzF
 uuytjUlRdoR+S89323VjbEvOgeLCRGC4MQI0j6ouILpRAvAWX++fZKPhW4XNy4XaeeWl2
 no9Y7ZF3BY+FvdApceomVHJPatkrBbQGEk2IT+zn5UpeRjLdevyKTkOj3mVYe6wTbsMGg
 4UOWM+y2M2OsKAGD9EGO3/d9hmqZca7sPzlGNb/coBl+r/yt1WeLHrtGMBjnnEU7nuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793010844;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=rwL+7eVEQGbaRNa9dsLLCuUrDgTTNbS7T6RCoQNrIaI=;
 b=X660L0XVuBRFM41IZMmyhB1m790A76SFtm5hqPcdqNiMYZKB27mXAkIK2lY8gP655Hub
 OBf9ByT/jwD+m45uflJiTdNz46aibmGOv1z5fy7eN+9TLYRJOkNGRwtKC0VBovDCvRIgR
 PpMzmx9nSacWySreoJO7VMyMlIG5lVrBS9YCcVaf94WnFmGnO/v9jQ9ovAoSMk5Qg4/nt
 N3Q0Iz3Eq4saHQkwGuowLmmI4mIw5qqUXxhtNSO72xlcKo5yrkcd/nxI2TrqfcET00Cjf
 yCAjkf5XM0jYVZMxoOX+tro17CNUiREveWmPL2vKJSKayqDrmBjadgoxjkeNnWHiKUw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=kpO3OB65; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=kpO3OB65
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC39A80DC8
 for <buildroot@busybox.net>; Mon, 26 Oct 2026 10:34:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=kpO3OB65mAoWoYY7FNy02bMnNyiuW7NYNwXheYHF+UiHeXaptfrHltRhsDL4kIvYklt3zztNcNe7AlyjJDxPZMWILTEqGnrAKFQhb3Bse7AbnVWd7M3MotHchUcH9/36PA2bW0RqfklX7rNCPj+DzOicO+bzEUF89CTyZJi+HE8q+RXvT/VeYsU1InYs/t60tiB0qihLxpLd8HoTi5LBRJb3eq9whGQVyCwVFSbjd6LHDDQLAI7pD9WiIBxtk227aT7PbwZ0bfuk34Mb29yZ1sFIwaHqz5FVhmG0lRnVQRufkpqqoVWSY5M+qycEUcONCSjeGFOC7kUvKSSUkHUPlw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=+TqE+AdPmqVNVJUux11bfMOMBwORKL0zrvOKaZdBSg8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@busybox.net
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -540510874; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 10:34:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xLI1f-000000089FZ-32vW;
 Mon, 26 Oct 2026 11:33:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20261026091528.278350-1-francois.perrad.86@gmail.com> (Francois
 Perrad's message of "Mon, 26 Oct 2026 10:15:28 +0100")
References: <20261026091528.278350-1-francois.perrad.86@gmail.com>
Date: Mon, 26 Oct 2026 11:33:59 +0100
Message-ID: <874ie892eg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/lua-lyaml: bump to version 6.2.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Francois" == Francois Perrad <francois.perrad.86@gmail.com> writes:

 > for changelog, see:
 > https://github.com/gvvaughan/lyaml/releases

 > Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
