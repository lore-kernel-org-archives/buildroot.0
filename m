Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562F3EE36B2
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 18:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A6A18434A;
	Thu, 12 Feb 2026 18:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQBq9FFq_t-4; Thu, 12 Feb 2026 18:07:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 411BE8431A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770919633;
	bh=vgawFdVOYJSvicjzCQQvOBP18QpJ3OoHw8gycsbEweY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dNSsCowQRTLGVyd8exVKJLGw5/bWj759jsawAvg+p6JRS6QJpxbKuReWpkc9xDKDp
	 /yeUCP6o1eJ2niae5Uh0fgmWatEJry0e11Z3cA/DbEsxDk2B5M6lHVVDNZyGM4whob
	 gzc+fptU9EMrUMiQuXANzKOPZ5CwISzL4YrG404V/8D8yHWZgVMXuJfC/oa+lHmfrj
	 zQaQ8jucBXkCyxrtP4WeeYJ8IXoR8UfVjB9KYPZnOa/VyYMEhnpK7coPpCPHMSk9rG
	 CjBSRFiyE7PEDM3MA2HsypiFa3HxGiT8TAPeW9oF/zw8yvoCnOXGSMbPZti+GxBK9b
	 fOItALrvt8Vog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 411BE8431A;
	Thu, 12 Feb 2026 18:07:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 376089CE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 18:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24E7784303
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 18:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSkMvvG_HJzQ for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 18:07:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC1B38431A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC1B38431A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC1B38431A
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 18:07:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 224322003CE;
 Thu, 12 Feb 2026 19:07:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Feb 2026 19:07:06 +0100
MIME-Version: 1.0
Date: Thu, 12 Feb 2026 19:07:06 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260212104233.3226085-1-buildroot@bubu1.eu>
References: <20260212104233.3226085-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.13
Message-ID: <bcc3e4f55840f85c51bdc2e19a816e8f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770919628;
 bh=lXl1s5ls9UnEAVmUMgHjehh+BvlTsOOyGuwUVl5bYpc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q9tFZ726cSdqd5+FGhfTPtxxGd6fRb5NKVtnYZ5/Amt0H0Ajv/FT9jFA85DgfI+2D
 J89eKj/CsFzTz+wjMpIYE7CkLiz+NagY+R8ivrMgMCiRb5pzgn17Jb9sJ3dgk8ULay
 ZMQzFRWdtk7DhujKo0QFCv19WvhZX5yRTvPlRtDfEPQ2od07TMzlOSKdwj/3+wfpfD
 FUOVRJ1a3C554gK3VboFJUI/xb6AVqBvz0an+Xw9y6u7ZGhcDbybH5w9Cgvm3OpwTF
 N9lK6n+bRCqHAGzyxtjNz9+qTvwBH/11Sz2ENzgyNr4Ygh8GPcj1Bns9cKnGgmST/c
 1zZVUjM3LekPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=q9tFZ726
Subject: Re: [Buildroot] [PATCH] package/python-asgiref: security bump to
 3.11.1
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

On 12/02/2026 11:42, Marcus Hoffmann via buildroot wrote:
> Fixes CVE-2025-14550:
>   There was a potential DoS vector for users of the
>   ``asgiref.wsgi.WsgiToAsgi`` adapter. Malicious requests, including an
>   unreasonably large number of values for the same header, could lead 
> to
>   resource exhaustion when building the WSGI environment.
> 
> Changelog: https://github.com/django/asgiref/blob/3.11.1/CHANGELOG.txt
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
