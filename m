Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF474C8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 08:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1C1F416C0;
	Fri, 29 Aug 2025 08:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTMnwror9ddE; Fri, 29 Aug 2025 08:35:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D07F4174A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D07F4174A;
	Fri, 29 Aug 2025 08:35:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AB76D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71B0940335
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nB0H-Qwz-fTx for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 08:35:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6CD69414BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CD69414BA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CD69414BA
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:35:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -21899111; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 08:35:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uruQD-00B6sS-2u;
 Fri, 29 Aug 2025 10:25:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Buildroot Development <buildroot@buildroot.org>
References: <20250828092254.316696-3-bagasdotme@gmail.com>
Date: Fri, 29 Aug 2025 10:25:21 +0200
In-Reply-To: <20250828092254.316696-3-bagasdotme@gmail.com> (Bagas Sanjaya's
 message of "Thu, 28 Aug 2025 16:22:56 +0700")
Message-ID: <87wm6mk00e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=E/xC/kVFRske+XXuoEkmFFYTr4N4uo3Ubrq65UI3loE4DlDCmZ62dw9/IlPouqA9oXb/d0/jdtKvC2sxewPl/UgUd4tVowBgDOyUISrtEPLCsc1Aqe3c+M3aERXiP7tRimSTx9i0WdqQ6SgE846nYIeK/WdeLCjVj6YMWl1QRNn96EKzsSMsuJHZHy2JGDOnQL7ULQgbb/7GCR25H3MlRh+bYWp36ARPPBFLsvKHHv+rS/J32SDW7bxv1EwiDv6NTkM3G68Hy281E0jw2zLoDxXwKVJxfjkdh2iCEwVDBM4zdV61CkAl5VRVPIhGNTHA25teSxfxUxbf+Hhzw8J0nA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=3suyu9xajnxfLcnpJmJ69ge6cuRdIVLG9piHPqc+N5M=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=E/xC/kVF
Subject: Re: [Buildroot] [PATCH] package/git: bump to version 2.51.0
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

>>>>> "Bagas" == Bagas Sanjaya <bagasdotme@gmail.com> writes:

 > Bump the package version to v2.51.0.
 > Release notes:
 > https://lore.kernel.org/git/xmqqikikk1hr.fsf@gitster.g/

 > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
