Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFD6E65298
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFEEB606ED;
	Sun,  1 Feb 2026 20:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRU-rNmjlHfT; Sun,  1 Feb 2026 20:37:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E49060669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978270;
	bh=zpCTKHLxjXbU++qBTnnFwYKqcIHwvMJlaN/mB3mr39s=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mb+W6b/9JA1ytBWrNRgEVFOjWfxxNXWUUXfF5n6Q+NDSI6Z3t5Em047ge+N4U0HLU
	 4fxh+K82M9LdIv0E0awxg9wgccoc5z9phN4gKxUhQTxgeLmOHtBwtN5S484Wo2htyP
	 MqIjnbfmJdO2fRGahkwdqCNr1vSdeWEsz2i3tan5VZ4jzVLPENnh3s6bjayjza4vTp
	 nB6HNpStTnmR9NoSJYZE5aVy1kC/hoBHCKbSBmYXxkk9JJEOvbk4xvUIZHhqaHcgDG
	 y8MlXkAEPAGFQgHHX/13a6sBeKa58tP1TicJ8MKFYHNDFCrAMRL0PTMqXAq6gQTtZO
	 D1S7kKVHsWy0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E49060669;
	Sun,  1 Feb 2026 20:37:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CD731E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16BFD40105
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laLxiqIdhaG4 for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:37:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F32F04004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F32F04004D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F32F04004D
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:37:46 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2017786664; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 20:37:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmeCV-00000005k7J-3C2s;
 Sun, 01 Feb 2026 21:37:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Frank Vanbever <fvb@funkworks.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260201124015.29808-1-fvb@funkworks.be> (Frank Vanbever's
 message of "Sun, 1 Feb 2026 13:40:15 +0100")
References: <20260201124015.29808-1-fvb@funkworks.be>
Date: Sun, 01 Feb 2026 21:37:43 +0100
Message-ID: <87ms1s9p48.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=fI00cZfvijWQCpW2v9Hp7vuhO8hb6JhkG3EHZ6JwM59T+iWxr4kmD7tWL/tLF9LSeYqHODpKQ25f9R0PQlC61Iim5GSrgcahmoZDqlnTHNgIU8gm8e3FQ84xcyejKHDsdJGCxjVPHVzHafdcUG6UfmIOLL7Jr3tiUO71UIuKaE69/SlyPmHYvk6W5Y+y9GBLR4HzZEgrp8/vAuY5LY+vfJKfqu7+wYv6eGPmsKoCqxOfZ4FThfTW1koRoK/ybh3X6Qai7H7eL5v77zTNKP8xWHPlJL7j3izwVkpmy5p+CzPVSsJYwpQqyHNW1TBhrpNJb77gciQ56l3QQ7+UCrW8Wg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=/53GthjUTx2T36nOvYyJCPiP/2GpigiQTp7zhxjyVeY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=fI00cZfv
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: update e-mail for Frank
 Vanbever
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

>>>>> "Frank" == Frank Vanbever <fvb@funkworks.be> writes:

 > Signed-off-by: Frank Vanbever <fvb@funkworks.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
