Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08678C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAF2D81FC9;
	Tue,  4 Feb 2025 15:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zLtxWmiIYKD; Tue,  4 Feb 2025 15:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD3A882128
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD3A882128;
	Tue,  4 Feb 2025 15:46:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83E8412F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7339B60AD9
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7-PV_oPgJcD for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:46:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63CDB60A62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63CDB60A62
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63CDB60A62
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:46:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74901442A7;
 Tue,  4 Feb 2025 15:46:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tfL7r-00HLWK-28;
 Tue, 04 Feb 2025 16:46:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: donnel <donnel.lu@foxmail.com>
Cc: buildroot@buildroot.org
References: <tencent_9DBF881A0039B98D83D619FB287E59E9AA08@qq.com>
Date: Tue, 04 Feb 2025 16:46:11 +0100
In-Reply-To: <tencent_9DBF881A0039B98D83D619FB287E59E9AA08@qq.com> (donnel's
 message of "Mon, 6 Jan 2025 08:42:30 +0800")
Message-ID: <87frktk918.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheplefhiedutedvueelkeeitefhkeevvdeljeefgfdtkeejkeeiuefftedvtdegvdehnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepughonhhnvghlrdhluhesfhhogihmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/zlog: bump to version 1.2.18
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

>>>>> "donnel" == donnel  <donnel.lu@foxmail.com> writes:

 > This update brings zlog to the latest upstream release, 1.2.18, which
 > includes several bug fixes and improvements. All existing patches have
 > been reviewed for relevance to this new version. Patches that are no
 > longer applicable have been removed, and necessary changes have been
 > made to ensure compatibility with the updated library.

 > Signed-off-by: donnel <donnel.lu@foxmail.com>

Please use your full name in from / signed-off-by. This description
sounds odd to me as we don't have any zlog patches / this patch doesn't
drop any files.

Furthermore I see that zlog 1.2.18 is a security bump, fixing a "severe"
security vulnerability, so the bump should be marked as such so it gets
backported the LTS release:

https://github.com/advisories/GHSA-6q5p-rp5c-wmph

I have added a commit doing that here:

https://gitlab.com/buildroot.org/buildroot/-/commit/750dca24e6e8cff7ad1b00b737b2a26d083c3e9a

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
