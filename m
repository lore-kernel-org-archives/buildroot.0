Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C56ECD983
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 16:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B8BD41239;
	Thu,  5 Feb 2026 16:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWHQLVaWZW-W; Thu,  5 Feb 2026 16:20:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BC8E4121C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770308411;
	bh=6gJo76vbxvbhuZuDu6fQoigUwBRF7ezffPUBmEUMQrs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GP0x1goiUdhcVgBK6wE2EO+GD8Hi4n5iscvcQxbeEvCMYkn3AmYCoEJMVJj9Vy9sY
	 UANLP12hjJDViMQoaWzIv6Ni4uoSJ8rELyv2pjOrl9XRGa+Gl0Vdme5zdbfgugmaen
	 +04saX41s+FDaWcPiQ9TGaKt8Y+ra1bUtI2466qKvqkRfB+eka80cPPqJtiKYL1AFw
	 za/sYNZ02+fyGukF6j366R+RXeoYtRkYba25sb2b5lQDCmDR6HoPHVC1gG38uQV6nd
	 wikXvwoU+GrTIr4n090RH40dQrRxdAA1T+ra3wvOCkAJcFspAPYIzg2+dBn6SA+YFK
	 +ayK/nWaaWFmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BC8E4121C;
	Thu,  5 Feb 2026 16:20:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B589D17A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99F634121C
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZbtsVobGHWH for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 16:20:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 918974121A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 918974121A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 918974121A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:20:07 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2047778046; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 05 Feb 2026 16:20:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vo25G-0000000EO96-3ei0;
 Thu, 05 Feb 2026 17:19:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Andreas Ziegler <br025@umbiko.net>
In-Reply-To: <20260204185926.1073422-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 4 Feb 2026 19:59:26 +0100")
References: <20260204185926.1073422-1-bernd@kuhls.net>
Date: Thu, 05 Feb 2026 17:19:58 +0100
Message-ID: <87cy2jp3gx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Wu7WVvgF4LvUDr6BDRcafyKLUyIw71LlkT6TRy3fDqfwnpmkqWO6dQc5vW5O84k0Q7WQRVBsC0V4PKOxzF+DAVwew4jejRwlJ8SBzDZusFYj9OGYlO/daMR3DJtI4lCdb1yHovsVePekIyLngjAexIgIL6Lkg5OEbnWoHO5chPUAv+/zyE6hTybhJNFx3gtjqDkq1j8dq0HI+/nsO0cq6SyRbk4bpquvbhgZ9WASWBq74uvgme/0z/997NyiYN1bIc/mQiOj4FOdye3n/KEP7U0dV6Zpj0sKc7vwukAwkhAKks7RiKmGmktUut7CYWIz5VtnrbtAvSPHUVEm4fF+Zw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=NMcfuly4jH1gVP0ha11AWeKQajpTheO/xS5WHge4SwI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Wu7WVvgF
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: bump version to 0.24.8
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

 > https://www.musicpd.org/news/2026/01/mpd-0-24-8-released/
 > https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24.8/NEWS

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
