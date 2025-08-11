Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D6DC87FDB
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 10:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D54783DC1;
	Mon, 11 Aug 2025 10:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ipWxNSt9uGwp; Mon, 11 Aug 2025 10:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E69D83DC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E69D83DC3;
	Mon, 11 Aug 2025 10:02:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 514CF138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42F9E40871
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4J9u7qjdUhH for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 10:02:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F8A4408B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F8A4408B4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F8A4408B4
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:02:03 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1742296861; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Aug 2025 10:01:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ulPLq-0086BO-1q;
 Mon, 11 Aug 2025 12:01:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250807152907.3225581-1-thomas.perale@mind.be>
Date: Mon, 11 Aug 2025 12:01:58 +0200
In-Reply-To: <20250807152907.3225581-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Thu, 7 Aug 2025 17:29:06 +0200")
Message-ID: <877bzanpm1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Ncnu3eUiVjma4gfk6NZadblk+afWIHUEpFG+HtpOi1FX1I+jDmLoXGyAKuX0KnIO8tmSbL4s4qoR2v8ZSo011xpO5P4qK7kXpB5UAQJCsD/jWwXZLFkhv2uko2htkfFN56WQu65xeTj0MRD/jVexdz3hXyefcnyqo8s+ZOWmKOybOw6MPO4c/6xUisHSSqyBaGnkepDD3iXDrYptaYEaxWYM4zmW5iIENpC/CcQXA/+8HrVOQk8DeycLMg9DdSe4XoYf0bMtgvcMd7MofvyV6Y8A+apkAbM+jixjLSxUF/W1wgsAl+baGIQB1MhPDI/NS9U39E+3jm3hmPZQgpxBGA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=yg3dgF3o+x2tqszX4d95wDLK1nApdIpAPX9dJd/Ov5U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Ncnu3eUi
Subject: Re: [Buildroot] [PATCH 1/2] package/luajit: add CPE_VERSION &
 CPE_UPDATE
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > Since this package hasn't had a proper release in a while this patch set
 > the CPE_VERSION and CPE_UPDATE to the latest tags available.

 > The annotation available on NVD all refers to this last available
 > version `cpe:2.3:a:luajit:luajit:2.1.0:beta3:*:*:*:*:*:*`.

 > See https://nvd.nist.gov/vuln/detail/CVE-2020-15890 for instance.

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
