Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DFBCCD185
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 07:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57BD783BCF;
	Wed, 15 Oct 2025 07:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoGNKa0yPMrv; Wed, 15 Oct 2025 07:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F02D683F21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F02D683F21;
	Wed, 15 Oct 2025 07:07:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C29D94C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A923861520
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlRDgCOwHOox for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 07:07:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A90DE6151E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A90DE6151E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A90DE6151E
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:07:33 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1293054161; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Oct 2025 07:07:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v8vbd-003aWg-0F;
 Wed, 15 Oct 2025 09:07:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20251014190850.3594120-1-bernd@kuhls.net>
Date: Wed, 15 Oct 2025 09:07:29 +0200
In-Reply-To: <20251014190850.3594120-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 14 Oct 2025 21:08:50 +0200")
Message-ID: <87plaoskwe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=P4p7jjo5wmFqBKZMkJ2dwrgjFdO2bxwcPcWiI6Cf2W24+TmhA1wKl9XGEnPWkegvYa4W43u2/tQi6anbSSehF3mHT28VE+eubidiBtWhKwMX27a5EjUm1TMVrT9qVueaDbuAUCaMpukJvPlvNY+QZYP+7skNjuRMxv4dxI/1vfPDnDyNPOCyfkhy2qqgpmP5PTMl6AhRZBHrQNk5lHbSaTj7EevVNK0gfiNBA7BEFuEDtH/da6G1Q4W7Cr2HWjzPocP7e63C8Fh+7Fgjwx/1m5Er3AYk+x/V1ROfyBQJ13EAXMHftH9WU3HzSw8TJBcVhQPMBF7oP1cSxzAgwdQ08g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=lmYvRyt0Op93zsRGlbyBvM36a7/Awlfmwtyq6W0e+Vg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=P4p7jjo5
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.127
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

 > Release notes:
 > https://lists.x.org/archives/xorg-announce/2025-October/003634.html

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
