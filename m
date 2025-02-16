Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00983C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 11:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AADEB811EE;
	Sun, 16 Feb 2025 11:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUzV0B2F452d; Sun, 16 Feb 2025 11:26:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB12581319
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB12581319;
	Sun, 16 Feb 2025 11:26:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A32501BA
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 11:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84F8A40F70
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 11:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFF8YwclxJz6 for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 11:26:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8356040FA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8356040FA0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8356040FA0
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 11:26:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D927619F59C;
 Sun, 16 Feb 2025 12:26:00 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 12:26:00 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 12:26:00 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: buildroot@buildroot.org, Vincent Fazio <vfazio@gmail.com>
In-Reply-To: <20250214174432.2080406-1-vfazio@xes-inc.com>
References: <20250214174432.2080406-1-vfazio@xes-inc.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <ce29968754cd4290a00735644ea4ea4c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739705163;
 bh=g/USMpQgaD+fo0L1Wew/4cItITESIgrkb3wRWnTE5lA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=POrng3qLAQoppLUxcImIZNAuG14r5WSCuzbDz5Kc/muEx4KLTlqzc9uRlGE758jA5
 fnCtUYEnDbAIsnND/r57wSWNT/4fGtyKXFd5Da3ODIYd+d1IPdnnjQoJerW/KP0hsB
 e8vkSwAAmp2EGZ+O+Mq6bjYN8CfVFbZ7OrR1yu+DHM9WKdn8ROli+N47Dw6sF+oEcZ
 ZmKKUpheVIC/QxhOFwLW1g1/qxepGk3NKBx5Vz2lDwOvVLb+d+Nl/7Rm5mhTFsdp1s
 z80EsMDsBfuGY620ENlhfwgJcU2TbMkpuKkk8Qp2NDQvxbOZqxCYPVoN2eYuz+NMdv
 6Al2gbwmR3xeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=POrng3qL
Subject: Re: [Buildroot] [PATCH] support/testing: test_python_{gnupg,
 spake2}: increase timeout value
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

On 14/02/2025 18:44, Vincent Fazio wrote:
> Previously, these tests had the potential for timing out with the
> default 5 second timeout value if initializing /dev/urandom took too
> long.
> 
> Now the tests use a 10 second timeout value.
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
