Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CAEFED3FC
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 20:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60B76811E6;
	Fri, 24 Apr 2026 20:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zm7cqBP-_tJZ; Fri, 24 Apr 2026 20:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EE83811AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777061003;
	bh=Il3dsMesgO6+OKJMmDLhtVI75Or+Fn3X/+nU6wbXDho=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Toueymi2LYhbHgmb+c4kb8GUSSjig0CPyVDQ8kzFSh/ApM+jl73nLIAsaz4z8+sXV
	 fzTgXiCfARlc/F/i4eiN17cLb0W1E5ej8egwlzJpbHdW/Bsq01VItHb3ib6zDrV5u+
	 zIFniR1TzVVBpTNabGTI1w3JI5SZynnA+JMjPsmfgY68o/9Tj56zNE9LPdL4sWo1bh
	 6izihNR1HHqH1hrn219t0rNQDU75eh6RLF63BVqPxtW6Lhg0RFntEPAf1hzu0NjLQ3
	 E+uLF05/2XbLsvRTODo8cmP9nEQ08ofr81lmXK+i/Iikq4mfM9L0IN08V/oOClBH9Q
	 hfqHocv2Gw5zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EE83811AC;
	Fri, 24 Apr 2026 20:03:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C379D231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B59924018C
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5ygW1T7w0Ds for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 20:03:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 96D5740184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96D5740184
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96D5740184
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:03:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7436C2003C8;
 Fri, 24 Apr 2026 22:03:16 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Apr 2026 22:03:16 +0200
MIME-Version: 1.0
Date: Fri, 24 Apr 2026 22:03:16 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20260424184930.2281649-1-giulio.benetti@benettiengineering.com>
References: <20260424184930.2281649-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <f8f77b9931283cadd341c09ed76e1136@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777060998;
 bh=Gth+X+RLaKPjXN868oUOC0RbSzH7oDzjct7vtRLVB/Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pJGWs2yiFkPqL4BjKe+RkTm1kXx6vMTJnsrUawoCnBFBrfW8UBQgsH8ulRHsTvSLj
 +04KhDlklvjjjfvUDm9rIzqHs2As9DfK8FviCrIt1EloSNRADhB4T5lV0g4+mEC43e
 NUXB+IfAvII86Voi3OEwlSb4OoPayCA1Cw/bPdlol14yXa8bhsVxH9+SFQAQ2lJfyx
 NLNe5PpUFyt3OBksQZlqzDdRZeF9YfBZXU1b9Lzajh6H2wUQrw5e/eP7jFmbPnHLkf
 q0Sp8qqpPUu36Rhsry6OYA5IwpuPSbj8YfKrv/2urbM3rWm1HqgoW00DXohnbzfoUx
 +EiLGm2Y7pnpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pJGWs2yi
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.123.1
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

On 24/04/2026 20:49, Giulio Benetti wrote:
> For release note, see:
> https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_123_1.html
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks. For info, the release note link was 
generating a 404
not found error. I changed it to an alternate one. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/aa3603d9df9834a43d5758cade8c633e1d52887d

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
