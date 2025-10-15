Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A728CCD185
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 07:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 205448379F;
	Wed, 15 Oct 2025 07:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRRP-LsNXgXD; Wed, 15 Oct 2025 07:04:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 432D1837D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 432D1837D3;
	Wed, 15 Oct 2025 07:04:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ADAA4C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4C01614AA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEWovcfY-VY8 for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 07:04:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BB21B61442
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB21B61442
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB21B61442
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:04:56 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -249479185; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Oct 2025 07:04:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v8vZ6-003Zjp-04;
 Wed, 15 Oct 2025 09:04:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <20251014183918.647473-1-dario.binacchi@amarulasolutions.com>
Date: Wed, 15 Oct 2025 09:04:51 +0200
In-Reply-To: <20251014183918.647473-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Tue, 14 Oct 2025 20:39:18 +0200")
Message-ID: <87347ktzl8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=lPgErS86i0DGFT+3YgaNrK/HqevoiMl3aoKcKIvQwZmDTbKxasO7jvrcoBBN3iRstemh3GLeyT3uYDmAq2ZjezyN+er7PRc8DS+RVCxz/W+2NNYJ1B2eAHTrYilYFXKgOQEAATT5Wz9phGlD1mscqFr62CJi0u8etmh5lh0Xs4+bkXdNG5gNiOeAOZY6qkTksjh78NhQritqJhv5y8EKT1WzxGfb+EqOWOjl5UksDr+fF4nPNa1brM+/kEDFU8joZF9YiPB2m3Z0yg54kdLZ56DdaSYgthYG+A69yvAQJr6w0NJaqn0zyWhpCyv6zzNMLLWrDzi1d4hHGKfFxAxUWA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=6mtjOg7PUUfYGYxVMBP0HmJPtid8NA8rRY/zzjWbhY4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=lPgErS86
Subject: Re: [Buildroot] [PATCH 1/1] package/iptraf-ng: security bump to
 version 1.2.2
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

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > This bump includes the security fix for CVE-2024-52949.
 > Fixes:
 > https://www.cve.org/CVERecord?id=CVE-2024-52949.

 > Release notes:
 > https://github.com/iptraf-ng/iptraf-ng/releases/tag/v1.2.2

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I am not sure in what threat model an attacker can control the interface
name, but OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
