Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7772E63F19
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 22:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 570E160609;
	Sun, 15 Feb 2026 22:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYcwnPJFoo0G; Sun, 15 Feb 2026 22:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E62E60614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771193886;
	bh=qJ662d3chen68gKfAfMROZrhud1HxqlT7C+o5YauVT0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e5pUvOwmTfBaJASdzJXeLJi+yxCMNwGLIyB+a2ehNikYMD8uzxH8HjJDVT02VJ4xb
	 7w1kWbZYw+igyI3b3YN8NtTlEoQzdaZuyYkko3Cmqp6b8YWlGkzZ57i6AhQMzSu+bp
	 stFVYjgcX6k+cAy3zdwKBMJOy8j8Lrvcqm7xA6mI4KgyEfyxz3hqT1dfd++TIHby/H
	 ZZz5SsHZIvd8/9U7FxzUmV62yv9lj0ynB2gmK7r1Dxr37DmdQjlhobs9aiW/XJYXNB
	 /BK8DToauygv1gEL3a5lr+pUmm7R6GNfBlQExBsWwmcPB1v7QfLXPrTiiYI2IVhqal
	 xxSfqdagVBiQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E62E60614;
	Sun, 15 Feb 2026 22:18:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF95C270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A451760614
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N56ZuOUSo_et for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 22:18:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D17860609
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D17860609
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D17860609
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:03 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1188172205; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Feb 2026 22:17:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vrkRA-00000009eC5-3RMl;
 Sun, 15 Feb 2026 23:17:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260215141317.503620-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 15 Feb 2026 15:13:16 +0100")
References: <20260215141317.503620-1-bernd@kuhls.net>
Date: Sun, 15 Feb 2026 23:17:56 +0100
Message-ID: <87ldgtodm3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=GbIyguiIyjINsErb+pGG+JPmuIomzw2GdaUPN+dbIgOiw/GcUyEAkN/xng6Ey66q0X38hY9Ccd/5mWXE7iyaR1D7INsDd+FqZCEiI7h+O6cPxwr0366VlsouljUzoRrNxkp+er8AZDsf1r6Vmw0AUleETObBkvpwpbCa9o+UbPOVe2DrBnMzfcRgN/Gr9j1dOAzj2u5ecf3YuKih0x+jkQ0NSRBKT7zc1kFW/5Ax8pXnZSw9OqP6xH+3lqbvQRUAjX2zzZ1XMZUb5lZ8bW2+585nImhP63UA1w5VPSbS6yhvttv5UtuFcX4nBTOjUXdz7PGGb/t4LnQ0msmcPmdpcA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=cwQjB+whcrpWrwPt8U43/Y0rmpjQySvnFcfRCGlVav8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=GbIyguiI
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 26.1.2
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

 > https://github.com/intel/media-driver/releases/tag/intel-media-26.1.2
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
