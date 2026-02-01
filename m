Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66DBE65298
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 752AB606C9;
	Sun,  1 Feb 2026 20:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wxu-a7Mpw_jC; Sun,  1 Feb 2026 20:56:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99F0C60785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769979370;
	bh=2Pqe+GrEugyMXoRF81w0Idwrzs/locPESUXuvuKT0Ik=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Grkv0Y7yeD19Ut9gfpRbZm5y0pwAplg9001VVh4yVZ0O++omun+ONivKR9KRQkzKH
	 JtQB5BMWmFGyaz+JGvleqiwFb5Jt0w6vdLPP54H+U1i5MqyY4iNYfAlaXA/4+vR1Pb
	 2KtlrmPFXx+NpBeDWircZnQlxOdRcQODKcTL5O6XSO2GajqtNl9MSanz3d4sn247kk
	 OQHN8rkEv2lAprbs1bQe5N79x1uZbokfVkq4MotyRwCTaFVLbUvmugUr3jqvRG6Ysp
	 cOI+IqSI42cEA7Ch0xbdGeWz75HFX5eEs7wTlyJeILgioG/8ZtqDY8XVDhm/iFgUMa
	 XTKG7IXKsOsKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99F0C60785;
	Sun,  1 Feb 2026 20:56:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2401023E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 074FE4010B
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lECbRrLT3ems for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2B3440084
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2B3440084
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2B3440084
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:56:07 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1491789248; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 20:56:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmeUD-00000005kjB-2ihw;
 Sun, 01 Feb 2026 21:56:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Patrik Olsson <johan.patrik.olsson@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260131221536.385918-1-johan.patrik.olsson@gmail.com> (Patrik
 Olsson's message of "Sat, 31 Jan 2026 23:15:36 +0100")
References: <20260131221536.385918-1-johan.patrik.olsson@gmail.com>
Date: Sun, 01 Feb 2026 21:56:01 +0100
Message-ID: <87sebk89pa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=pvzJ8USF0BPCFFCcOXTZ3/3Nd9cTCykZqs5r0HujkFVvwfs6MVdC/UFAF383t2lGRD+/vWI6muOQgMDxNjiIL+Jpzvn5e2GxwQqt1qi8a1gz8yK3Xxw4YzisCbVCWOcKK/EdzwyQ9dzWkiNvHRUIx6ta92QLQjUvlML3M9KbOPOtGZX3l+VueVr8tCb+1yBzIxnQINpraQFaxKGG1dEl+dp5MtHjJGpSttBp1UUFkmFQAb0VBu+UPurWyc3nw7E92T5bN+qglgrhUxec5oKj4QQkCGPhiVw+SkWyKTflh1RMTjFqOiiNZg15zDLvr2zcgZK+P1tj7UVQLxGa0Q/EkA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=XG/VjqKgj9cMaf5GJcW4UMXRANS1BBhJyNQPTEbkUlI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=pvzJ8USF
Subject: Re: [Buildroot] [PATCH 1/1] configs/friendlyarm_nanopi_r3s: bump
 Linux to 6.18.8 and U-Boot to 2026.01
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

>>>>> "Patrik" == Patrik Olsson <johan.patrik.olsson@gmail.com> writes:

 > This patch bumps the Linux kernel to version 6.18.8 and U-Boot to version 2026.01.
 > Tested on FriendlyElec NanoPi R3S.

 > Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
