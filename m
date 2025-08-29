Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8ACACA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 13:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BE6C8446A;
	Fri, 29 Aug 2025 13:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhE6tXuL6pXh; Fri, 29 Aug 2025 13:01:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4A0084437
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4A0084437;
	Fri, 29 Aug 2025 13:01:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E4966C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 405D261638
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qR1Wpf_mHCyh for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 13:01:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 201726161A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 201726161A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 201726161A
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:01:41 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1072161407; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 13:01:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uryjW-00CShR-28;
 Fri, 29 Aug 2025 15:01:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
References: <20250829112640.2631731-1-yegorslists@googlemail.com>
Date: Fri, 29 Aug 2025 15:01:34 +0200
In-Reply-To: <20250829112640.2631731-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Fri, 29 Aug 2025 13:26:40
 +0200")
Message-ID: <877bymjn81.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=HT5pIryi2qzWEsf1HeLT04ICtl+G8DBFEm/i9rlrgfO3lNb7OI30ZW47qv8SQw81cnUSux9CNt5UE9v3eiZEbIt22tpJ+0/nI1l4hcZ3PXssO4nSKhxtK7CCls9qpnrs1JRM4/knxOrZOxgRQH4ZB7avaDTfVnVJhJ4gB/mf0ptprTCfs84auKrV2RONPBMpUusRshSRA1EnO9WOWoVNTwXFVSElzFBGwx6bW1+oGQd9txW69eW8pvbiqThcWdED2vdcE4GIW8GlkTqWCXUdaGMo8Nku1aBR/vDQX+KuSK5SH1AtlFc2YIA+S5bhorLSFIzlcR2jrbDQ3xapyeOiOQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=UXpF/laz/pTyxd7vNP6XXFKKvPW4Xbts/fSEGetMg7Y=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=HT5pIryi
Subject: Re: [Buildroot] [PATCH] package/tcpreplay: bump to version 4.5.2
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

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > For change log, see:
 > https://github.com/appneta/tcpreplay/releases/tag/v4.5.2

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

I see this fixes gcc-15 build issues, so committed to master after
extending the commit message, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
