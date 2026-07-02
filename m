Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4C4C43327
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 16:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52E264134F;
	Thu,  2 Jul 2026 16:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idIoboseMbPu; Thu,  2 Jul 2026 16:53:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 753144135B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783011230;
	bh=nEBTF8hWkqF542crMBcnxejUhmxyiowEnbkae5lW0DE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B0NFi50WZp0yMrG0jaMy/Eux9cc1Ggcrq5V7MpGaqaL7cOJs4ZFoUeAIuus6qzf/S
	 jYXUZWodSG8wGOsapcyraw27ivf47hfMkPbMEiIYT3RkWZB3NpgR1jrzFuuau8Y4HP
	 6phqnbuk9wpI6eEtChcsF0riYe2nAvYEOEv0zQ73FmcnEx/FmOq3DnjT9JMxc8yE5W
	 NSVA8i2/Wa4UAb677Nc8o7dia4by9S0J34E8sYMw6W8ANmi/8O0osijujXwX6oeGfj
	 w2cTTE32iJApcqqNo9AsI9cst4Dc3vSGj3ClTYtzQP6wFtHpDh4CfG0v5S7BycEitt
	 O2lJGCdhQ3RRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 753144135B;
	Thu,  2 Jul 2026 16:53:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6944392
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A89658417D
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOpgJOXPM_Bw for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 16:53:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FA4D8417E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FA4D8417E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FA4D8417E
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:53:46 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1154827307; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 02 Jul 2026 16:53:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wfKfW-00000003RNM-3vgx;
 Thu, 02 Jul 2026 18:53:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <akYJoolzlfi9uuQW@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Thu, 2 Jul 2026 08:48:02 +0200")
References: <akYJoolzlfi9uuQW@waldemar-brodkorb.de>
Date: Thu, 02 Jul 2026 18:53:42 +0200
Message-ID: <87jyrdnxih.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AHuMQE9ocFXyZs15HgJRT+c5mwmlnF4qCuSetXKXT6CVi/nRrxRdenNa8o/vQjlLMbhkkKlIZcjLQjaLHxNHm/F4erZ8VUBIAfBvqtTnhOKzbQTDm6kyRbha5eIlS/UbKofCWP1/yPUpm6evVsKO2q/tDmavy3ci4e6O43bBVtTBc6kzD1qJ6fUrdZQgHKM3FuqT9MgSV7r0DZLJ7YOGdI4FQnipSehKB3DGQOh7svDW2DOYRJj4FkyA80b32k5RW53ZIDhDUVmEUEgXClEHOQRpTb1+VQYNFW0WDYZwBnlZXETZgo1Uo3XUIGiAPe/nNG11UK05bpsmfLOF/IUVqA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=68wD+YwniZh019Osw5ZjRtGG82MXkntUMz3RI/9voVk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=AHuMQE9o
Subject: Re: [Buildroot] [PATCH] package/ruby: security bump to 4.0.5
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

 > See changes here:
 > https://github.com/ruby/ruby/releases/tag/v4.0.5
 > https://github.com/ruby/ruby/releases/tag/v4.0.4

 > Security fix for:
 > CVE-2026-46727: Use-after-free in pthread-based getaddrinfo timeout handler

 > See here for details:
 > https://www.ruby-lang.org/en/news/2026/05/20/getaddrinfo-cve-2026-46727/

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
