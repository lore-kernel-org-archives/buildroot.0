Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9233DCD5BAB
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF8C660DF1;
	Thu, 13 Nov 2025 09:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pw39bWz26Jjz; Thu, 13 Nov 2025 09:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E360860751
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E360860751;
	Thu, 13 Nov 2025 09:50:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F13E0158
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7F5D81148
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRKk2ylNyMLQ for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:50:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D623581144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D623581144
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D623581144
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:50:48 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -991206666; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Nov 2025 09:50:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJTyU-002BhZ-0k;
 Thu, 13 Nov 2025 10:50:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Simon Dawson <spdawson@gmail.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Carsten Schoenert
 <c.schoenert@gmail.com>,  Lionel Orry <lionel.orry@gmail.com>,  Fabrice
 Fontaine <fontaine.fabrice@gmail.com>
References: <20251106204522.3273683-1-bernd@kuhls.net>
 <20251106204522.3273683-12-bernd@kuhls.net>
Date: Thu, 13 Nov 2025 10:50:42 +0100
In-Reply-To: <20251106204522.3273683-12-bernd@kuhls.net> (Bernd Kuhls's
 message of "Thu, 6 Nov 2025 21:45:18 +0100")
Message-ID: <87ms4qntvx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ODxZg+jgDTNxSyucMBgvEdVxBoByVVA0uS5fiTm5TFSmYBbv+QbcfjS38SrD22Cz0DFi2tzmFkxIkfiL3enzgF1IGWCf7EAWbgJPRtbmwm2aSjDbqvKejhAitnO89c2GHQV94QC4d/MnOlsPTse38SpW7mYhhvHPJ6exNpjw9J8eSvxvB9sbg7XIvpsw6UBAb5QLBj2uWBq825102OC8po2ro12b+uNQVq/cASX1jMmVHV/hvJTVLlU4K7WbymilkAJI+Kigh8ji/NuAXwjRDjS2fEgsp1nypH1ZVrtNnRXxnJQkOtAAp8bcvajFCBS6MTuwUCJ/uoCZZUWRuLbcog==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=gCoUDEwwQsGig5gzlxQHFxiaDEPioz0S6WLKjWRyDrs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ODxZg+jg
Subject: Re: [Buildroot] [PATCH v3 11/14] package/procrank_linux: remove
 package
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

 > The package is causing build errors with newer gcc versions:
 > procrank.c:381:9: error: implicit declaration of function 'asprintf';
 >  did you mean 'vsprintf'? [-Wimplicit-function-declaration]

 > The latest upstream commit dates back to 2018 and no open issues/
 > bug reports are present so the projects seems unmaintained.

 > Instead of fixing build errors for such a project which is not used by
 > any other package we remove it from buildroot.

 > Fixes:
 > https://autobuild.buildroot.net/results/f2b/f2b41d27cf32808783b582e8ad714fb653c05713/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
