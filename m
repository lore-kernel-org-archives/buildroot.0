Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A2DC369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 22:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9467341246;
	Wed, 23 Apr 2025 22:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uy4fVo72fDLT; Wed, 23 Apr 2025 22:17:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C57864123F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C57864123F;
	Wed, 23 Apr 2025 22:17:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DBFF2A6
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 22:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A27381450
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 22:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeIHJG5zDjm4 for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 22:17:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6DA41814B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DA41814B1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DA41814B1
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 22:17:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7B52F19F5BA;
 Thu, 24 Apr 2025 00:17:28 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 24 Apr 2025 00:17:28 +0200
MIME-Version: 1.0
Date: Thu, 24 Apr 2025 00:17:28 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Pierre Floury <pierre.floury@gmail.com>
In-Reply-To: <20250423185227.1313667-1-giulio.benetti@benettiengineering.com>
References: <20250423185227.1313667-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <a1c05e47db1bdd0a3400a86e1413f5fd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745446650;
 bh=Tah8IVdCI9OE0w3b/xaSiarM2hXLR6WPUyvLFmacGGc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G7kRcA+u9F7zRYBQRMrswnY3zip9IV2/JlzOojZtHS0DJ3E7L9jvRHKPNmy2HoaBu
 sfDWzPqhbRMO+wvt+EDfjTdcGQTcInpIEsYijhIrscC8wI0bBNLVFDLKhjnBvR7rcM
 1EiTfzU+fDwN5ASqEe6STQKT5zpFvk6kYtnauBgNTQIC3te6sCvHARRLcSEOmNKZpv
 OUel1LfnKoKZiG3N/Jotow7l3YcL7jH6+U2syA4pwcWJkje8rLCRPE6aT2+YPJq6wy
 dLAJOnXeJrOAOEhZsbc2aR9LAoRdQ+EBeNEzifakWXJYVGE0+sCuNgwGbbPHIjs2g9
 ZPX8rsm8rlViw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G7kRcA+u
Subject: Re: [Buildroot] [PATCH] package/trace-cmd: bump to version 3.3.2
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

On 23/04/2025 20:52, Giulio Benetti wrote:
> Release notes:
> https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/tag/?h=trace-cmd-v3.3.2
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
