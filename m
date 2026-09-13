Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E30C88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 16:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEBD14050E;
	Sun, 13 Sep 2026 16:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ngc94S286Xg; Sun, 13 Sep 2026 16:05:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0CAB340400
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789315521;
	b=IxDceEs4/DNSybrhHG+fKZ+/FPMh48ohbEmHezFKNp56KroqBaCPoKmmVga5/p/09Ugp
	 0DFaO7/XWBYhkekmpFpp7c4Jcgnsc/sp4Yv9gOv8pB82dxLORhVAe4Kr9RCfVdjVwDqJP
	 iGd6UnvXagsxCh6JVc+G40iu+fdCZybPJenGZcK1Ra/L4tihqVBJreBmmIVjA9VgbEHSz
	 zq47Lvv0QWtdJRnsBSPT00q3dNJFlygjOFfnc6jZtZXqQck4rJcV0R42g9SgsspZ5Bmu7
	 35UZdrEaX8kcumTKpYyflGD+RyMjdAkxsJjb32n39yqnqL9GWd4WWCxIdrUuvaLhrkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789315521;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=8dmJX4CSEM0cVLPAzSCNq+C6PxERUKxLrgmg1AOAgcE=;
	b=Pch3DHj9kvvwI1RzRLPcGBUknCFbcxAWF7NaXkBaS208OT0TCMU/BqNsyfhNKe7ER462
	 iss/cJfCKAL7AZRhggGAVCSrckTUPtJ3Z+Tmv39zm3+WAnm9kYjLoBb1zjoOPwllFTC0n
	 +rJf1qB5OKLThz/DuVVPFE0H3h5+L5llyBoc9S02eH1L+/Ujslf2bQWa3uniQ2XJ88kCx
	 EXCGtLzXS73FgcM2lzCjzMLYxQvk+7QWcYPhwMJOlYDqQ+4N5zvBJD5Af6vmfXzYVapq1
	 enBp1gbdbH8aS2BS2iVXLgFeSB0y1A5fdgKfbU1pdJU1IBqE1zyjU5dBRzaG3zDNmeQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789315521;
	bh=8dmJX4CSEM0cVLPAzSCNq+C6PxERUKxLrgmg1AOAgcE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e+SrRQO9tBp6aXOHGNcz/SmJoCsYpA3uHmrxqVkmgnFpbdCiFTO1y3dCt18zY2qVp
	 u5CyjpIvtoBMV3Vmh8719mbwEsq6Pj+uNfOhjCVQihCEY9TwVyGmeBuQXaxSX57hbb
	 HUhzWyd1Xoj3D/RiHuoR/biysBax3HJ94kVVeqJUEq1F5LUCK7kXEZXFhiUlx/DuTM
	 YCRcs3i2h2rlajuXaMdKrtsBckROKBQD9EMh/yqui1jrgJvhmFoAPqML+M1W9kln/+
	 xQuGK1iLLDTQcwYTzYi6+4ORIqUWOCCJbHSIVvpf22PptrQVEG/8UwcRmYq/plGCx2
	 asDteaj4hy3ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CAB340400;
	Sun, 13 Sep 2026 16:05:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B31B9259
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B07E0809CA
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpI7dJkj1YRG for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 16:05:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C563E80A58
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789315519;
 b=bL9uJLM8M0zmsddt/7b6sM/s245kvAy2kkOc+Hf2iQ8rHxjUIWRLVs1xCDOaFC0sCyJe
 Mva6MtdX1iNXBc3hsVVvlGRtHQVo1ic+00x+w159ltTC7TXkjBQS2ng7lFSR9U7O7Qlg5
 U1B8YnoCPV/Wq7JnFwNSKCGHb3vavpBSf8VVntFOMtBfMiIO89zDI1ubioiffQM8PljI6
 IKsPdCv0PwYEeVO2XgHnZZzZep5u3D8l//VkO3zauAy+FVzPWEcV5lw0gJgoc2S7jsTNs
 BsPxhYRc618pYYZOZlgR+DOxt3mDu03kLRE/HIbqzxgpUPYpSl/II9eOkGboNSoRsBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789315519;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=GYt+nFiDxCBTV6+mVw5DarpdKlCMaR188k0s4xzJom8=;
 b=Ha9nLDWkpy3Ae3ZG96vUlno57HExjfFCE3XMk2GtiYYEFM7Yw1Iiz22S+c7U6Njtd8v5
 M5mjj5GAUb8dabIijoA9y3jXyYUHicAgeqmwT3E8+WcYY6s3CzSZF+VF41zSKDQpjSX3O
 eldR91yj9SZE/z+5MwYSXDpoG4UA6tVsszajDyWdGTvTTzSCyU0oyGf9MYiwHpsaGoQtL
 y6ll3AnmHVxKhK62MXyqdK9Nc6GXftbKAMamP/BjFEalY5GXzQeo9WviySi3y276vUba4
 2yX0mMHhqGxdU2d3IJnt1IsHHapBbz3Gk/jv472Py10ZthL2HE59owNqmk9KCFNz1Ww==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=o8IqoD2T; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C563E80A58
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:05:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D2051B0056A;
 Sun, 13 Sep 2026 18:05:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 18:05:14 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 18:05:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260907110532.1071687-1-bernd@kuhls.net>
References: <20260907110532.1071687-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <deb085facbce7d4f13852ce07eaf60f6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/taglib: bump version to 2.3.2
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

On 07/09/2026 13:05, Bernd Kuhls wrote:
> https://github.com/taglib/taglib/blob/v2.3.2/CHANGELOG.md
> https://mail.kde.org/pipermail/taglib-devel/2026-September/003127.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
