Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889ABEDEBF0
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 21:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0B204190C;
	Tue,  3 Mar 2026 21:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8fkJt73a-aC; Tue,  3 Mar 2026 21:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C645A40CD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772571994;
	bh=PUUoWmYwiC8MAAR1IEQjJ7SCR8DdqUZj779czyfnDHg=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=o1efjyaWTl2WTOkH2/GgaSulRcXztquAaVutgGIUNe/AL9IZCBb8m7SjIvTW1II/I
	 3hXZ49ubcuAcWNJ1LX84OIZSHya7xMNSWeAqHNnqwnDbOE8svuoswL92WXpDEgw77j
	 YDlOg+VN3lQzfJlrrvP7bV9P6SesXNRS1sFVU58Gi0/yfbGBMvZruOXzCsDHvYBCSe
	 /ltRBVz/0Cj6KseU4X1eNtkeoaczPtUXDVZKkpIdlVTKYw+rR3c2uz2jg7Sf/E1bdj
	 z0t5UVvt59LPabKuxiXBuwIh1Lm2Zs0GEzY3LHZQMJipnhsUzWTV9pHNNtQwhtm/sA
	 5JFIGjCDjuqbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C645A40CD0;
	Tue,  3 Mar 2026 21:06:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42894231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 340C240202
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftZcJTtseP4w for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 21:06:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 35D35401EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35D35401EB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35D35401EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:06:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1841283676; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Mar 2026 21:06:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vxWwj-0000000GlzH-3YTA;
 Tue, 03 Mar 2026 22:06:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20260303105825.1234428-2-neal.frager@amd.com> (Neal Frager's
 message of "Tue, 3 Mar 2026 10:58:24 +0000")
References: <20260303105825.1234428-1-neal.frager@amd.com>
 <20260303105825.1234428-2-neal.frager@amd.com>
Date: Tue, 03 Mar 2026 22:06:25 +0100
Message-ID: <87o6l4ipwu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Rvoq8kYzV5D7Hac9c73BuzCJwLE8r29+oQ3yNw8rTIKGPc+sEjaK0SsVty9i067L4ddblgktLvMDF/j3k7ygDuC67mpGd2Oq2cRLM3syfvPYmaOSp0zLEXOquyT1kV1m+iqA7Sf4txN3eO+Zk8iLT88rNxXqRum4zZZ7AYQM1n39ZbFGY5N5PjDMGs26e85YfksemCNae5q2FTwLvJNHURGGc/DPxvo4o/MgYQaZRZtdyDPHw/SgPuCt5XJNpgxIRhcObWnlt6n4DD/7nayPj54fVf8GaguYnvf5mRBgKBQCZKodw1mFaclKWmvSidecgPw80mO6FxB16r9yMY/1Kg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=PGLXihYxviRLtTXGJ8fxAD5kraywNZZwBti7zHNgmEw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Rvoq8kYz
Subject: Re: [Buildroot] [PATCH v1 2/2]
 board/xilinx/arm-trusted-firmware.hash: add license file hashes
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
Cc: kory.maincent@bootlin.com, yann.morin@orange.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 buildroot@buildroot.org, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Now that custom arm-trusted-firmware versions can specify license files, add
 > license file hashes for the Xilinx custom arm-trusted-firmware version.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
