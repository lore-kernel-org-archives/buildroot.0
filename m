Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E432C369C5
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 19:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDD9560B22;
	Wed, 16 Apr 2025 19:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oORK1H4ApOuh; Wed, 16 Apr 2025 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 288B660BFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 288B660BFB;
	Wed, 16 Apr 2025 19:35:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E0626B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ADDC60BFB
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UimbSVMgP0c for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 19:35:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5CCB460F39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CCB460F39
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CCB460F39
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:35:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42D421FCEA;
 Wed, 16 Apr 2025 19:35:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1u58XZ-00CmV0-1x;
 Wed, 16 Apr 2025 21:35:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
References: <20250329200335.173377-1-thomas@devoogdt.com>
Date: Wed, 16 Apr 2025 21:35:21 +0200
In-Reply-To: <20250329200335.173377-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Sat, 29 Mar 2025 21:03:32 +0100")
Message-ID: <87plhb5286.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdejvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepvdetudeljeelhfevjeffjeefueeiieeffeekteffgeffgffhhfdvgefgjefggedunecuffhomhgrihhnpehflhhuvghnthgsihhtrdhiohdpghhithhhuhgsrdgtohhmnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhhohhmrghsseguvghvohhoghguthdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1] package/fluent-bit: bump to 3.2.10
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

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > News:
 > - https://fluentbit.io/announcements/v3.2.10/
 > - https://fluentbit.io/announcements/v3.2.9/
 > - https://fluentbit.io/announcements/v3.2.8/
 > - https://fluentbit.io/announcements/v3.2.7/
 > - https://fluentbit.io/announcements/v3.2.6/
 > - https://fluentbit.io/announcements/v3.2.5/
 > - https://fluentbit.io/announcements/v3.2.4/
 > - https://fluentbit.io/announcements/v3.2.3/

 > Drop the BUILD_SHARED_LIBS flag as it has been fixed by commit
 > https://github.com/fluent/fluent-bit/commit/47fd29ae7b9c393357e318831e0bf616c7856cde,
 > and more specific by commit
 > https://github.com/richgel999/miniz/commit/0ce345c44ad1852f29db12c1eb65a429038b2809.

 > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
