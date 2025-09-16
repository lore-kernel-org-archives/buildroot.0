Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B273CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0000B82F31;
	Tue, 16 Sep 2025 20:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxmFcM7b8Oho; Tue, 16 Sep 2025 20:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F5D782E95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F5D782E95;
	Tue, 16 Sep 2025 20:02:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A48412D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0127416DB
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Btq6zQBgsd7e for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:02:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07917400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07917400F9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07917400F9
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:02:44 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1656129875; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 16 Sep 2025 20:02:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uybsv-0034xc-36;
 Tue, 16 Sep 2025 22:02:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20250915185448.11118-1-ju.o@free.fr>
 <20250915185448.11118-2-ju.o@free.fr>
Date: Tue, 16 Sep 2025 22:02:41 +0200
In-Reply-To: <20250915185448.11118-2-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Mon, 15 Sep 2025 20:54:47 +0200")
Message-ID: <87ms6u9ndq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=lrpbi5lF9t+bVEs3HqmSA6pCkvQVs9ZJ/kJkf/hiYqkOEu8ZsDBTCpr4jv2BKNST9T3jD7Wx7/K4nVjdX+SusNX9d8GEhQSTEJG5zVAzvlHgbFoJZw/+a7VVv/+DNEWwCSvsCUlsLuGcxlf9lcRxPfLUwB0FaHL5ytotro/YBTerBOZ6ZozvEMnLu2MCQrw5Ua0PxePoi2H9lf1jbfapWTqL9mAHxd4+8MOLcnEihnxvZ7jbokmnSFm98653LHRp2h0cVZuB1Kl9iCGKDzCpcblg4jKe+MkbMkUwvCiefeF+T0uOhEl8DWp92xG/q0KDS4Pf9jOz4dL/3eHxYN/nuQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=z1iBBB5gVddcmdRnKivGy72eb0aZ4cfg9aIhPSfa2aQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=lrpbi5lF
Subject: Re: [Buildroot] [PATCH 2/3] boot/boot-wrapper-aarch64: add hash file
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > Since boot-wrapper-aarch64 introduction in commit [1]
 > "boot-wrapper-aarch64: new package", the package never received a hash
 > file. This commit adds it, including the source archive and license
 > hashes.

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/7689b72e00fd4d8c017880004e83a1c79144ab7b

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
