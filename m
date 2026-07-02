Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7809CC43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 16:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C1E16138C;
	Thu,  2 Jul 2026 16:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlkhKcNHegFs; Thu,  2 Jul 2026 16:54:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 710AD60E19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783011245;
	bh=ZGdOOPv2H94WNkjbKFJoZOP1yGHzpu3D3nt1vIfPy3s=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wy2L/Duli+KL0Jz8pgJD0qRHs+7v0qkNZkzcc7tUJK0KJo9fg1S7svVcsuJIzh+BY
	 X2tWdZb9whQ9HsEAWwAymE3da5iMbj8XJzHu4G522xzdzipXKyXH1sKZ2wMXS9qtet
	 rLqDy0K05uuqjGNYQloSoIUSOurGEpyVNm7Vs+vK6//g4VpOeMr6ziIjXjpbAemxFt
	 4Cgp5JT3Q9v8JsTr2zb8m18U//9BCeYoN3Kp9KUGyM2grKhcUmgVBwc3EffZFT9B5B
	 tRdV9EFk42kU4mchPSnBCLdowhi1nxE8Wpi8/4K2/rbl3gRBisQ2ohL2ZZ0/ASZA8R
	 8mcF8+/7+V08A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 710AD60E19;
	Thu,  2 Jul 2026 16:54:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6512347E
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5710B4066B
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fx5jXJsLLHPE for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 16:54:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45AE9404B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45AE9404B4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45AE9404B4
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:54:03 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1461351973; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 02 Jul 2026 16:53:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wfKfm-00000003RNX-3XBC;
 Thu, 02 Jul 2026 18:53:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <akYVJ5F5kodcxrfK@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Thu, 2 Jul 2026 09:37:11 +0200")
References: <akYVJ5F5kodcxrfK@waldemar-brodkorb.de>
Date: Thu, 02 Jul 2026 18:53:58 +0200
Message-ID: <87fr21nxi1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mVaqu8ezajj3HD/8t4MdLIM4TMpmP2Qo/0CAsHlfOFDg9qK4cAjpQoXzXBNLLxpGQ2/UEa0aI1zERiEPagWgMXGH0tS8IUZEJsmeRqstSyRKwLp+ZnPkzk5tmtGWxxLPebNhplrq7xhLUlM5xJUTLPzdSFVEPgJ47+IFgXqf/90ViKKoyYFzf6wSltJ1ZtzGM2oBnLnrqzs24c3vWBkC+EYHNZTg3z+lSCX6/wI0Nt6wQKt7Xr/ExNXBF2LhhsiO6arE3Wrh2KJYEnzMpu/E1a0O1PRFvf6PSsq2Oz1XKrvejzYlDeUAuz4ME/DJdnZGvVRPrUDFNIa4R1E62gWtmw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=fsKR8EfECT5jiR9urG3STYg6N4CcgcrA7VC9dTO9ux4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=mVaqu8ez
Subject: Re: [Buildroot] [PATCH] package/nginx: security bump to 1.30.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Changes with nginx 1.30.3
 >     *) Security: a heap memory buffer overflow might occur in a worker
 >        process when using a configuration with "ignore_invalid_headers off;"
 >        and "large_client_header_buffers" with large configured values when
 >        proxying a specially crafted request to HTTP/2 or gRPC backend,
 >        allowing an attacker to cause worker process memory corruption or
 >        segmentation fault in a worker process (CVE-2026-42055).
 >        Thanks to Mufeed VH of Winfunc Research.

 >     *) Security: a heap memory buffer overread might occur in a worker
 >        process while handling a specially sent response with decoding from
 >        UTF-8 via the "charset_map" directive, allowing an attacker to cause
 >        a limited disclosure of worker proccess memory or segmentation fault
 >        in a worker process (CVE-2026-48142).
 >        Thanks to Han Yan of Xiaomi and p4p3r of CYBERONE.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
