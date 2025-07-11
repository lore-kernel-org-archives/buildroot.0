Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E59C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 19:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 181C260A67;
	Fri, 11 Jul 2025 19:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrI8iLbKgfve; Fri, 11 Jul 2025 19:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6268960AC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6268960AC3;
	Fri, 11 Jul 2025 19:48:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1204114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C75C781314
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AIH15toO5IH for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 19:48:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0586E812FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0586E812FC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0586E812FC
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:48:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id AEF5E780504;
 Fri, 11 Jul 2025 21:48:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 11 Jul 2025 21:48:13 +0200
MIME-Version: 1.0
Date: Fri, 11 Jul 2025 21:48:13 +0200
To: Tim Soubry <tim.soubry@mind.be>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250710112849.341011-1-tim.soubry@mind.be>
References: <20250710112849.341011-1-tim.soubry@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <a0af484deb46b9f600acb3e7c0616341@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752263295;
 bh=ZS2Ig7ssUigJgb8ERsDaOHfc6vthas9ev/ORRsYy6YY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YvwC49+VQux6bvN0SrDS6BU6M0e24RUjx8QNt51Uv68Vg5x0xhIMdrDUqEmvIQrgW
 hUNIdtujC4/3YZkMhwuf3bYoPOUs04shFmWgy9CNAxLcpKnWlyO5X3jij3H+fTU228
 iSKAaff53Ll2fy48nil19yCLIucvxHTjioRCNp46KoBJUoSV9VwMpAdxnUZrvL3PBl
 9V7U9aS4EeJZ+HokM2LQz3PPQT9uW6pLTspZ9kkoDfkF6AmpMZXrx6huG4Yh76C2bF
 ZdQYBE5l5T2BIT/rrfiZm6wi7+5eF6BbjyF5N53WKrepzXRTEEreKx8ooFwgh2Uey0
 Np0HUUumAP0uA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YvwC49+V
Subject: Re: [Buildroot] [PATCH 1/1] package/libhtp: security bump to
 version 0.5.49
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

On 10/07/2025 13:28, Tim Soubry via buildroot wrote:
> Fixes a potential Denial of Service as described in [1].
> Release notes:
> https://github.com/OISF/libhtp/releases/tag/0.5.49
> 
> [1] 
> https://github.com/OISF/libhtp/security/advisories/GHSA-rqqp-24ch-248f
> 
> Signed-off-by: Tim Soubry <tim.soubry@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
