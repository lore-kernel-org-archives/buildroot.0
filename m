Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5A2C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 19:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42DCF60E50;
	Sun, 18 May 2025 19:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4p69rVreMct; Sun, 18 May 2025 19:09:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6096A60E52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6096A60E52;
	Sun, 18 May 2025 19:09:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 864B3193
 for <buildroot@buildroot.org>; Sun, 18 May 2025 19:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5DC881EF7
 for <buildroot@buildroot.org>; Sun, 18 May 2025 19:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huylJwqF5xCp for <buildroot@buildroot.org>;
 Sun, 18 May 2025 19:09:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 647D880DF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 647D880DF1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 647D880DF1
 for <buildroot@buildroot.org>; Sun, 18 May 2025 19:09:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A96E343B28;
 Sun, 18 May 2025 19:09:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uGjO7-000KFi-1Y;
 Sun, 18 May 2025 21:09:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
References: <20250517202418.3516858-1-peter@korsgaard.com>
Date: Sun, 18 May 2025 21:09:31 +0200
In-Reply-To: <20250517202418.3516858-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 17 May 2025 22:24:17 +0200")
Message-ID: <87ecwlenx0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudelfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepudduhfelveehgffgheehudehgfevffdtudetfeeuteehudduleehjedviedugeeunecuffhomhgrihhnpeifvggskhhithhgthhkrdhorhhgnecukfhppeekledrgeejrddvvddurdegjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekledrgeejrddvvddurdegjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrphgvrhgviiesihhgrghlihgrrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: security bump to version
 2.48.2
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

 > Fixes the following security issues:
 > CVE-2025-24223
 >     Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
 >     Credit to rheza (@ginggilBesel) and an anonymous researcher.
 >     Impact: Processing maliciously crafted web content may lead to
 >     memory corruption. Description: The issue was addressed with
 >     improved memory handling.
 >     WebKit Bugzilla: 287577

 > CVE-2025-31204
 >     Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
 >     Credit to Nan Wang (@eternalsakura13).
 >     Impact: Processing maliciously crafted web content may lead to
 >     memory corruption. Description: The issue was addressed with
 >     improved memory handling.
 >     WebKit Bugzilla: 291506

 > CVE-2025-31205
 >     Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
 >     Credit to Ivan Fratric of Google Project Zero.
 >     Impact: A malicious website may exfiltrate data cross-origin.
 >     Description: The issue was addressed with improved checks.
 >     WebKit Bugzilla: 290992

 > CVE-2025-31206
 >     Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
 >     Credit to an anonymous researcher.
 >     Impact: Processing maliciously crafted web content may lead to an
 >     unexpected Safari crash. Description: A type confusion issue was
 >     addressed with improved state handling.
 >     WebKit Bugzilla: 290834

 > CVE-2025-31215
 >     Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
 >     Credit to Jiming Wang and Jikai Ren.
 >     Impact: Processing maliciously crafted web content may lead to an
 >     unexpected process crash. Description: The issue was addressed with
 >     improved checks.
 >     WebKit Bugzilla: 288814

 > CVE-2025-31257
 >     Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
 >     Credit to Juergen Schmied of Lynck GmbH.
 >     Impact: Processing maliciously crafted web content may lead to an
 >     unexpected Safari crash. Description: This issue was addressed with
 >     improved memory handling.
 >     WebKit Bugzilla: 290985

 > https://webkitgtk.org/security/WSA-2025-0004.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
