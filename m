Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3E7E63F08
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 22:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5831682387;
	Sun, 15 Feb 2026 22:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cL3EKLzt9tD; Sun, 15 Feb 2026 22:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84C8782365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771193907;
	bh=iMnue2rZGv9PqsNnVTp4y9gjyMbVEd7dqTCelUqIUrc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N5o9HLydoQB4H6x1eagMBx/3vRiEaVlN3jB0WoHVViyFzA8uUOInD89Kr3j/M3RcJ
	 +xv4yVQVVA8MEEdZWFJM86Fh/F81y+PTWXGS2Dq/Ly2hFrBphnXeS41IJesHG68PvE
	 9YaLWbrz/u8JikYZrupHnqCtuoDAOKpV0S+MQ8c86tzDAN358OijGJxirJ+h6gsHwT
	 FkcZGHtPrpYvMAiGsADNF6reoCmv7RVL0d6BcUce6L48Tk2bdbsgiMDyLg/pDesE+x
	 20Gj/12NSHRLLm7WF3Kk+29hTH3sWO13hm0OykXQ9p7+bfnrVoL+gAJ9DDFBsvMXdC
	 9N1YRcfx8Mpvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84C8782365;
	Sun, 15 Feb 2026 22:18:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0270270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B208B408A5
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0JLLOSVmEmo for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 22:18:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A00C64086C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A00C64086C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A00C64086C
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 425195614; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Feb 2026 22:18:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vrkRZ-00000009eDu-0HuW;
 Sun, 15 Feb 2026 23:18:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260215072212.12312-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 15 Feb 2026 08:22:12 +0100")
References: <20260215072212.12312-1-bernd@kuhls.net>
Date: Sun, 15 Feb 2026 23:18:21 +0100
Message-ID: <87cy25odle.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Xt5Wp1HIALcUHUnoUtyNao069dWN3ohc34LCcGEUcIWXY5vJ6KrvaNz5zfv23ogwCUP4m9FU57XoyLb9QcZBHgt7MMN1KknuFP6xdl1K4obW30zba0rZz7xCKTKDSuSlAOHvbqJaYMjQjcQYOhXqYUK5uwhkW4bV3ccI+iyV/xu2aBNM+Roq6BzQPN1aUTX5IZQIFjU9lHEGVDcIXwHr1MvWfnP0RubFFCeHvpO8IfQ1vpfNR2BB8Uyu58dWXemtgeg4CwOUFvd7v1WLxZyxFvFBtbSdAnTQ4nhblfKlOLRkuuDKkqDaBzYkLqjIyqbkNFx32Ax+azhMP7qlEKVmcg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=LP5h/9e8m/Ar+oEUOVbsK+shFV85bsfj7zJCoKVh9cA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Xt5Wp1HI
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version
 to 21.2.15-Omega
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

 > https://github.com/janbar/pvr.mythtv/blob/21.2.15-Omega/pvr.mythtv/changelog.txt
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
