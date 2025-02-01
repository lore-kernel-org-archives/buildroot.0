Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E73C02192
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 16:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5299484D8A;
	Sat,  1 Feb 2025 16:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCHSqY3in72D; Sat,  1 Feb 2025 16:13:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A42E84D91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A42E84D91;
	Sat,  1 Feb 2025 16:13:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B743717D
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 16:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C18940111
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 16:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSo0m8luYghM for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 16:13:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A2916402B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2916402B1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2916402B1
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 16:12:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD7C644208;
 Sat,  1 Feb 2025 16:12:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1teG76-00A8JN-0S;
 Sat, 01 Feb 2025 17:12:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Andreas Ziegler <br015@umbiko.net>
Cc: buildroot@buildroot.org
References: <20250201134425.1786294-1-br015@umbiko.net>
Date: Sat, 01 Feb 2025 17:12:56 +0100
In-Reply-To: <20250201134425.1786294-1-br015@umbiko.net> (Andreas Ziegler's
 message of "Sat, 1 Feb 2025 14:44:25 +0100")
Message-ID: <877c69wsmv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptefgleevffevhedtveegfeejieduudeltdffheeggfelkeetkeetuddthfelieeunecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghrtdduheesuhhmsghikhhordhnvghtpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update version to 0.23.17
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

>>>>> "Andreas" == Andreas Ziegler <br015@umbiko.net> writes:

 > Version 0.23.17 change log: 
 > * protocol
 >   - "albumart" tries to send larger chunks if available
 >   - explicitly disallow "idle" and "noidle" in command lists
 > * storage
 >   - nfs: require libnfs 4.0 or later
 > * database
 >   - inotify: trigger update after symlink was created
 > * decoder
 >   - ffmpeg: prefer over sndfile and audiofile for its DTS-WAV support
 > * support libfmt 11.1

 > $ utils/check-package package/mpd/*
 > 914 lines processed
 > 0 warnings generated
 > $ utils/test-pkg -p mpd
 >                     bootlin-armv5-uclibc [1/6]: OK
 >                      bootlin-armv7-glibc [2/6]: OK
 >                    bootlin-armv7m-uclibc [3/6]: SKIPPED
 >                      bootlin-x86-64-musl [4/6]: OK
 >                       br-arm-full-static [5/6]: OK
 >                              arm-aarch64 [6/6]: OK
 > 6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 > Signed-off-by: Andreas Ziegler <br015@umbiko.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
