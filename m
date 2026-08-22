Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B144AC5DF8C
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 14:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C8CE80FA9;
	Sat, 22 Aug 2026 14:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNgbk1cllpaf; Sat, 22 Aug 2026 14:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787408995;
	bh=YVt0XPoBabg2rt4QsV6EVWMnuWHyde5Z9zN2QuuW8gc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aypOAWP3nPT6qwgc49I0yMaaT9m2j5CLpvqsNGIalk2l7Ked0ysd9igVAQvuLIqI0
	 INsL33Ktt3SKZStkhUQcyrfsIMtLXJLUHDnhCWVxZ7Q15nJNI00nF0dpTp9D6dbNIH
	 ofOqpKKVuh5un84ZFh5FYcD2YqQOsmuMvJz18ePabl3fxW5jiet3i2EQXEqgTT9vOc
	 64w46sDIhsG/nGgMD2VZ7DHcHR3oEZYSE9GJ3TxYRngIkU/3ZldKsx3Gz5rFQ6vG3Q
	 OZy2W8JKxlMSw/4FxiKVgF5MvybyFjgWK0NYSePuVl7jtg2BDSXIxJt1DgDvWfLfcG
	 zMaSbZjNiv2xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7526880EE3;
	Sat, 22 Aug 2026 14:29:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D74CB336
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 14:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD2354007E
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 14:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrHAg1oH1Lvb for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 14:29:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDF014005F
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 14:29:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 359F55FFA3;
 Sat, 22 Aug 2026 16:29:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Aug 2026 16:29:47 +0200
MIME-Version: 1.0
Date: Sat, 22 Aug 2026 16:29:47 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Alexander Dahl <post@lespocky.de>
In-Reply-To: <20260818174955.835507-1-giulio.benetti@benettiengineering.com>
References: <20260818174955.835507-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <22ab939e9d419d948cfc3c913c153e54@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/putty: bump to version 0.85
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

On 18/08/2026 19:49, Giulio Benetti wrote:
> Release notes:
> https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Even if this release is not fixing CVEs, I marked it as "security".
The release notes has only security related bugfixes.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
