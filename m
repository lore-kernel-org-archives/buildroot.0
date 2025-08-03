Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67AAC87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 15:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACE066100B;
	Sun,  3 Aug 2025 15:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCb-3PvHUlcB; Sun,  3 Aug 2025 15:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D844660FDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D844660FDF;
	Sun,  3 Aug 2025 15:51:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 053041A2
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB1ED407B4
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUiQ5E6p2sc7 for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 15:51:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D995540486
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D995540486
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D995540486
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:51:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A99A72003CA;
 Sun,  3 Aug 2025 17:50:55 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 Aug 2025 17:50:55 +0200
MIME-Version: 1.0
Date: Sun, 03 Aug 2025 17:50:55 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20250803140011.186274-1-ps.report@gmx.net>
References: <20250803140011.186274-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <f0393f4842c7d7672a3d66ec9cfd4d7d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754236257;
 bh=MoNPzfSU8iTq0OMtBAi5QkMJMW2QoK77BndUvX02oOM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S8e4OHN5vZff5s3YkbxM+6E/EgsMihgQzn86LgCHZgu10l8n/w31//v+tQZ0VSFKF
 6EOO3KPpWGfJQ1Qo21k9cIc2b1J0VEMY8aq6gQvca09+/5vNdlQDFz4S2Xmex9YxDX
 NPmL83HWZOdKQUXqqqYGfhDSeI5KGokgcwHOZJlu8d4sZmjLyuPRp/QQ3uTGY5kl15
 9T1U5A8pbDAPsbHuQNeZw7EWWNV6/nKJa6gWrwU3tONOFhpCzFVx/JuhdM0CxHfoEW
 9jo2I6urRHYs1QAhXgrALZeprP6zNUrJf8/z+mTubUeHO5m8PCUhdapj+eeTjDwW0E
 DoyGv2SAgh8cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S8e4OHN5
Subject: Re: [Buildroot] [PATCH 1/3] package/ell: bump version to 0.79
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

On 03/08/2025 16:00, Peter Seiderer via buildroot wrote:
> Changelog (see [1]):
[...]
> [1] 
> https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog?h=0.79
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Series applied to master, thanks.

For info, I fixed another check-package error in patch 3/3.

     make check-package
     package/iwd/S40iwd:0: lib_sysv.Variables was expected to fail, did 
you fix the file and forget to update /buildroot/.checkpackageignore?

See:
https://gitlab.com/buildroot.org/buildroot/-/commit/0343f03ce496b16b775859c78664425be6278aa9

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
