Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3668CCA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 15:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDAA7605C3;
	Thu,  4 Sep 2025 15:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6oVS6hp4EIpk; Thu,  4 Sep 2025 15:51:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF59605A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BF59605A0;
	Thu,  4 Sep 2025 15:51:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6A82106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 15:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACB34401C3
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 15:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCRVpSrzljpd for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 15:51:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C24C401BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C24C401BE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C24C401BE
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 15:51:31 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 920264435; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 04 Sep 2025 15:51:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uuCFC-002MxP-1q;
 Thu, 04 Sep 2025 17:51:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,  Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20250903195506.1502722-1-giulio.benetti@benettiengineering.com>
Date: Thu, 04 Sep 2025 17:51:26 +0200
In-Reply-To: <20250903195506.1502722-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 3 Sep 2025 21:55:06 +0200")
Message-ID: <87tt1ii5c1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=UqLWMn7FQrZ1fEeQAKE4Kt4UsR9C4O648kQJ2ZcPShXHadiypwsAjzRjpUWDofV/LibsXIgQLcmuG6MCpoU/Qim4jwRZzQaAtVaMFK9KC9yMlVRYn3+uqoAY/oeE3bo2uZN923z/4R2bhLIL6kSg63wSCgw4UMWffh8evYHwsPgw/vkskEYyWBqmNqkAI5TwZUvSjyxLW9t+FCpkMDbO/R58BtzTXX74FTVMJj6itlb4GppsUpYkYSmo8QkOySxZCxXbnlQKcfl8nXksS9K6ehFFkL3Cmhbm9pRv1eiLpMC5DoidO6OSgsxevsg+b8S9pDPdMBJCvzRGuODXd0MUoA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=bN6jfAfGPcjXEGe7GWo0hTsIYPqBuCvOlSkTOz3Q9Po=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=UqLWMn7F
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: fix build failure with
 linux 6.16
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Bump to version 2025-09-03 on branch v5.2.2.4 to fix build failure with
 > Linux 6.16.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
