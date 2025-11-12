Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7162CD3445
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 19:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66D6B82F99;
	Wed, 12 Nov 2025 19:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRQKUirdTVzA; Wed, 12 Nov 2025 19:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F23082F4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F23082F4F;
	Wed, 12 Nov 2025 19:33:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4F52230
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D248240070
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJTxO_MzBfwT for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 19:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BEABB40055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEABB40055
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEABB40055
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:33:16 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -390313123; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 19:33:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJGac-00HYF8-2o;
 Wed, 12 Nov 2025 20:33:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20251112191257.3727401-1-bernd@kuhls.net>
Date: Wed, 12 Nov 2025 20:33:10 +0100
In-Reply-To: <20251112191257.3727401-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 12 Nov 2025 20:12:57 +0100")
Message-ID: <87pl9nrqq1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LdNGheRwCLuSgbExiEt8XouIsShuAYR6f1NseHGfejEMXvuEwfZUbQ8s0Wurlm/+uLmUW7rLE5qGJn30k67PqiIpKqef4OEUcFl8CR4Q6JZleFkzEDqi8qknmPErSCP+3kjCduSuog+gzNvFYo0D/Wt9lZ41wGuv8RvFUVsZlmVnuRlTmimQ4kQ6HSIickEEHD8myszFcb35BqDH9quysMlVLkqX12OxXSPRf3Id4jqKwXhVfKYXLvaIsnm16kQP+k+eKTW+aG+Agl+tb+w1yMfMaZHyP0E5BR7ig4Cgq2/MLbZlsWKtihv8aXETB4h3wAmgQCm2NN3WepPwQ0871g==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=IEHD6bhhvfYDPLzPc4CX+ToojHz9qydlzbUmJsDORGc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=LdNGheRw
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.51.0
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

 > Release notes: https://sqlite.org/releaselog/3_51_0.html
 > Removed patch which is included in this release.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
