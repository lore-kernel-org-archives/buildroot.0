Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F5EEED615
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 16:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A0A88117F;
	Thu,  1 Jan 2026 16:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p48_jdb5pnCc; Thu,  1 Jan 2026 16:58:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E5B681181
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767286699;
	bh=KCoaw7Ru9UQ5TwnuXsNRue4yoPk37Gh+7VteScRkp+4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZDjZNn0dQGmxLWcwZjX/uly1id+WCnbjGFp/oBX3k/ommNE2D46XRDuzoGUD1hgH1
	 uetqJjSaTpCr6nNgjSy4O62imqypTfcO9skEWQbOdmMUs1zNidgg2LNxmjM0lpWHsM
	 j/lr5YaWfEjeUzV5NdqNnWU78sdTMjNkJ0J0/u1qLoN9FMhqYWbNF6T3zSKOaNVff6
	 cENPw+5rKp7Nwli3WbfOxKQ7rkC+QOr9EnpUOGIWDcVfzv4ekOCi/HzotRr1CqmhB7
	 I1Jt/a7pDDIZ3tjK7GZZJc1TfGzFQxnz5Nrabpo4GXDUIYQTZrNSHQdQD9JFR2SCor
	 V4liLunYzn+ZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E5B681181;
	Thu,  1 Jan 2026 16:58:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D33D351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51D0A81181
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsuLmLMEMxWE for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 16:58:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9443D8117F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9443D8117F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9443D8117F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:58:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id AED1860132;
 Thu,  1 Jan 2026 17:58:11 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 01 Jan 2026 17:58:11 +0100
MIME-Version: 1.0
Date: Thu, 01 Jan 2026 17:58:11 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
In-Reply-To: <20251231143229.597000-1-bernd@kuhls.net>
References: <20251231143229.597000-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <001928be256123fd4a2f845baec976cc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767286695;
 bh=xL4l0uSO49MAOOuoJ8xu4nsyqwtkHBc5B55Eu2z+ov8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H2bBmZ1CoTSCPZkmTX5hcCwb3Fr85uHgQsOkLwFQQtG9pyiSqWDjutnHiiz1wO+w6
 UhU95HSNs0nqm0kLdqSCLHu4rclWrA+C/+WBfpoDapn97bVIdJgzyu3k46ztHjUbyY
 7KEueu5aIrtoy72b+wVpc53Hxyq0YDnZ/2+f4fzh3AYWtn46G3DioRBSAg7fy9TgJS
 m+sqTxLf5ssRIK68KiH7JW/qQmZUvkY9jwThj8pBjn5M6nUwCkYtYpYEfVe6kBmx20
 Jmg/iUQUJemAmildzBwp5bjqYR8/2POMnBv4iXlh7sMowNISu69+oZLbvJmGPB/8iS
 8NDzShqQxWTjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H2bBmZ1C
Subject: Re: [Buildroot] [PATCH 1/1] package/{opencv4,
 opencv4-contrib}: bump version to 4.13.0
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

On 31/12/2025 15:32, Bernd Kuhls wrote:
> https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs#version4130
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
