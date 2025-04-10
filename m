Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F22C3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 20:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 509A2605DE;
	Thu, 10 Apr 2025 20:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhKjWinzFm52; Thu, 10 Apr 2025 20:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A20B6F510
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A20B6F510;
	Thu, 10 Apr 2025 20:34:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B5FE193
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 413476F4DE
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8aRatb23tls0 for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 20:34:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 365216F510
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 365216F510
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 365216F510
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:34:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id AC1DA78034E;
 Thu, 10 Apr 2025 22:34:15 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 10 Apr 2025 22:34:15 +0200
MIME-Version: 1.0
Date: Thu, 10 Apr 2025 22:34:15 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, Oli
 Vogt <oli.vogt.pub01@gmail.com>
In-Reply-To: <20250410201154.1128082-1-thomas.perale@mind.be>
References: <20250410201154.1128082-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <66fb5c1ca2b601cb1b792ae9cefd7040@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744317259;
 bh=J8FJdo20AYPRZDsXeCPkFtjPfCCXEI5G1yQfWuU+efo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BRj2hFpXvlVOkMVoWa9d3/wlUhXN7lB8U/WZRBmBGSof25PQ9tbCm5uD7WPwdOnzd
 qQG/pddv2/kLUvBQ7IKftAapqafKLbAHsyirRW4YxanBelJWkTDwV6eK2ks6v9zdvW
 j2huK2JoDKPJEiJHYJJCW0lxhK2zA315QtLgHmIR9C1ziGqOaGtu+qMoqIy1ha6QVj
 QY/ZNrR+BjzNQ3NCP1yZDgDAy+28Sz2uHoXNOuCPghYVVWoCzPxeosH5Gai6lsvcow
 f6/1w3D2iRBg22QCLzZzNEgC04LUmNtFgAD1rMNnkCu9cJYumn7VQ+MUkmUl0dE+08
 vz9au+FS1w4pA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BRj2hFpX
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 version 5.1.8
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/04/2025 22:11, Thomas Perale via buildroot wrote:
> Fixes the following security issues:
> 
> - CVE-2025-26699: Potential denial-of-service vulnerability in
>     django.utils.text.wrap()
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-26699
>   - 
> https://github.com/django/django/commit/8dbb44d34271637099258391dfc79df33951b841
> 
> - CVE-2025-27556: Potential denial-of-service vulnerability in
>     LoginView, LogoutView, and set_language() on Windows
> 
> This CVE isn't related to buildroot has it is only applicable on
> Windows but this package version bump fix it.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-27556
>   - 
> https://github.com/django/django/commit/edc2716d01a6fdd84b173c02031695231bcee1f8
> 
> For more details on the version bump, see the release notes:
>   - https://docs.djangoproject.com/en/5.1/releases/5.1.8/
>   - https://docs.djangoproject.com/en/5.1/releases/5.1.7/
>   - https://docs.djangoproject.com/en/5.1/releases/5.1.6/
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
