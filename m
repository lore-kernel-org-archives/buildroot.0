Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE65CA0EC0
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 09:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2AA86125E;
	Mon, 11 Aug 2025 09:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4fj_paQY9rVR; Mon, 11 Aug 2025 09:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB40B61283
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB40B61283;
	Mon, 11 Aug 2025 09:23:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14428138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE57E411F6
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYB7_h4QmtUL for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 09:23:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 50A46411AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50A46411AE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50A46411AE
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:23:36 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1973316120; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Aug 2025 09:23:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ulOke-0082aq-2Q;
 Mon, 11 Aug 2025 11:23:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Edgar Bonet via buildroot <buildroot@buildroot.org>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>,  Biagio Montaruli
 <biagio.hkr@gmail.com>
References: <e4faa576-d8ee-4805-aad8-f19e388fa3cb@grenoble.cnrs.fr>
Date: Mon, 11 Aug 2025 11:23:32 +0200
In-Reply-To: <e4faa576-d8ee-4805-aad8-f19e388fa3cb@grenoble.cnrs.fr> (Edgar
 Bonet via buildroot's message of "Mon, 11 Aug 2025 10:41:42 +0200")
Message-ID: <87frdynre3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Mwj/XcR8POKKpqc1OTfexEesefD2qNGY5bGl/s+BqK/9I1LYzHzUMi3OPO/aSukqoZpWTosrsQCxyeFJfESfBfmYYUauVpmoS3giwW3LdKlxlLolvf2cZ6jN7F5enNfYUR2jK5SFVHVqVLpxgZONkG0sq0zu8xi71HHjcCtrAAUt2fvoaPDV/KmPlH5gTHh4XQdqxicV3MIsZd3vSexJzzJYu0jQbcDp1sAisbVaC0y3e7+6jH4Gr2z8D1aAy/bNNNjlhThhJb4DSCBZtz0l2yJ7k4LYe+qNGljO8ViIc0nvoax09H/xcEX0+jbSfyCrSgqP7jR4u43+6ccBc7+UPg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ZlFm3hKTk0OHw6Cc/ykwOh5BYOO0LPjrGLkQDx6ZeJM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Mwj/XcR8
Subject: Re: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.12.41
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

>>>>> "Edgar" == Edgar Bonet via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
