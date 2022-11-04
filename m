Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931D0C433FE
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 08:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F9AC6102D;
	Fri,  4 Nov 2022 08:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F9AC6102D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DPf86vcL9G86; Fri,  4 Nov 2022 08:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 309F660FEF;
	Fri,  4 Nov 2022 08:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 309F660FEF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E4B91BF2AB
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 08:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD63E60FEF
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 08:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD63E60FEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCYJ_6-q9pJX for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 08:48:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 349E06063B
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 349E06063B
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 08:48:33 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 276D832008FA
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 04:48:28 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
 by compute3.internal (MEProxy); Fri, 04 Nov 2022 04:48:28 -0400
X-ME-Sender: <xms:29FkY0_p5u9UP7dXjeYc7_S6smYY7oxjGo-HBhgeTKbdsgmsDM-U_A>
 <xme:29FkY8tsuHm1HddNT_lIj3wIz_FoGn2d6r2TQjbz5wsbDDuQ_ZZarFnE671vxm_mb
 c65QLBMLszmQzSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddtgdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpedfffgrnhhilhhouceurghrghgvnhdfuceomhgrihhlsegusghr
 ghhnrdgthheqnecuggftrfgrthhtvghrnhepueevudevhedtgfethffhfeehjeehfeffie
 ekgfekiefhleegleeigedtgfeugeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhdp
 sghuihhlughrohhothdrnhgvthenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehmrghilhesuggsrhhgnhdrtghh
X-ME-Proxy: <xmx:29FkY6AMydFljKB6uVNpp-RYOd4s7_s_wOL46hj6Xtf-i8ohiMwSvw>
 <xmx:29FkY0eMVZxRntwmdnlIG0gZmWUc8N5cyQsJYcx96CXBUD4SpZVucw>
 <xmx:29FkY5NILIzdbVTfW0cS9Msr9ygFcoAZEKnWv_8edrrgJfe73JWzZw>
 <xmx:29FkY3tUHUnGKpWVNt-YeKFgiqnwZdr7kPwGSbns_-L1Xhn58RXn0g>
Feedback-ID: i1d444086:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 51D7431A0063; Fri,  4 Nov 2022 04:48:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1087-g968661d8e1-fm-20221021.001-g968661d8
Mime-Version: 1.0
x-forwarded-message-id: <cmu-lmtpd-383475-1667547569-2@sloti48n14>
Message-Id: <8732ac2d-8b91-4316-8983-95f1881ede13@app.fastmail.com>
Date: Fri, 04 Nov 2022 09:48:06 +0100
From: "Danilo Bargen" <mail@dbrgn.ch>
To: Buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dbrgn.ch; h=cc
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1667551707; x=1667638107; bh=pXCQffu/NgEs2Jz7QQXLpd9QsScTNh3VgmI
 QKYlVEms=; b=L3C/s8yj2Q+Hblez+o49YKMh3pII4qi2QvZ1xoiu1zYhbQ80yw6
 +ctqaU8MlfUE6Q0yJ+svPTUR2hh7dq+PsOyKLVgj/rn6fVbY1swUKROEWJV8zx/M
 KTKX6soGy+09kj6QtzByxNIzEzMDDvDiz3mmo5WawDd1+N1tFO68iA3qRKoz9hT9
 mmehCKNfgTzxRPv4MEK2wNpJ/xVsBYdJUptecvZX1NhePmT/FY/DI8eNkyC1yiKm
 Cg3gAGKq+9k6mIl6eaA2ch4VGqBYR7bxWPr7Dm7TEyLZpVb2rWxiCjzCrGsVcghv
 4OW4wluinDPNSmiVQPDmmcs3G78a2xwAM7Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667551707; x=
 1667638107; bh=pXCQffu/NgEs2Jz7QQXLpd9QsScTNh3VgmIQKYlVEms=; b=d
 +CyMQG7Ffc2GRM7ivu43qvhjoH2L3ssgd2cHSVTB27j0QG/lGI1k9ELToePG7v4y
 5Ydpwu7tQS422wMjismbK/64Sup06278c8wr9Gr6YyaKA/WLp+H4MUu47rIxRjBy
 uNVXy6yYMd+KNzkPOgAdVjSSpUEgYb/Gf6M6clFlkFmqEmZHnV8TYOgTztUm9GTR
 dyCt3VDiHsBJJCx6PF8VyXs9LlIM1IsNhU2YiwGhWAA44OMbiTirsPqjEbmerZjB
 Svz+zds5bthM8DS2onijXqL9VxnAOROzXHECkxEbVZ9Uu7ias0PFu6SRNxm/1M4m
 WY54iwEEAO1cELR3nbOOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dbrgn.ch header.i=@dbrgn.ch
 header.a=rsa-sha256 header.s=fm1 header.b=L3C/s8yj; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=d+CyMQG7
Subject: [Buildroot] Fwd: [autobuild.buildroot.net] Your daily results for
 2022-11-03
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Hi all

The package below does not currently build on MIPS because one of crypto libraries it depends on doesn't yet fully support that architecture: https://github.com/briansmith/ring/issues/562

Is there a way to exclude certain architectures for a package? What is the process for this?

Cheers,
Danilo

----- Original message -----
Betreff: [autobuild.buildroot.net] Your daily results for 2022-11-03
Datum: Freitag, 04. November 2022 08:39

Hello,

Autobuilder failures
====================

Below is a list of build failures reported by the Buildroot autobuilders
in relation to packages or CPU architectures you are in charge of.
Please help us improving the quality of Buildroot by investigating those
build failures and sending patches to fix them.

Results for the 'master' branch
-------------------------------

Build failures related to your packages:

    arch     |             reason             |                                       url                                      
-------------+--------------------------------+---------------------------------------------------------------------------------
    mips     |         tealdeer-1.6.1         | http://autobuild.buildroot.net/results/d4863f476de2a8b4c9d28ee52b1a48f5b0947c4b


Thanks for your contribution to Buildroot!

-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
