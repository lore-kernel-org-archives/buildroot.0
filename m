Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DB4C021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 18:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E8C64075D;
	Sat, 22 Feb 2025 18:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zh7HnQR4xtye; Sat, 22 Feb 2025 18:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78BF3404DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78BF3404DE;
	Sat, 22 Feb 2025 18:03:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 591D36B
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 18:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4303F40422
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 18:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rviHSs6woWrH for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 18:03:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E540240407
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E540240407
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E540240407
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 18:03:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0015D19F72F;
 Sat, 22 Feb 2025 19:03:20 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Feb 2025 19:03:20 +0100
MIME-Version: 1.0
Date: Sat, 22 Feb 2025 19:03:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: Frank Vanbever <frank.vanbever@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250219160543.263046-1-frank.vanbever@mind.be>
References: <20250219160543.263046-1-frank.vanbever@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <f1766bbb1581653c0556cf13626aac7d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740247402;
 bh=qACTvPc2Y3SGVBLhSz+MN2p4S45r2J38pzmHMVKzvUM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AWIhT6XeGg0k5uUBAPPaC8L9Lgp9q4OGmqcPwPwNP+OPPxSXjIKIPaCjkL0f5MY73
 fyFL5z3pe8rZ6/Jge0I6dyyNrE7NqUJLRjlh57CuDt2u23Ijh8Jem2Lu7xTwXcPLEE
 ROZqnv2MRWoYynFu8MqMLGudhdBCiiMxBd74/XTOUT0BVtb52sN1l/qmG9J9CBK7SD
 Lyc6Oqtqgj/ruFlPU0ZuiBznewLkV/BC/iU01elVKy+GgsjzH+n23wdmN5MCXyP1xo
 QN50lwhfu7P4AA4pw6TGUgg1/0F99woLR7DV9y+OymLWcpZTuhaZxnoBiL/eus0TPP
 COqtXCTq5B5Vg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AWIhT6Xe
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodsecurity: bump to version
 3.0.13
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

On 19/02/2025 17:05, Frank Vanbever via buildroot wrote:
> - Drop 0001-configure.ac-drop-usage-of-git-at-configure-time.patch
>   The package originally had to be reconfigured to patch in uclinux
>   support. The fix has been merged upstream [1]. We no longer need to
>   reconfigure the package so we can drop this patch.
> 
> [1] https://github.com/owasp-modsecurity/ModSecurity/pull/2235
> 
> Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>

Applied to master, thanks. For info, I added a link to the release note
and fixed a check-package error. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/0748e761e2962e085ecc266bd79bb7991ff71462

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
