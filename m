Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF57CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 15:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9192141697;
	Sun, 24 Aug 2025 15:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfJt7mb7p5C3; Sun, 24 Aug 2025 15:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2270416E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2270416E1;
	Sun, 24 Aug 2025 15:31:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53B20CA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3959A841A5
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjxbVTdf4w61 for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 15:31:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69486840C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69486840C2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69486840C2
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:31:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 57DAC780375;
 Sun, 24 Aug 2025 17:31:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 Aug 2025 17:31:17 +0200
MIME-Version: 1.0
Date: Sun, 24 Aug 2025 17:31:17 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20250824081213.452038-1-giulio.benetti@benettiengineering.com>
References: <20250824081213.452038-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <47107592fc78f90d0bb08cdb6cfbb35c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756049479;
 bh=6p/TX4Lr1Z6NRTaj9kQNzMS7byy58L9gA7zBDxJh0nA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YAb/Kzjcvd9gv5bLg1WZCy9gpsOdLssC6fjAVekqjgWZbSrnxs5Ol8ZnfzHHR58s4
 va6pB5IVLzfuZL7MteqwU80GRAv8D9bQbZyqJpG0V1NcnQ7ZmBfSxtuh+8XcSxKabl
 gW3T+8LGGomKVZpYKm5HX+9TtdUvT/OtDVtfKLdbVOrqDgAdIeHvIK3xzT5PJNpKgs
 SUQCMZFTsSvBzc+rkcMhPFaOaeHOU335J39I+eMiXACqn6PSkOg+eamrjY/c0dFyul
 t7LY6rc8KKI+2v6YO6TsS3JEoKt1xIRBL2pncdyF1HEJdY4MUIUDfb7DHbJs0Qacsl
 vFIGuIr16FpeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YAb/Kzjc
Subject: Re: [Buildroot] [for-next] package/libnss: bump version to 3.115.1
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

On 24/08/2025 10:12, Giulio Benetti wrote:
> For release note, see:
> https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_115_1.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
