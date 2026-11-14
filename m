Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF11606A327
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qKDW8auH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=Ps5SvhnF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 177D660679;
	Sat, 14 Nov 2026 09:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 992QtY3xDB_Y; Sat, 14 Nov 2026 09:40:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 47C036069C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794649232;
	b=qmmlS56GXfNFD7ojIdCzvb4aRV3J9V4vCWrVtULwvR8rqGpJNY1b9EdCcK9zCkZlil+f
	 3xVBFnfYt3zfdijpdrp+NYVswbVmFVxAZLFUE9/uE1RDzAQa9c2yExWcJjQ4z3deCA87W
	 d7KyLgvt+3TysYg0/J+e00Ifrop68EdiwlzIT1tTQd3vW00/SNt1TvNQg2NhjPswsfzQ7
	 XiyHKt5exgrBwp+Ow7soWKqirYI5QPqB4oCh35FKQ76Gcoqol9VMm5KYWOCjFOz+0Yvfq
	 5V/BMfEl76U95peJ7zuGGapdfhc4Ua4bEny8STYPEBUg0fRHL/Uh8KjFRyTkdkVQKlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794649232;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vzCK5KbQWgmTBZKrJBldiuEDXI3vq77HsPzurJwlz+M=;
	b=boYC/2Oxb5YdsSKnPU9sX8kNgmhUjcKORIwDNfYu9D+aOlX2CseyOSOoMEDSTQ+xAR13
	 khIdZQpw4ruPPoLVYmMqXMn2ebwnaWPZ0EQUClJV4sWOEhTDDSVN3xF/P6ocke6jkd1Yb
	 FIaLgiEeApVLonf+JHHgBpsokiHXUmD1RFdEho9g5yGKnTW8+g8VgpV8aBDcZI1mRhTAH
	 6tBn+nVX/Qe1HmxXmeivs4MnRpL3/DCZTZqbw5Wb8xaTeDVFB3jDtK9zDr8UZb6Cx+ym7
	 uzCmnORxsO1VUthUND6aVgMJVDB3MfNPiXJFQ5BPgcp84MpVd7rdI78Ueq3o/CUcsKw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=Ps5SvhnF;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794649232;
	bh=vzCK5KbQWgmTBZKrJBldiuEDXI3vq77HsPzurJwlz+M=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qKDW8auHpj5qrv9Skd+nUVUsSlLbDfsfbWYP6sMRmk31B2nh/cjnVkQvS8UY71YTp
	 8IhMCSU/08r8WGA1T1fLEMSimP3BVt3QCnkXJsrQ1pAkrTi3ign3ffRCU3CZ861+dk
	 ZBWizZXL/eb7fR873Z4w3RFCn2qvh86CAgEik57f+r5V8m5T1gzK3t3dDyMhciBGg2
	 c8mvkeBPW6ntlshYZLeA63Lu9mqWt5fw0+LDkRn3vOunFveQI82oje/U0XUO9wNSZA
	 4urfxsSExqF1SmtNMstAz8pAdLXoGrtASH5j9vChqMdo4GzzoD63ihWgMyLZEI6q0G
	 Oo3TQ6L/Kkypw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47C036069C;
	Sat, 14 Nov 2026 09:40:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81AEA28C
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67EA26069C
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7PmW4yqhC-9 for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 09:40:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3C60760679
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Ps5SvhnF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C60760679
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:40:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Ps5SvhnFUl3s67nDtbiLJVH0Be4V1L8CC+EeAWUPgaRqYARvOrdeUol9WsBDsIyZBBDHADsoBUdRxlBELnToN9liqETJEuy9IhAu2qw2xyf1xc28HtIpf2VgZNX4+V6h/tGY72yCkzWV9AUtWn8TuKdY8IW+iyceuspG3ATCA3566c1SokB22xbXzB3sc9DLu2uKo5NNch5fcd1FEL/qyWCnor3UCJOEgf+apL1xPzefmhhhQQk4aLck7K7rr8t/flIQ9+vTHPJtNRsDI0IDhcsKBisCeKjZpWO+wAEJZttGLs7dZFUhyEYAvjhgpnXV/T/sPrHqHqKJpKxBbWhMJA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=jjoTabWYNU4vdyBPUfkzG+tvXtQBD+FderPUpnMGm6Y=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 419632160; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 14 Nov 2026 09:40:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xSAFE-00000005o06-053G;
 Sat, 14 Nov 2026 10:40:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yegor Yefremov via buildroot <buildroot@buildroot.org>
In-Reply-To: <20261112100822.3298943-1-yegorslists@googlemail.com> (Yegor
 Yefremov via buildroot's message of "Thu, 12 Nov 2026 11:08:22 +0100")
References: <20261112100822.3298943-1-yegorslists@googlemail.com>
Date: Sat, 14 Nov 2026 10:40:23 +0100
Message-ID: <87bj7rg394.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/prboom: fix build with GCC 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Yegor" == Yegor Yefremov via buildroot <buildroot@buildroot.org> writes:

 > Since autoconf 2.73, AC_PROG_CC enables C23 with -std=gnu23 when the
 > compiler accepts it, which GCC 14 does. As prboom is autoreconfigured,
 > it is then built in C23 mode, where false and true are keywords:

 > ../../src/doomtype.h:48:15: error: expected identifier before 'false'
 >    48 | typedef enum {false, true} boolean;
 >       |               ^~~~~

 > Commit 2eb72e7666 ("package/prboom: fix build w/ gcc-15") already
 > forces -std=gnu18 to avoid this, but only for GCC >= 15, where C23 is
 > the default. Apply it from GCC 14 on. With -std=gnu18 in CFLAGS, the
 > configure C23 check fails and -std=gnu23 is no longer added.

 > This issue has been present since commit a6e8c07a330a
 > ("package/autoconf: bump version to 2.73"), as autoconf 2.72 never
 > selected C23. It therefore affects 2026.08 and later. The 2026.05.x and
 > older maintenance branches still use autoconf 2.72 and are not
 > affected.

 > Fixes:
 > https://autobuild.buildroot.org/results/7d5050c54ba8319f0fd58336851121f5e127b1aa

 > Fixes: a6e8c07a330a389e9578d8f1110e41becac264d2 ("package/autoconf: bump version to 2.73")
 > Assisted-by: Claude:claude-opus-5-5
 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed, thanks.

Maybe the time has come to drop prboom? It is ancient and is also one of
the few packages using the old SDL (1.2.x) version.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
