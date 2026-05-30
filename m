Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0664CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A588A42EDB;
	Sat, 30 May 2026 13:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAS-ntyYg9dR; Sat, 30 May 2026 13:20:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88F1642EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780147243;
	bh=t1/Ni0nnJtpcf/NDjPd9QMjKRERnQk6ffIlLvX1KS/8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D4T3cs2MDDzyioTv+m1uG5T0tkFSKdmbYWw1dYmT/lCqpjaD5cg99t5zq/72J27iB
	 SIzgokAaalLZya1sixXRvSnhMFT0b8tN/G/izdwJDeIqls+iLhAMJg1DLo++Nm8+A3
	 jm6ABTAKhpbYD9I9ZbojqI359dMQCEAQIbE4dgxmaPhHbL2SNbDNL5Sy62I13Ab+UP
	 ulxY4Ck0vtc5Afd8NPVON5oB0wzjM9Zicvl2GGSUxzvEirc4oCwcLvEGBk55LlfHcm
	 Rv0FFjQVyhHI9Zq7WFdnHsFVwhnOeqreKGZwo9bdusGim224oz28WwYBE2cyKt1AM4
	 2gzLybr/SFyfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88F1642EC9;
	Sat, 30 May 2026 13:20:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D0E4F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3382E42EC9
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdrhI-ADq-1I for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:20:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 23A6F42EC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23A6F42EC2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23A6F42EC2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:20:40 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 188880828; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 13:20:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTJcB-00000005F6R-1rpq;
 Sat, 30 May 2026 15:20:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260524171913.3231905-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 24 May 2026 19:19:13 +0200")
References: <20260524171913.3231905-1-bernd@kuhls.net>
Date: Sat, 30 May 2026 15:20:35 +0200
Message-ID: <87y0h1590c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EQgUH6KYuOqQJJnXgOul9I5k+2qfeEqQNHiFs0WZiUJBIyYtRnSMq2Ag+qt1gYUKVprsq+whjgL5v26/zYDjXiosAGWC3NWx3+71jOs4yZ4i3DHn22wZYloO84nbrwxhsWbLkWpwpj7XAfjIaeFqw8cfHoWm9jPMT2FtU42Intg/X31bzw22G6YYAxsmY6hpT+Dhr4ZK2wYAEAgFhfLsGtZ3iyuuRAK4DXgygqjVin0NvAe6X91DR2isM/7LFa9hgPRwkP9FFrH5nyzfHCb4oSm3UXN/ZUrjZ/VKwvOIOy1zXPjoZ2eyVuXv86KsmEiGpF93UvmUsKGNHWhwVdbfBw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=87fK2RYXeakVKPC5BaqGuNeOgL4ELmC6U3s/3lAclzo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=EQgUH6KY
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-nv:
 bump version to 2.1.24
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://lists.x.org/archives/xorg-announce/2026-April/003694.html
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to master given the segfault fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
