Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51138CA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 215B341939;
	Wed,  3 Sep 2025 16:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 680vcmpmUTrZ; Wed,  3 Sep 2025 16:14:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 464DF41F94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 464DF41F94;
	Wed,  3 Sep 2025 16:14:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA77610E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E593E418BF
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZZY-z7wa89D for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:14:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1AD5941889
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AD5941889
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AD5941889
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:14:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -686685607; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Sep 2025 16:14:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1utq7i-000zfu-2f;
 Wed, 03 Sep 2025 18:14:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>
References: <20250903110048.441164-1-titouan.christophe@mind.be>
 <20250903110048.441164-2-titouan.christophe@mind.be>
Date: Wed, 03 Sep 2025 18:14:14 +0200
In-Reply-To: <20250903110048.441164-2-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Wed, 3 Sep 2025 13:00:47
 +0200")
Message-ID: <873493o6nd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=OMHOP6818oytqh/AM0ouSULOzuoZBi2C5mPAFlGRjwdG7CqoIGo4ycIlqMMorQ/y/q+ic3f6GddakID2xggVoQA4GvWGNkCnqgBqf7WQe3JnF8erAD3Xv9HWL+nwFVAJwfHQTm6dshOwWXGoW3H9i4eKhqI7vvFV/Bph0QYQoyEjf0cQYDmY9BWFZtxJapaO2JDZN5sKbJdQh2ertmO0ayW1hfj08LDgcmWzMIU3Cr1G8luMug0I2ep9Sl94Z1M1BMKSKMphEn8Ujn8EciqPFJTHpUXMh/ePVMO77J6/12KOh9lW624Mo0lwFzaD2F33B4LoGPpjdnYQXJdprlu2Yw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=+zkQWn/n9uZOzgRO1MnJXEa89MILPTAHbtxYzK1fMPo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=OMHOP681
Subject: Re: [Buildroot] [PATCH 1/2] package/wireshark: security bump to
 v4.2.13
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

>>>>> "Titouan" == Titouan Christophe via buildroot <buildroot@buildroot.org> writes:

 > See the release notes:
 > - https://www.wireshark.org/docs/relnotes/wireshark-4.2.12.html
 > - https://www.wireshark.org/docs/relnotes/wireshark-4.2.13.html

 > This fixes the following vulnerability:
 > - CVE-2025-5601:
 >     Column handling crashes in Wireshark 4.4.0 to 4.4.6 and 4.2.0 to
 >     4.2.12 allows denial of service via packet injection or crafted
 >     capture file
 >     https://www.cve.org/CVERecord?id=CVE-2025-5601

 > Also update hash for COPYING because of Wireshark commit
 > 614add27f29269e681e4d32138bea4951985fe0a that changes the FSF address

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
