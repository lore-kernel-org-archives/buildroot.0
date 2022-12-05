Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDA4C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 06:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 022E9403E2;
	Mon,  5 Dec 2022 06:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 022E9403E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnKe4cfEf3dN; Mon,  5 Dec 2022 06:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 452B14047C;
	Mon,  5 Dec 2022 06:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 452B14047C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF9B21BF2A0
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 06:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A503260BC7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 06:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A503260BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LfoBbc-nhXtg for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 06:52:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D087560AA0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D087560AA0
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 06:52:30 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0948D5C0067
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 01:52:26 -0500 (EST)
Received: from imap48 ([10.202.2.98])
 by compute6.internal (MEProxy); Mon, 05 Dec 2022 01:52:26 -0500
X-ME-Sender: <xms:KZWNY17f9iol2RfkJvEBy3GAA8w7_z5qFXgDc8KlSEB4HW9kESDKKw>
 <xme:KZWNYy6rac7Keucie8Aka5gwhgu3rd4ksxvb9pQmE6Wj3O-JcUmmI5lL_09zI7FlH
 WvhoxwSHkweZbtb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpedfffgrnhhilhhouceurghrghgvnhdfuceomhgrihhlsegusghr
 ghhnrdgthheqnecuggftrfgrthhtvghrnhepheehveekjedvhedvheduieehteffveetve
 evgeekuefgfeegkedvieejveehgfeunecuffhomhgrihhnpehgihhthhhusgdrtghomhdp
 sghuihhlughrohhothdrnhgvthdpsghuihhlughrohhothdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghilhesuggsrhhgnhdr
 tghh
X-ME-Proxy: <xmx:KZWNY8eOkXwmAh8QfgE3pg4m77UijV5o8yffh4hq4qV_4m4ftXvCIw>
 <xmx:KZWNY-IAmEZ20rgKUYXWL1KxFoXfOpV3Rhr133lO8RN4dvN5-ez1ig>
 <xmx:KZWNY5IwH6hGHToV11FVBDQCWFx7Lf0NQzoudRezYiGzfvZyyoZxaw>
 <xmx:KpWNY8aXcFjFPCkFJbVeugzc-S4tU3jpP9mO35w3gRjFmcpWk3XrMw>
Feedback-ID: i1d444086:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 91E9531A0063; Mon,  5 Dec 2022 01:52:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <b0cf6b84-b0ce-4c51-8ed3-54bcfd1c8ef6@app.fastmail.com>
Date: Mon, 05 Dec 2022 07:52:05 +0100
From: "Danilo Bargen" <mail@dbrgn.ch>
To: Buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dbrgn.ch; h=cc
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1670223146; x=1670309546; bh=xs59ukUzQZYZsvIqTP127VDyv+rIu46d5qt
 0ymLsMZA=; b=pI/LH+zh9PfjK0QoGudJA/tXQiS/5fL04SH6xG0HYIps7jj8C7D
 JT1FNdOX8DKkdOi3jDs/dcwsRp7AVIww0JVW6O7Hs5EB9htzJgU4CrFmlEzeR+zq
 QPMxAJJJrXdJviwrqowHVF6jCj9s/rTCIveFOgcfMCAVyCJxW1XC0iNd3IzV71/H
 XKBu7cwPljeHtBwNIntdjVj9fKs7EiXBkzJXSzVJQ5SOV7QZsEtm4aQYcj862b7K
 yk+QA7wyop8G7YknlrhC3AayBtc8Bb5p4sFdf0m6thWgSF1Ybv7LutmoFQfXi/82
 uZZEmYEWpTQr1klMd9PpIMIl61sw4HojH3A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670223146; x=
 1670309546; bh=xs59ukUzQZYZsvIqTP127VDyv+rIu46d5qt0ymLsMZA=; b=b
 NlgOYcUrBPnWcOqmm8iVh/OjUL5D2pv17HxNfnsyy6ZDz7KEW0zYfe302ZVxJtUx
 jRh1h40MTGBr/QHeKyjAeAyjKkhBK3QAY5/us3uXH/Z+1dpe3ESD3wELzoi5kKQr
 SSYi2ygoEVcaQnojKtcSOJvTb0Ig9WhfJVVcDneOv0OO1uEjWTrspPZtLkgcG9NT
 qHXp/MkXCsfTbTRzUbyiK45GCRPLy6yBoJv3hxIcWYjlS1pFHMnFqmt7VCAH0urH
 sR8kuOwc94hQDM9lUpGkskIvpym7mpM6SHGlBlD970cUDN9ms/Fj1WgQUHE+zWhd
 qPPOzHC5gpWOE7ReR8pMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dbrgn.ch header.i=@dbrgn.ch
 header.a=rsa-sha256 header.s=fm2 header.b=pI/LH+zh; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=bNlgOYcU
Subject: [Buildroot] Excluding certain architectures for a package
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
