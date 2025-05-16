Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A99C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 21:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CF186070F;
	Fri, 16 May 2025 21:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoANOUIBYaq3; Fri, 16 May 2025 21:24:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47DAE60780
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47DAE60780;
	Fri, 16 May 2025 21:24:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6769B1DE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58F5060723
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A28TuqLvyj9e for <buildroot@buildroot.org>;
 Fri, 16 May 2025 21:24:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EC8560780
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EC8560780
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EC8560780
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:24:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7958F43846;
 Fri, 16 May 2025 21:24:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uG2XR-00Bsg8-3A;
 Fri, 16 May 2025 23:24:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Paul Argue <pargue@gmail.com>
Cc: buildroot@buildroot.org,  Guillaume William Brs
 <guillaume.bressaix@gmail.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  James Hilliard
 <james.hilliard1@gmail.com>,  "Yann E . MORIN" <yann.morin.1998@free.fr>
References: <20250303193812.2501444-1-pargue@gmail.com>
Date: Fri, 16 May 2025 23:24:17 +0200
In-Reply-To: <20250303193812.2501444-1-pargue@gmail.com> (Paul Argue's message
 of "Mon, 3 Mar 2025 14:38:10 -0500")
Message-ID: <87plg82qri.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptefgleevffevhedtveegfeejieduudeltdffheeggfelkeetkeetuddthfelieeunecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggshedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehprghrghhuvgesghhmrghilhdrtghomhdprhgtphhtthhopehguhhil
 hhlrghumhgvrdgsrhgvshhsrghigiesghhmrghilhdrtghomhdprhgtphhtthhopehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhmpdhrtghpthhtohephigrnhhnrdhmohhrihhnrdduleelkeesfhhrvggvrdhfrh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2024.02.x 1/3] package/libxcrypt: support
 host package build
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

>>>>> "Paul" == Paul Argue <pargue@gmail.com> writes:

 > From: James Hilliard <james.hilliard1@gmail.com>
 > This is needed by host-systemd.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > [yann.morin.1998@free.fr: set the host _CONF_OPTS]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Paul Argue <pargue@gmail.com>

NIT: Backports should use git cherry-pick -x <commit> for easier
tracking, E.G. this looks to be from commit 305abd7a302a78.

Sorry, in the mean time the 2024.02.x series is EOL, so there will be no
new releases done of that series. Please move to the 2025.02.x series
instead.

I have therefore marked this series as rejected in patchwork.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
