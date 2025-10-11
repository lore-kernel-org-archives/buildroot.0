Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44C6CCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E11360BD2;
	Sat, 11 Oct 2025 21:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYDf8qoNHKnP; Sat, 11 Oct 2025 21:02:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88EE760BC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88EE760BC1;
	Sat, 11 Oct 2025 21:02:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01F76119
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7C7540826
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tP2yYJnDW8Dx for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 21:02:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C66C407C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C66C407C4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C66C407C4
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:02:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8AF995FFB1;
 Sat, 11 Oct 2025 23:02:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Oct 2025 23:02:32 +0200
MIME-Version: 1.0
Date: Sat, 11 Oct 2025 23:02:32 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Kadambini Nema <kadambini.nema@gmail.com>
In-Reply-To: <20251011093606.522412-1-nemaakhilesh@gmail.com>
References: <20251011093606.522412-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <20ca7a36172a1825ee4f272f3028dfdf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760216554;
 bh=nOepbpUFI9MWxQTRI+Xy7nHcgIdrnOWM/CPJ5KWiGe4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MYY7wUV+EqvkLlv1rZZ23n/70UCwnwMZIwjCR6zoCm0HFPpAKYS19D4xd38gtKkLN
 ZvDmvNrbQF3W87THX3rdUbXj3yQj/app6ZvOKRla9Xx0sR1QfSQql8xVRS5uCYh9rJ
 gmFbNnxN/Yu87K8Rj00pqPH/kLGmQTKQYt6fuNo3tLpXwJI8ZEt+m77yrp0kq+gW4c
 065eFHPOnqjyN4x5jZybSKTtqoDsMIuTl/6R3IjwQ3w0dKYnjxj+Sbn4BaMJ9eMVXz
 HjLjR2FL+5qQ/MSCmXWwhNsIVHgIBf1MQ9wWMrCLhKGms/T1p+xC5/cAV8S3TquMu3
 LByPBVw1W0ofg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MYY7wUV+
Subject: Re: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.40
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

On 11/10/2025 11:36, Akhilesh Nema wrote:
> Changelog:
> https://github.com/pikvm/ustreamer/compare/v6.37...v6.40
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
