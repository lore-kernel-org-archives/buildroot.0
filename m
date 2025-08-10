Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27E8C87FDA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 18:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63D7A8244D;
	Sun, 10 Aug 2025 18:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5mLZnS8Ah2N; Sun, 10 Aug 2025 18:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7269F8246D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7269F8246D;
	Sun, 10 Aug 2025 18:41:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D426F31
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB42360F60
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znW3WUXF6P3C for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 18:41:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D86A60FC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D86A60FC0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D86A60FC0
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:41:01 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -190780266; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 10 Aug 2025 18:40:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ulAyV-006bKe-0V;
 Sun, 10 Aug 2025 20:40:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20250810124820.2116495-1-thomas.petazzoni@bootlin.com>
 <20250810124820.2116495-2-thomas.petazzoni@bootlin.com>
 <0ead42e3-6522-4f92-8a21-a8c8352375c2@smile.fr>
 <20250810175224.788ea11f@windsurf>
Date: Sun, 10 Aug 2025 20:40:55 +0200
In-Reply-To: <20250810175224.788ea11f@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 10 Aug 2025 17:52:24 +0200")
Message-ID: <875xevow94.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=di6iOtcCtb21M7YhBqG6UmHmSIvTuWSAyBXa8PccOE4DcKVHHpXe3Cni4KYqSh3VjqwxJgDq41PZLZhE8Whlce/O4zP0YetOC5BwcyKluWP6oJVhJKMfWQozQVDwNuATMHvpn6VYtLX7K+1tbd1hjyGK8lUAMIR7PvnhBma8BaGfjwTWUzZVBDb7+f6mqa04NhebHSXSBPjfpxbab5wZ5+GdeNtLCuWAnDUwoszhYX61ACtGnzP0x8hxzQAbiTsMbzvYQUp8xW4N764E4MUJ0hUKyWTCgocMKIk4j5hQSE2Gltve6Ri4m/ns2UGOxLOql2w6L98cwgvAzJK0nTP3HQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=h26mLQBF1h+WqAHwC9zixkEI3EUh7CcId/KxWcL69n0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=di6iOtcC
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts/gen-bootlin-toolchains:
 drop tweak for Microblaze bleeding-edge toolchains
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sun, 10 Aug 2025 16:11:09 +0200
 > Romain Naour <romain.naour@smile.fr> wrote:

 >> I guess you are referring to the pending patch from Neal Frager [1].
 >> 
 >> [1]
 >> https://patchwork.ozlabs.org/project/buildroot/patch/20250728045145.132333-1-neal.frager@amd.com/

 > Correct. This patch is pending for Buildroot master, but I did
 > integrate it into my toolchain build.

I wanted to apply this and get 2025.08-rc1 out - But if I read the
discussion correctly, gcc 15.x is broken on Microblaze even with that
patch, so what do we do?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
