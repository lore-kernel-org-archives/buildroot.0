Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D19C83F17
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 13:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35EED8183D;
	Sun, 13 Jul 2025 13:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGCNvnVA0Zih; Sun, 13 Jul 2025 13:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48AE0816D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48AE0816D7;
	Sun, 13 Jul 2025 13:45:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83035106
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 13:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 746DD81479
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 13:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83vPGP6FlYU8 for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 13:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A354813AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A354813AE
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A354813AE
 for <buildroot@busybox.net>; Sun, 13 Jul 2025 13:45:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B38102003CC;
 Sun, 13 Jul 2025 15:45:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Jul 2025 15:45:04 +0200
MIME-Version: 1.0
Date: Sun, 13 Jul 2025 15:45:04 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20250712205943.1300274-1-francois.perrad@gadz.org>
References: <20250712205943.1300274-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <c2c1b754be3835876be4266dc5e43a11@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752414306;
 bh=/3HzhGISn7VvWvIEpnWz0TJ1Pw+PJ6TzEP/rCX8eSxk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uRtg+mg5Nx0I/CtVK8iUp4yoQHSJh/o6/nzZXzA7UPyFWJX2gpFjxk/My8Xm1O+gi
 QlmjNBCvNc6gLdvmf1cu+BJ8S3jINPrrfASv+waIcIN8MChC0ZGg6QUVCB87MilnVb
 Q1V2rJBm0lu1dPoKfEGiuq5Bpr4h+J/0DQ2uispaYscZtlRpD+Wo6KYPYV0GLiOCWf
 PIBjUNevJMKtjANq9zhNLSEuSO1Zk4zZ8nYvHtAw4HefX4fI0mygY/ypwhfpNIq2ec
 0WmDi7UEtncoIDqnPz0PMNXiGzF4Vfn7nUVqFW/1olO+prwf+mOU2Kwqhl3WpzBwwC
 i5IJTrj29WRSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uRtg+mg5
Subject: Re: [Buildroot] [PATCH] package/luarocks: bump to version 3.12.2
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

On 12/07/2025 22:59, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
