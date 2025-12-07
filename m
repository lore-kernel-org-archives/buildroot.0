Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521C1D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21C36406A0;
	Sun,  7 Dec 2025 16:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUwpI4ii-lOm; Sun,  7 Dec 2025 16:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5085400B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765124174;
	bh=eeFznPUTvC0tUrdxdVzQ/VtW5MXhL80/q8weyc/wxqs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYsJxUo3kJJY55Vc82LhRcs/m2AMMN+UqKpoqsejf2K2oODNBKI1GF32jEhS/vSI2
	 c+dQ9pi5bKSEmbREHGVy8U3irw2OjUSijkeRomcewM+iO0EUW0juj43huyl7cF9Q8Z
	 XZqMtZu2ErmXxU4waRnVpNCgFAleEgoAdBHKoWEKczX1yRb0UsJpHT//Y3j0AU7QS3
	 6bvXe0FLpk46RqSYgsMkuGV7OZNo4tAzOcfvKOkJOsIb2ZABY9k5FciQyhYdX9jTho
	 iXq10a2SiniYloJPvEMy4rQ51XEcIm/rNI08laIzXEfZC4YEc3PkzWBIGnimVnIXRA
	 vY3hitxH1MJOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5085400B0;
	Sun,  7 Dec 2025 16:16:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1737D151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09DAC40074
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNctZqaokznH for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:16:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AFAAD404E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFAAD404E6
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFAAD404E6
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:16:12 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 306162783; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 07 Dec 2025 16:16:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vSHQb-00000004UH3-2lsq;
 Sun, 07 Dec 2025 17:16:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251207115405.3489553-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 7 Dec 2025 12:54:05 +0100")
References: <20251207115405.3489553-1-bernd@kuhls.net>
Date: Sun, 07 Dec 2025 17:16:05 +0100
Message-ID: <87345mb73u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=o/bFyDMV+8fUxcwYNRi80SsaUHmH9OFJdH+6CuEG0bzJMrH3YdMlPsj5/so8jjYmIi1jTpsFo2jmMSwvJd+MkfbPBWBInUcEeDEPenqaIfq0tLkgrcrO6CcpQvTzEzKd+B5nGMCp9HSpBvZR7tGzkpd8hA/MkIrLO61BIFL9T1CV3NrCMj2MfMg7j61ukPtrZftvgKnHYFCanmcq9IjIPPlh4qYE0v3zgNDeQsyCkZiEzcvzrrVHAPm5MgT3JE/uV/1EnMwBTI6XBDxYMuiZkr6OcD5YLE3tJYeimGZXFWxqepFo/3sFwf9GkAQutKh+qelFzFjG0HNsmHE2sZRSbQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=xKyp2ZCNtDf8xQcZ/KLu+R9lO+ltNQKAQH+axfJBwuA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=o/bFyDMV
Subject: Re: [Buildroot] [PATCH 1/1] package/softhsm2: update SITE
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

 > Original site is down, unchanged tarball can be downloaded from github.
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
