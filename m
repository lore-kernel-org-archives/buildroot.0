Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEDDC35FFC
	for <buildroot@archiver.kernel.org>; Sat, 22 Mar 2025 07:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05AD2606B3;
	Sat, 22 Mar 2025 07:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-6nVl7M8oTW; Sat, 22 Mar 2025 07:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B719608AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B719608AB;
	Sat, 22 Mar 2025 07:29:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F860E2
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 07:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85C65402C7
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 07:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSonNveNl3mi for <buildroot@buildroot.org>;
 Sat, 22 Mar 2025 07:29:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 44CF040139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44CF040139
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44CF040139
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 07:29:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1A16441B3;
 Sat, 22 Mar 2025 07:29:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tvtIh-00DmOs-2u;
 Sat, 22 Mar 2025 08:29:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  James Hilliard
 <james.hilliard1@gmail.com>,  Thomas Devoogdt <thomas.devoogdt@barco.com>,
 buildroot@buildroot.org,  Adrian Perez de Castro <aperez@igalia.com>
References: <20240917203311.1241557-1-thomas@devoogdt.com>
 <20241216181719.770389-1-thomas@devoogdt.com>
 <20241216181719.770389-2-thomas@devoogdt.com>
 <CACXRmJg8bzXKbHT48Ej8iUz3yzT18u3AtXep2-WVYKpsoTFyaQ@mail.gmail.com>
 <CACXRmJgAN=rDPQOtTufT0D7uWDp9o_W1xGN5EW6B_XFuQeR77Q@mail.gmail.com>
 <CACXRmJi-K=k+bwwhtVEjAOc6wEJaS1rg_5cDFwMY2nZmR24KVQ@mail.gmail.com>
 <20241229230256.609289ea@windsurf>
 <CACXRmJi=rGj9uA6R3fQ45sKuSy_+=Vi6u_Vdn_koVd4DkWZj8w@mail.gmail.com>
 <20250106163949.5c49b568@windsurf>
 <CACXRmJhFhN_97jrhsHZJKF1NoLHke+u1Ux3T_6em8UV4ZkbndQ@mail.gmail.com>
 <87o6y6dqe5.fsf@dell.be.48ers.dk>
Date: Sat, 22 Mar 2025 08:29:47 +0100
In-Reply-To: <87o6y6dqe5.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 12 Mar 2025 20:01:54 +0100")
Message-ID: <87r02p5xqs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheeffeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptefgleevffevhedtveegfeejieduudeltdffheeggfelkeetkeetuddthfelieeunecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepthhhohhmrghsseguvghvohhoghguthdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdguvghvohhoghguthessggrrhgtohdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoo
 hhtrdhorhhgpdhrtghpthhtoheprghpvghrvgiisehighgrlhhirgdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 2/2] package/webkitgtk: bump to 2.46.4
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

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
 >> Hi Thomas, All,
 >> In the meantime, Peter merged the pkgconf patch [1] [2]. No real
 >> issues were reported since. So I expect that this webkitgtk bump can
 >> be reconsidered. In the meantime, version 2.46.6 has been released
 >> [3]. I can have a look to bump further. But I would like to have this
 >> one merged first, since I've tested it. Also, beware that webkitgtk
 >> will release 2.48 soon, and having the buildroot 2025.02 LTS still on
 >> 2.44 seems a bit odd to me.

 > That and the fact that 2.44.x has a number of known security issues.

 > Committed, thanks.

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
