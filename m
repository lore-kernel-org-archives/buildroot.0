Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2E4C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 20:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62FC8606E5;
	Tue,  1 Jul 2025 20:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNk5-hiobWBl; Tue,  1 Jul 2025 20:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADF1F6120D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADF1F6120D;
	Tue,  1 Jul 2025 20:58:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E2D95196
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9F8841C60
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krP0hJbPpjmP for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 20:57:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37A5641C5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37A5641C5B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37A5641C5B
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:57:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7CFF8B00579;
 Tue,  1 Jul 2025 22:57:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Jul 2025 22:57:55 +0200
MIME-Version: 1.0
Date: Tue, 01 Jul 2025 22:57:55 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250701162116.1319941-1-titouan.christophe@mind.be>
References: <20250701162116.1319941-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <f18599c3d98d71d976bf6024362371a5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751403477;
 bh=8oAXLhL3DuDq0OzMa8uRtXo3EYLFnBFteyyiMyDwk44=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FN4bKTupJJo21Y1aeqVAAv6omJw2YW3eIQmWNJKMpBkEWmDpAUJTrdQpRbhM+ql75
 w2EngrL0uOkY+YcUm2KUHOFdMMXj+r93Karrhw5yF2VNJpGvDX1haGE/RWnEr9tfnE
 qv8uIhtAVIyDkSRS8hYUCubFz0Uq8vIRGTNDxq1Ca/dNvPldUPTUqocmlgw9lfunbi
 6nbYw5bVN5DfzpaO+zyNym6GgoRNwQ3afxcR/jswjjBvnVzd7gsTO9M42w5ux3mix6
 7wlvF7n+LXyL2llaFoxnoRqlf7SV+W6aj0U5dwMrYHa7o0mlThCwrBbQIhmyNXcLKw
 scFaaOWBmOyig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FN4bKTup
Subject: Re: [Buildroot] [PATCH] package/python-urllib3: security bump to
 v2.5.0
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

On 01/07/2025 18:21, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerabilities:
> - CVE-2025-50181:
>     urllib3 redirects are not disabled when retries are disabled on
>     PoolManager instantiation
> 
> - CVE-2025-50182:
>     urllib3 does not control redirects in browsers and Node.js
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
