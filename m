Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4C0C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 07:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4020F834C7;
	Tue, 15 Apr 2025 07:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EG9a3ykGGops; Tue, 15 Apr 2025 07:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BFC2832EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BFC2832EA;
	Tue, 15 Apr 2025 07:24:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85636200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 07:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B0CD60703
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 07:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqg5SN86g5xM for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 07:24:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B27760655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B27760655
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B27760655
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 07:24:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C04FD1FCE8;
 Tue, 15 Apr 2025 07:24:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1u4aex-0084Tx-0V;
 Tue, 15 Apr 2025 09:24:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Robert Smigielski <ptdropper@gmail.com>, Thomas Perale
 <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
References: <CABWt4euwWJ=D11Rm4rkXhccnm7x7EguHeyy2AmBJRNMnrneziA@mail.gmail.com>
Date: Tue, 15 Apr 2025 09:24:43 +0200
In-Reply-To: <CABWt4euwWJ=D11Rm4rkXhccnm7x7EguHeyy2AmBJRNMnrneziA@mail.gmail.com>
 (Robert Smigielski's message of "Mon, 7 Apr 2025 17:08:26 -0400")
Message-ID: <87plhdanus.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddvkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepkeegffdtieevkeejheevteeludetveeffedutedvkeefjeehiedtvdfhkeffueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehpthgurhhophhpvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesmhhinhgurdgsvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] Buildroot 2025.02 released
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

>>>>> "Robert" == Robert Smigielski <ptdropper@gmail.com> writes:

Hi Robert,

 > Hi Buildroot team
 > I run a tiny open source project that also supports CycloneDX SBOM
 > generation for Buildroot. I was part of this email channel but had to
 > drop for work reasons.
 > Glad to be back and offer support. The project I participate with is
 > https://github.com/CycloneDX/cyclonedx-buildroot/ and would like to
 > coordinate with you.

Sorry for the slow response, things have been kind of busy here.

Thanks for reaching out! I have used cyclonedx-buildroot in the past
myself. Regarding coordination, can you give an overview of what the
delta is in the output from cyclonedx-buildroot and our
utils/generate-cyclonedx script? I have added Thomas, author of
generate-cyclonedx here as well.

For Buildroot, having a solid SBOM story out of the box is quite nice,
so I would personally prefer to extend generate-cyclonedx if anything is
missing.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
