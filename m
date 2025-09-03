Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4892ACA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 17:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D64CF4115D;
	Wed,  3 Sep 2025 17:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSc2-CmzzYa8; Wed,  3 Sep 2025 17:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CC304117E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CC304117E;
	Wed,  3 Sep 2025 17:47:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30B02111
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 17:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2262384082
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 17:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IoQvlbo_6wBY for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 17:47:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6259840CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6259840CC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6259840CC
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 17:47:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 883325903
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Sep 2025 17:47:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1utrZV-0014Uo-1y
 for buildroot@buildroot.org; Wed, 03 Sep 2025 19:47:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20250829145902.3013340-1-peter@korsgaard.com>
Date: Wed, 03 Sep 2025 19:47:01 +0200
In-Reply-To: <20250829145902.3013340-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 29 Aug 2025 16:59:01 +0200")
Message-ID: <87v7lzl97u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=aBEXhzh+3dVwCdjYXb4TlyZRXpwRg+B2DbzRlAwUN0DlbHJQSVdpda6Muy1/ccljZmYLEvXW1NV+CjTB4l3S3DWjYqsf3cFcS0lj8BWa+8LQXmYGxrx3/hVRFvZ/OjHpku1+mcO2i6ry6Yv/EsGbF1UalyWM/Y+9wpibYn8Gaq+Lb4Sg4FRGP+uGxjyJvt/iVANU+JW5JdwVxev86V4MSksvzZ+W7Vk2VM5X0d1sgZHbEDw2WlTVTfZSYRdjEwFPRZuc3qGDhd1wphQrYWdEbY0A3uyuG8fE3r3yuScn/mDuOONmb428fbeUGskXRqsnBAbURH+9Tp4+if+9njUHKw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=7pjGlGD+WbkXP2d+w12XiXIt46IKl+DSltOjnyYmMKc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=aBEXhzh+
Subject: Re: [Buildroot] [PATCH] package/netstat-nat: remove package
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes http://autobuild.buildroot.net/results/bc52c072121286ddde3eee98ac28feb98f33dbbd/
 > The package has not been updated in 15 years (since commit 60ce1b0842de
 > "Bump netstat-nat to 1.4.10"), the upstream URL is gone and the package
 > fails to build on modern gcc versions because of missing prototypes, so drop
 > it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
